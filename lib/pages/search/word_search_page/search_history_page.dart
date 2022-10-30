import 'package:amasearch/controllers/word_search_history_controller.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WordSearchHistoryPage extends StatelessWidget {
  const WordSearchHistoryPage({super.key});
  static const String routeName = "/word_search/history";

  static Route<String> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const WordSearchHistoryPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("検索履歴"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(wordSearchHistoryControllerProvider);
    return ListView.separated(
      itemBuilder: (context, index) {
        final word = items[index].keyword;
        return ListTile(
          title: Text(word),
          onTap: () {
            Navigator.of(context).pop(word);
          },
        );
      },
      separatorBuilder: (_, __) => const ThemeDivider(),
      itemCount: items.length,
    );
  }
}
