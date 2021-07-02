import 'package:amasearch/repository/common.dart';
import 'package:amasearch/util/auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

final _currentServerUrlProvider =
    Provider<String>((_) => throw UnimplementedError());

class AmazonPage extends ConsumerWidget {
  const AmazonPage({Key? key}) : super(key: key);
  static const String routeName = "/settings/amazon";

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const AmazonPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final urlProvider = ref.watch(serverUrlProvider);
    return Scaffold(
      appBar: AppBar(),
      body: urlProvider.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) {
          FirebaseCrashlytics.instance
              .recordError(error, stackTrace, information: [
            DiagnosticsNode.message("AmazonPage serverUrlProvider when"),
          ]);
          return ListTile(
            title: Text("$error"),
          );
        },
        data: (url) {
          return ProviderScope(
            overrides: [_currentServerUrlProvider.overrideWithValue(url)],
            child: const _Body(),
          );
        },
      ),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final url = ref.watch(_currentServerUrlProvider);
    final user = ref.watch(authStateChangesProvider);
    return user.when(
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
        error: (error, stackTrace) {
          FirebaseCrashlytics.instance
              .recordError(error, stackTrace, information: [
            DiagnosticsNode.message("AmazonPage body user when"),
          ]);
          return ListTile(
            title: Text("$error"),
          );
        },
        data: (user) {
          if (user == null) {
            return const ListTile(
              title: Text("ログインしていません"),
            );
          }
          return WebView(
            initialUrl: "$url/spapi/auth?user=${user.uid}",
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (url) async {
              if (url.startsWith("$url/spapi/callback")) {
                final token = await user.getIdTokenResult(true);
                if (token.claims?["hoge"] == "true") {
                  Navigator.pop(context);
                }
              }
            },
          );
        });
  }
}
