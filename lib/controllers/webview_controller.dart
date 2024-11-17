import 'dart:async';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:riverpod/riverpod.dart';

final webviewControllerProvider = Provider((_) {
  return WebviewController();
});

class WebviewController {
  WebviewController() {
    _webview = HeadlessInAppWebView(
      initialSettings: InAppWebViewSettings(
          // javaScriptEnabled: false, // 高速化のために JS を無効化する？
          ),
      onLoadStop: onLoadStop,
    );
    _loading = _webview.run();
  }
  late HeadlessInAppWebView _webview;
  late Future<void> _loading;
  void Function(InAppWebViewController controller, WebUri? url)? callback;

  void onLoadStop(InAppWebViewController controller, WebUri? url) {
    callback?.call(controller, url);
  }

  Future<void> loadUrl(String url) async {
    await _loading;
    unawaited(
      _webview.webViewController!
          .loadUrl(urlRequest: URLRequest(url: WebUri(url))),
    );
  }

  Future<String?> getHtml() async {
    await _loading;
    final html = await _webview.webViewController!.getHtml();
    return html;
  }

  void cancel() {
    _webview.webViewController?.stopLoading();
  }

  void dispose() {
    _webview.dispose();
  }
}
