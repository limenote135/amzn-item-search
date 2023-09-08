import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'faq.dart';

final _currentFaqProvider = Provider<Faq>((_) => throw UnimplementedError());

class DefaultDetailPage extends StatelessWidget {
  const DefaultDetailPage({super.key});
  static const String routeName = "/settings/faq/detail";

  static Route<void> route(Faq faq) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => ProviderScope(
        overrides: [
          _currentFaqProvider.overrideWithValue(faq),
        ],
        child: const DefaultDetailPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const _Body();
  }
}

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final faq = ref.watch(_currentFaqProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("よくあるご質問"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(faq.title),
          ),
          const ThemeDivider(),
          ListTile(
            title: faq.bodyText != null ? Text(faq.bodyText!) : faq.body!,
          ),
        ],
      ),
    );
  }
}
