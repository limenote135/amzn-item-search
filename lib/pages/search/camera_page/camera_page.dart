import 'dart:ui';

import 'package:ai_barcode/ai_barcode.dart';
import 'package:ama_search/controllers/item_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraPage extends StatefulWidget {
  static const routeName = "/camera";
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> with WidgetsBindingObserver {
  ScannerController _scannerController;
  bool _isCameraGranted = false;
  var _lastRead = "";
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    _scannerController = ScannerController(
      scannerResult: (result) {
        print("Read result: $result");

        _scaffoldKey.currentState.removeCurrentSnackBar();

        if (_lastRead != result) {
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text(result),
          ));

          context.read(itemListControllerProvider).add(result);
          setState(() {
            _lastRead = result;
          });
        } else {
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text("$result は読み込み済みです"),
          ));
        }
        _startCameraPreview();
      },
      scannerViewCreated: () async {
        final status = await Permission.camera.request();
        _isCameraGranted = status.isGranted;
        if (_isCameraGranted) {
          _startCameraWithPreview();
        } else {
          await showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                title: const Text("エラー"),
                content: const Text("バーコードリーダーを利用するためにはカメラの利用を許可する必要があります。"),
                actions: [
                  FlatButton(
                    child: const Text("戻る"),
                    onPressed: () {
                      Navigator.of(context).popUntil(ModalRoute.withName("/"));
                    },
                  ),
                ],
              );
            },
          );
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
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _startCameraPreview() {
    if (!_isCameraGranted) {
      return;
    }
    _scannerController.startCameraPreview();
  }

  void _stopCameraPreview() {
    if (!_isCameraGranted) {
      return;
    }
    _scannerController.stopCameraPreview();
  }

  void _startCameraWithPreview() {
    if (!_isCameraGranted) {
      return;
    }
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      Future.delayed(const Duration(seconds: 1), () {
        _scannerController
          ..startCamera()
          ..startCameraPreview();
      });
    } else {
      _scannerController
        ..startCamera()
        ..startCameraPreview();
    }
  }

  void _stopCameraWithPreview() {
    if (!_isCameraGranted) {
      return;
    }
    _scannerController
      ..stopCameraPreview()
      ..stopCamera();
  }

  void _toggleFlash() {
    if (!_isCameraGranted) {
      return;
    }
    _scannerController.toggleFlash();
  }

  bool _isFlashOpen() {
    if (!_isCameraGranted) {
      return false;
    }
    return _scannerController.isOpenFlash;
  }

  @override
  Widget build(BuildContext context) {
    final size = window.physicalSize;
    final screenWidth = size.width / window.devicePixelRatio;
    final screenHeight = size.height / window.devicePixelRatio;
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          Container(
            color: Colors.black26,
            width: screenWidth,
            height: screenHeight,
            child: PlatformAiBarcodeScannerWidget(
              platformScannerController: _scannerController,
              unsupportedDescription: "この機能はお使いのデバイスではサポートされていません。",
            ),
          ),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const BackButton(
                  color: Colors.white,
                ),
                MaterialButton(
                  onPressed: () {
                    _toggleFlash();
                    setState(() {}); // TODO:
                  },
                  child: Text("${_isFlashOpen() ? "Flash On" : "Flash Off"}"),
                  textColor: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
