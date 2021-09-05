import 'package:amasearch/repository/common.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/error_report.dart';
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
          recordError(error, stackTrace,
              information: const ["AmazonPage serverUrlProvider when"]);
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
    final serverUrl = ref.watch(_currentServerUrlProvider);
    final user = ref.watch(authStateChangesProvider);
    return user.when(
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
        error: (error, stackTrace) {
          recordError(error, stackTrace,
              information: const ["AmazonPage body user when"]);
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
            initialUrl: "$serverUrl/spapi/auth?user=${user.uid}",
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (url) async {
              if (url.startsWith("$serverUrl/spapi/callback")) {
                final token = await user.getIdTokenResult(true);
                if (token.claims?[customClaimsLwaKey] == true) {
                  Navigator.pop(context);
                }
              }
            },
          );
        });
  }
}
