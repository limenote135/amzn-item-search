import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/properties.dart';
import 'package:amasearch/controllers/search_item_controller.dart';
import 'package:amasearch/controllers/search_settings_controller.dart';
import 'package:amasearch/models/camera_read_data.dart';
import 'package:amasearch/models/enums/search_type.dart';
import 'package:amasearch/pages/search/common/route_from.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/error_report.dart';
import 'package:amasearch/widgets/payment.dart';
import 'package:fast_barcode_scanner/fast_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vibration/vibration.dart';

import 'camera_scan_overlay_shape.dart';
import 'code_filter_rect.dart';
import 'item_tile.dart';

class CameraPage extends ConsumerWidget {
  const CameraPage({super.key});

  static const routeName = "/search/camera";

  static Future<Route<void>?> route(BuildContext context) async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const CameraPage(),
      );
    }
    await showOkAlertDialog(
      context: context,
      barrierDismissible: false,
      title: "エラー",
      message: "バーコードリーダーを利用するためにはカメラの利用を許可する必要があります。\n"
          "OSの設定アプリからamzn-item-searchに対してカメラの利用を許可してください。",
      okLabel: "戻る",
    );
    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: SafeArea(
        child: _Body(),
      ),
    );
  }
}

class _Body extends ConsumerStatefulWidget {
  const _Body();

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends ConsumerState<_Body> {
  static const _rectOfInterest = CodeFilterRect();

  final _controller = CameraController();

  Widget? customPaint;

  var _isFlashOpen = false;

  var isBusy = false;

  var _lastRead = <CameraReadData>[];

  double _minAvailableZoom = 1;
  double _maxAvailableZoom = 1;
  double _currentScale = 1.5;
  double _baseScale = 1;

  // Counting pointers (number of user fingers on screen)
  int _pointers = 0;

  // error handling
  bool hasError = false;
  String? error;

  @override
  void initState() {
    super.initState();
    _controller.events.addListener(onInitialized);
  }

  @override
  void dispose() {
    _controller.events.removeListener(onInitialized);
    // ignore: lines_longer_than_80_chars
    // Android では dispose 時に PlatformException(NOT_INITIALIZED, Camera has not been initialized, null, null)  が発生するので dispose しない
    if(Platform.isIOS) {
      _controller.dispose();
    }
    super.dispose();
  }

  void onInitialized() {
    if (!mounted || !context.mounted) {
      return;
    }
    if (_controller.state.hasError) {
      setState(() {
        recordError(
          _controller.state.error,
          null,
          information: const ["onCameraInitialized"],
        );
        hasError = true;
        error = _controller.state.error?.toString();
      });
    }
    if (_controller.state.isInitialized) {
      initZoomLevel();
      _isFlashOpen = _controller.state.torchState;

      _controller.events.removeListener(onInitialized);
    }
  }

  Future<void> initZoomLevel() async {
    await Future.wait<void>([
      _controller.getMaxZoomLevel().then((value) => _maxAvailableZoom = value),
      _controller.getMinZoomLevel().then((value) => _minAvailableZoom = value),
      _controller.setZoomLevel(1.5),
    ]);
  }

  SearchType suggestType(String result) {
    if (result.startsWith("45") ||
        result.startsWith("49") ||
        result.startsWith("978")) {
      // JAN コードと思われる
      // 978 は書籍の ISBN コード
      return SearchType.jan;
    }

    if ((result.length == 17 || result.length == 18) &&
        result.startsWith("0") &&
        int.tryParse(result) != null) {
      // ブックオフは17ケタか18ケタで恐らく "00" 始まりの数値のみ
      return SearchType.bookoff;
    }

    if (result.startsWith("c") && result.endsWith("c")) {
      // 最初と最後が "c" ならゲオコード
      return SearchType.geo;
    }

    return SearchType.jan;
  }

  void onViewFinderTap(TapDownDetails details, BoxConstraints constraints) {
    if (!_controller.state.isInitialized) {
      return;
    }

    final offset = Offset(
      details.localPosition.dx / constraints.maxWidth,
      details.localPosition.dy / constraints.maxHeight,
    );
    _controller.setFocusPoint(offset.dx, offset.dy);
  }

  void _handleScaleStart(ScaleStartDetails details) {
    _baseScale = _currentScale;
  }

  Future<void> _handleScaleUpdate(ScaleUpdateDetails details) async {
    // When there are not exactly two fingers on screen don't scale
    if (!_controller.state.isInitialized || _pointers != 2) {
      return;
    }

    _currentScale = (_baseScale * details.scale)
        .clamp(_minAvailableZoom, _maxAvailableZoom);

    await _controller.setZoomLevel(_currentScale);
  }

  static final BoxDecoration _borderBox = BoxDecoration(
    border: Border.all(color: Colors.white),
    borderRadius: BorderRadius.circular(5),
  );

  List<Barcode> _filterBarcodes(List<Barcode> codes) {
    // 書籍の2段目バーコードは13桁で 192 から始まる
    // このバーコードから情報は取れないので無視する
    final codes2 =
        codes.where((e) => e.value.length != 13 || !e.value.startsWith("192"));

    final analysisSize = _controller.analysisSize;
    final previewSize = context.size;
    if (analysisSize != null && previewSize != null) {
      return codes2
          .where(
            _rectOfInterest.codeFilter(
              analysisSize: analysisSize,
              previewSize: previewSize,
            ),
          )
          .toList();
    } else {
      return codes2.toList();
    }
  }

  bool shouldProcess(String code) {
    if (_lastRead.isEmpty) {
      // 初めて読んだ場合は処理する
      return true;
    }
    if (_lastRead[0].code == code) {
      // 同じコードを連続して読んだ場合は無視する
      return false;
    }
    if (_lastRead.length > 1 && _lastRead[1].code == code) {
      // 1つ前のコードと同じコードで、それが1秒以内に読まれたものだったら無視する
      // カメラに2つのバーコードが映ってしまい、交互に読まれてしまっている場合など
      return DateTime.now().difference(_lastRead[1].readAt) >
          const Duration(milliseconds: 1500);
    }
    return true;
  }

  void _handleBarcode(List<Barcode> codes, {required bool isPaidUser}) {
    if (codes.isEmpty) {
      return;
    }
    final targets = _filterBarcodes(codes);
    if (targets.isEmpty) {
      return;
    }
    final result = targets[0].value.trim();

    if (!shouldProcess(result)) {
      return;
    }

    Vibration.vibrate(pattern: [0, 100], intensities: [0, 255]);
    final settings = ref.read(searchSettingsControllerProvider);
    final type = isPaidUser ? suggestType(result) : settings.type;
    if (type != settings.type) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${type.toDisplayString()} のコードとして検索します"),
          duration: const Duration(seconds: 1),
        ),
      );
      setState(() {
        ref.read(searchSettingsControllerProvider.notifier).update(type: type);
      });
    }
    switch (type) {
      case SearchType.jan:
        ref.read(searchItemControllerProvider.notifier).add(result);
      case SearchType.bookoff:
        ref.read(searchItemControllerProvider.notifier).addBookoff(result);
      case SearchType.geo:
        ref.read(searchItemControllerProvider.notifier).addGeo(result);
      case SearchType.tsutaya:
        ref.read(searchItemControllerProvider.notifier).addTsutaya(result);
      case SearchType.freeWord:
    }

    if (!settings.continuousCameraRead) {
      Navigator.of(context).popUntil(ModalRoute.withName("/"));
    }
    if (mounted) {
      setState(() {
        _lastRead.insert(
          0,
          CameraReadData(code: result, readAt: DateTime.now()),
        );
        // 今読んだものと、その1つ前のもののみ残す
        _lastRead = _lastRead.take(2).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(searchSettingsControllerProvider);
    final continuousRead = settings.continuousCameraRead;
    final type = settings.type;

    final isPaidUser = ref.watch(isPaidUserProvider);

    ref.listen(searchSettingsControllerProvider, (_, __) {
      // コードタイプを変更した際に lastRead をリセットする
      _lastRead = <CameraReadData>[];
    });

    if (hasError) {
      return _ErrorMessage(error: error ?? "不明なエラー");
    }

    return BarcodeCamera(
      types: const [
        BarcodeType.ean8,
        BarcodeType.ean13,
        BarcodeType.code128,
        BarcodeType.codabar,
      ],
      resolution: Resolution.hd1080,
      mode: DetectionMode.continuous,
      apiMode: IOSApiMode.visionStandard,
      onScan: (codes) => _handleBarcode(codes, isPaidUser: isPaidUser),
      children: [
        // スキャン対象範囲を表示したい場合はコメントアウトを外す
        // const MaterialPreviewOverlay(rectOfInterest: CodeFilterRect()),
        Listener(
          onPointerDown: (_) => _pointers++,
          onPointerUp: (_) => _pointers--,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onScaleStart: _handleScaleStart,
                onScaleUpdate: _handleScaleUpdate,
                onTapDown: (details) => onViewFinderTap(details, constraints),
              );
            },
          ),
        ),
        const IgnorePointer(
          child: DecoratedBox(
            decoration: ShapeDecoration(
              shape: CameraScanOverlayShape(),
            ),
          ),
        ),
        SafeArea(
          child: Column(
            children: [
              _flushButtonRow(),
              _continuousReadButtonRow(continuousRead),
              _searchCodeTypeRow(type, isPaidUser: isPaidUser),
              const Spacer(),
              ProviderScope(
                overrides: [
                  currentCodeProvider.overrideWithValue(
                    _lastRead.isNotEmpty ? _lastRead[0].code : "",
                  ),
                  fromRouteProvider.overrideWithValue(CameraPage.routeName),
                ],
                child: const CameraItemTile(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _flushButtonRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          color: Colors.white,
          icon: const _BackIcon(),
        ),
        const Spacer(),
        MaterialButton(
          onPressed: () async {
            if (!mounted || !_controller.state.isInitialized) {
              return;
            }
            await _controller.toggleTorch();
            setState(() {
              _isFlashOpen = !_isFlashOpen;
            });
          },
          textColor: Colors.white,
          child: Text.rich(
            TextSpan(
              text: "Flash: ",
              children: [
                WidgetSpan(
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: _isFlashOpen ? _borderBox : null,
                    child: const Text("On"),
                  ),
                ),
                WidgetSpan(
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: _isFlashOpen ? null : _borderBox,
                    child: const Text("Off"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _continuousReadButtonRow(bool continuousRead) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        MaterialButton(
          onPressed: () {
            if (!mounted) {
              return;
            }
            setState(() {
              final newVal = !continuousRead;
              ref
                  .read(searchSettingsControllerProvider.notifier)
                  .update(continuousCameraRead: newVal);
              ref
                  .read(analyticsControllerProvider)
                  .setUserProp(continuousReadPropName, newVal.toString());
            });
          },
          textColor: Colors.white,
          child: Text.rich(
            TextSpan(
              text: "連続読取: ",
              children: [
                WidgetSpan(
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: continuousRead ? _borderBox : null,
                    child: const Text("On"),
                  ),
                ),
                WidgetSpan(
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: continuousRead ? null : _borderBox,
                    child: const Text("Off"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _searchCodeTypeRow(SearchType type, {required bool isPaidUser}) {
    return Row(
      children: [
        const Spacer(),
        MaterialButton(
          textColor: Colors.white,
          onPressed: () async {
            if (!mounted) {
              return;
            }
            if (isPaidUser) {
              setState(() {
                final next = _getNext(type);
                ref
                    .read(searchSettingsControllerProvider.notifier)
                    .update(type: next);
              });
            } else {
              await showUnpaidDialog(
                context,
                message: "標準プランにするとインストアコードの読み込みが可能になります。",
              );
            }
          },
          child: Text("タイプ: ${type.toDisplayString()}"),
        ),
      ],
    );
  }

  SearchType _getNext(SearchType current) {
    switch (current) {
      case SearchType.jan:
        return SearchType.bookoff;
      case SearchType.bookoff:
        return SearchType.geo;
      case SearchType.geo:
        return SearchType.tsutaya;
      case SearchType.tsutaya:
        return SearchType.jan;
      case SearchType.freeWord:
        // freeWord は無視する
        return SearchType.jan;
    }
  }
}

class _BackIcon extends StatelessWidget {
  const _BackIcon();

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return const Icon(Icons.arrow_back);
    }
    return const Icon(Icons.arrow_back_ios_new);
  }
}

class _ErrorMessage extends StatelessWidget {
  const _ErrorMessage({required this.error});

  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("お使いの端末ではご利用いただけません。"),
          Text(error),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("戻る"),
          ),
        ],
      ),
    );
  }
}
