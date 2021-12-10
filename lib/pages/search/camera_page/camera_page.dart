import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/properties.dart';
import 'package:amasearch/controllers/search_item_controller.dart';
import 'package:amasearch/controllers/search_settings_controller.dart';
import 'package:amasearch/models/enums/search_type.dart';
import 'package:amasearch/pages/search/camera_page/item_tile.dart';
import 'package:amasearch/pages/search/common/route_from.dart';
import 'package:amasearch/util/error_report.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vibration/vibration.dart';

import 'camera_scan_overlay_shape.dart';

final _backCameraFutureProvider = FutureProvider<CameraDescription>((_) async {
  final cameras = await availableCameras();
  for (var i = 0; i < cameras.length; i++) {
    if (cameras[i].lensDirection == CameraLensDirection.back) {
      return cameras[i];
    }
  }
  throw Exception("背面カメラが見つかりませんでした");
});

final _currentCameraProvider =
    Provider<CameraDescription>((_) => throw UnimplementedError());

class CameraPage extends ConsumerWidget {
  const CameraPage({Key? key}) : super(key: key);

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
      message: "バーコードリーダーを利用するためにはカメラの利用を許可する必要があります。",
      okLabel: "戻る",
    );
    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ref.watch(_backCameraFutureProvider).when(
            loading: () => Container(),
            error: (error, stackTrace) {
              recordError(error, stackTrace,
                  information: const ["CameraPage build"]);
              return Container();
            },
            data: (value) {
              return SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: ProviderScope(
                        overrides: [
                          _currentCameraProvider.overrideWithValue(value)
                        ],
                        child: const _Body(),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
    );
  }
}

class _Body extends ConsumerStatefulWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends ConsumerState<_Body> with WidgetsBindingObserver {
  final barcodeScanner = GoogleMlKit.vision.barcodeScanner();

  CameraController? _controller;
  late CameraDescription _camera;
  Widget? customPaint;

  var isBusy = false;

