import 'package:amasearch/controllers/webview_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DebugWebView extends StatelessWidget {
  const DebugWebView({super.key});

  static const String routeName = "/settings/debug/webview";

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const DebugWebView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WebView"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController(text: "4004307651");
    final webview = ref.watch(webviewControllerProvider);

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                final asin = controller.text;
                final url = "https://www.amazon.co.jp/dp/$asin/?aod=1&th=1";
                webview.loadUrl(url);
              },
            ),
          ],
        ),
        Expanded(
          child: InAppWebView(
            headlessWebView: webview.webview,
          ),
        ),
      ],
    );
  }
}
