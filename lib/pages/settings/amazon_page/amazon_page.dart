import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/repository/common.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/widgets/async_value_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

final _currentServerUrlProvider =
    Provider<String>((_) => throw UnimplementedError());

final _webviewProvider = Provider((_) {
  const params = PlatformWebViewControllerCreationParams();
  final controller = WebViewController.fromPlatformCreationParams(params)
    ..setJavaScriptMode(JavaScriptMode.unrestricted);
  return controller;
});

class AmazonPage extends ConsumerWidget {
  const AmazonPage({super.key});
  static const String routeName = "/settings/amazon";

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const AmazonPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsyncValue = ref.watch(serverUrlProvider);
    return Scaffold(
      appBar: AppBar(),
      body: AsyncValueWidget<String>(
        value: userAsyncValue,
        errorInfo: const [
          "AmazonPage serverUrlProvider when",
        ],
        data: (url) => ProviderScope(
          overrides: [_currentServerUrlProvider.overrideWithValue(url)],
          child: const _Body(),
        ),
      ),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serverUrl = ref.watch(_currentServerUrlProvider);
    final userAsyncValue = ref.watch(authStateChangesProvider);

    final controller = ref.watch(_webviewProvider);

    return AsyncValueWidget<User?>(
      value: userAsyncValue,
      errorInfo: const [
        "AmazonPage body user when",
      ],
      data: (user) {
        if (user == null) {
          return const ListTile(
            title: Text("ログインしていません"),
          );
        }
        return WebViewWidget(
          controller: controller
            ..loadRequest(Uri.parse("$serverUrl/spapi/auth?user=${user.uid}"))
            ..setNavigationDelegate(
              NavigationDelegate(
                onPageFinished: (url) async {
                  if (url.startsWith("$serverUrl/spapi/callback")) {
                    final token = await user.getIdTokenResult(true);
                    if (token.claims?[customClaimsLwaKey] == true) {
                      final dynamic trialDue =
                          token.claims?[customClaimsTrialDueKey];
                      if (trialDue is int) {
                        final d = DateTime.fromMillisecondsSinceEpoch(
                                trialDue * 1000,
                                isUtc: true)
                            .toLocal();
                        if (d.isAfter(DateTime.now())) {
                          await showOkAlertDialog(
                            context: context,
                            title: "トライアル期間の開始",
                            message: "${d.month}/${d.day}まで全ての機能がご利用いただけます。\n"
                                "これ以降も全ての機能を利用するためにはウェブサイトからプランの変更が必要です。",
                          );
                        }
                      }
                      Navigator.pop(context);
                    }
                  }
                },
              ),
            ),
        );
      },
    );
  }
}
