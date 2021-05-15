import 'dart:ui';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:ai_barcode/ai_barcode.dart';
import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/properties.dart';
import 'package:amasearch/controllers/search_item_controller.dart';
import 'package:amasearch/controllers/search_settings_controller.dart';
import 'package:amasearch/models/enums/search_type.dart';
import 'package:amasearch/pages/search/common/route_from.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vibration/vibration.dart';

import 'item_tile.dart';

class CameraPage extends StatefulWidget {
  static const routeName = "/camera";

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => CameraPage(),
    );
  }
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> with WidgetsBindingObserver {
  ScannerController? _scannerController;
  bool _isCameraGranted = false;
  var _lastRead = "";
  var _lastReadTime = DateTime.now();
  final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addObserver(this);
    _scannerController = ScannerController(
      scannerResult: (result) {
        print("Read result: $result");

        if (_lastRead != result) {
          Vibration.vibrate(duration: 50, amplitude: 128);
          _scaffoldKey.currentState?.removeCurrentSnackBar();
          _scaffoldKey.currentState?.showSnackBar(SnackBar(
            content: Text(result),
          ));

          final settings = context.read(searchSettingsControllerProvider);
          switch (settings.type) {
            case SearchType.jan:
              context.read(searchItemControllerProvider.notifier).add(result);
              break;
            case SearchType.bookoff:
              context
                  .read(searchItemControllerProvider.notifier)
                  .addBookoff(result);
              break;
            case SearchType.geo:
              context
                  .read(searchItemControllerProvider.notifier)
                  .addGeo(result);
              break;
            case SearchType.tsutaya:
              context
                  .read(searchItemControllerProvider.notifier)
                  .addTsutaya(result);
              break;
            case SearchType.freeWord:
              break;
          }

          if (!settings.continuousCameraRead) {
            Navigator.of(context).popUntil(ModalRoute.withName("/"));
          }

          setState(() {
            _lastRead = result;
          });
        } else if (DateTime.now().difference(_lastReadTime) >
            const Duration(seconds: 1)) {
          _scaffoldKey.currentState?.removeCurrentSnackBar();
          _scaffoldKey.currentState?.showSnackBar(SnackBar(
            content: Text("$result は読み込み済みです"),
          ));
          setState(() {
            _lastReadTime = DateTime.now();
          });
        }
        _startCameraPreview();
      },
      scannerViewCreated: () async {
        final status = await Permission.camera.request();
        _isCameraGranted = status.isGranted;
        if (_isCameraGranted) {
          _startCameraWithPreview();
        } else {
          await showOkAlertDialog(
            context: context,
            barrierDismissible: false,
            title: "エラー",
            message: "バーコードリーダーを利用するためにはカメラの利用を許可する必要があります。",
            okLabel: "戻る",
          );
          Navigator.of(context).popUntil(ModalRoute.withName("/"));
        }
      },
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        // このメソッドは、オフスクリーンが表示されているときに呼び出され、ページが最初に作成されたときには呼び出されません
        _startCameraPreview();
        break;
      case AppLifecycleState.paused:
        // このメソッドは、画面がオフで表示されていないときに呼び出され、ページが破棄されたときには呼び出されません
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void deactivate() {
    super.deactivate();
    _stopCameraPreview();
  }

  @override
  void dispose() {
    _scannerController = null;
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  void _startCameraPreview() {
    if (!_isCameraGranted) {
      return;
    }
    _scannerController!.startCameraPreview();
  }

  void _stopCameraPreview() {
    if (!_isCameraGranted) {
      return;
    }
    _scannerController!.stopCameraPreview();
  }

  void _startCameraWithPreview() {
    if (!_isCameraGranted) {
      return;
    }
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      Future.delayed(const Duration(seconds: 1), () {
        _scannerController!
          ..startCamera()
          ..startCameraPreview();
      });
    } else {
      _scannerController!
        ..startCamera()
        ..startCameraPreview();
    }
  }

  // ignore: unused_element
  void _stopCameraWithPreview() {
    if (!_isCameraGranted) {
      return;
    }
    _scannerController!
      ..stopCameraPreview()
      ..stopCamera();
  }

  // ignore: unused_element
  void _toggleFlash() {
    if (!_isCameraGranted) {
      return;
    }
    _scannerController!.toggleFlash();
  }

  // ignore: unused_element
  bool _isFlashOpen() {
    if (!_isCameraGranted) {
      return false;
    }
    return _scannerController!.isOpenFlash;
  }

  @override
  Widget build(BuildContext context) {
    final size = window.physicalSize;
    final screenWidth = size.width / window.devicePixelRatio;
    final screenHeight = size.height / window.devicePixelRatio;
    final settings = context.read(searchSettingsControllerProvider);
    final continuousRead = settings.continuousCameraRead;
    final type = settings.type;

    final borderBox = BoxDecoration(
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(5),
    );

    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          Container(
            color: Colors.black26,
            width: screenWidth,
            height: screenHeight,
            child: PlatformAiBarcodeScannerWidget(
              platformScannerController: _scannerController!,
              unsupportedDescription: "この機能はお使いのデバイスではサポートされていません。",
            ),
          ),
          SafeArea(
            child: Column(
              children: [
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
                        setState(() {
                          final newVal = !continuousRead;
                          context
                              .read(searchSettingsControllerProvider.notifier)
                              .update(continuousCameraRead: newVal);
                          context.read(analyticsControllerProvider).setUserProp(
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
                        setState(() {
                          final next = _getNext(type);
                          context
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
          )
        ],
      ),
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