  var _lastRead = "";
  var _lastReadTime = DateTime.now();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addObserver(this);
    _camera = ref.read(_currentCameraProvider);
    _startLiveFeed();
  }

  Future<void> _startLiveFeed() async {
    final previousCameraController = _controller;
    _controller = CameraController(
      _camera,
      ResolutionPreset.high,
      enableAudio: false,
    );

    await _controller?.initialize();
    if (!mounted) {
      return;
    }
    await _controller?.startImageStream(_processCameraImage);
    setState(() {});
    await previousCameraController?.dispose();
  }

  Future<void> _stopLiveFeed() async {
    await _controller?.dispose();
  }

  Future<void> _processCameraImage(CameraImage image) async {
    if (!mounted || isBusy) {
      return;
    }
    try {
      isBusy = true;
      final allBytes = WriteBuffer();
      for (final plane in image.planes) {
        allBytes.putUint8List(plane.bytes);
      }
      final bytes = allBytes.done().buffer.asUint8List();

      final imageSize = Size(image.width.toDouble(), image.height.toDouble());

      final imageRotation =
          InputImageRotationMethods.fromRawValue(_camera.sensorOrientation) ??
              InputImageRotation.Rotation_0deg;

      final inputImageFormat =
          InputImageFormatMethods.fromRawValue(image.format.raw as int) ??
              InputImageFormat.NV21;

      final planeData = image.planes.map(
        (Plane plane) {
          return InputImagePlaneMetadata(
            bytesPerRow: plane.bytesPerRow,
            height: plane.height,
            width: plane.width,
          );
        },
      ).toList();

      final inputImageData = InputImageData(
        size: imageSize,
        imageRotation: imageRotation,
        inputImageFormat: inputImageFormat,
        planeData: planeData,
      );

      final inputImage =
          InputImage.fromBytes(bytes: bytes, inputImageData: inputImageData);

      await processImage(inputImage);
    } finally {
      isBusy = false;
    }
  }

  Future<void> processImage(InputImage inputImage) async {
    final barcodes = await barcodeScanner.processImage(inputImage);
    if (inputImage.inputImageData?.size == null ||
        inputImage.inputImageData?.imageRotation == null ||
        barcodes.isEmpty) {
      return;
    }
    final val = barcodes.first.value;
    if (val.rawValue == null ||
        val.type == BarcodeType.url ||
        val.type == BarcodeType.contactInfo ||
        val.type == BarcodeType.email) {
      return;
    }
    final result = val.rawValue;
    if (result != null &&
        !result.contains("errorCode") &&
        _lastRead != result) {
      await Vibration.vibrate(duration: 50, amplitude: 128);

      final settings = ref.read(searchSettingsControllerProvider);
      showSuggestion(result, settings.type);
      switch (settings.type) {
        case SearchType.jan:
          ref.read(searchItemControllerProvider.notifier).add(result);
          break;
        case SearchType.bookoff:
          ref.read(searchItemControllerProvider.notifier).addBookoff(result);
          break;
        case SearchType.geo:
          ref.read(searchItemControllerProvider.notifier).addGeo(result);
          break;
        case SearchType.tsutaya:
          ref.read(searchItemControllerProvider.notifier).addTsutaya(result);
          break;
        case SearchType.freeWord:
          break;
      }

      if (!settings.continuousCameraRead) {
        Navigator.of(context).popUntil(ModalRoute.withName("/"));
      }

      if (mounted) {
        setState(() {
          _lastRead = result;
        });
      }
    } else if (DateTime.now().difference(_lastReadTime) >
        const Duration(seconds: 1)) {
      if (mounted) {
        setState(() {
          _lastReadTime = DateTime.now();
        });
      }
    }
  }

  void showSuggestion(String result, SearchType current) {
    if (result.endsWith('c') && current != SearchType.geo) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("GEO のコードではないですか？")));
    } else if (result.length == 16 && current != SearchType.tsutaya) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("TSUTAYA のコードではないですか？")));
    } else if (result.length == 17 && current != SearchType.bookoff) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("BOOK OFF のコードではないですか？")));
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final cameraController = _controller;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      _stopLiveFeed();
    } else if (state == AppLifecycleState.resumed) {
      _startLiveFeed();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    _stopLiveFeed();
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settings = ref.read(searchSettingsControllerProvider);
    final continuousRead = settings.continuousCameraRead;
    final type = settings.type;

    final borderBox = BoxDecoration(
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(5),
    );

    ref.listen(searchSettingsControllerProvider, (value, _) {
      // コードタイプを変更した際に lastRead をリセットする
      _lastRead = "";
    });

    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) {
      return Container();
    }
    return Stack(
      fit: StackFit.expand,
      children: [
        CameraPreview(_controller!),
        Container(
          decoration: const ShapeDecoration(
            shape: CameraScanOverlayShape(),
          ),
        ),
        SafeArea(
          child: Column(
            children: [
              // https://github.com/pdliuw/ai_barcode/issues/12
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: <Widget>[
              //     const BackButton(
              //       color: Colors.white,
              //     ),
              //     MaterialButton(
              //       onPressed: () {
              //         _toggleFlash();
              //         setState(() {}); // TODO: 表示を更新するため setState で強制更新
              //       },
              //       textColor: Colors.white,
              //       child: Text.rich(TextSpan(
              //         text: "Flash: ",
              //         children: [
              //           WidgetSpan(
              //             child: Container(
              //               padding: const EdgeInsets.all(2),
              //               decoration: _isFlashOpen() ? borderBox : null,
              //               child: const Text("On"),
              //             ),
              //           ),
              //           WidgetSpan(
              //             child: Container(
              //               padding: const EdgeInsets.all(2),
              //               decoration: _isFlashOpen() ? null : borderBox,
              //               child: const Text("Off"),
              //             ),
              //           ),
              //         ],
              //       )),
              //     ),
              //   ],
              // ),
              Row(
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
                        ref.read(analyticsControllerProvider).setUserProp(
                            continuousReadPropName, newVal.toString());
                      });
                    },
                    textColor: Colors.white,
                    child: Text.rich(TextSpan(
                      text: "連続読取: ",
                      children: [
                        WidgetSpan(
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: continuousRead ? borderBox : null,
                            child: const Text("On"),
                          ),
                        ),
                        WidgetSpan(
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: continuousRead ? null : borderBox,
                            child: const Text("Off"),
                          ),
                        ),
                      ],
                    )),
                  ),
                ],
              ),
              Row(
                children: [
                  const Spacer(),
                  MaterialButton(
                    textColor: Colors.white,
                    onPressed: () {
                      if (!mounted) {
                        return;
                      }
                      setState(() {
                        final next = _getNext(type);
                        ref
                            .read(searchSettingsControllerProvider.notifier)
                            .update(type: next);
                      });
                    },
                    child: Text("タイプ: ${type.toDisplayString()}"),
                  ),
                ],
              ),
              const Spacer(),
              ProviderScope(
                overrides: [
                  currentCodeProvider.overrideWithValue(_lastRead),
                  fromRouteProvider.overrideWithValue(CameraPage.routeName)
                ],
                child: const CameraItemTile(),
              ),
              const SizedBox(height: 50),
            ],
          ),
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
