import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/repository/mws.dart';
import 'package:amasearch/repository/mws_category.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'item_tile.dart';

final _wordProvider = StateProvider((_) => "");
final _categoryProvider = StateProvider((_) => "All");

class WordSearchPage extends StatelessWidget {
  const WordSearchPage({Key? key}) : super(key: key);
  static const String routeName = "/word_search";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _AppBar(),
            _Body(),
          ],
        ),
      ),
    );
  }
}

class _AppBar extends HookConsumerWidget {
  const _AppBar({Key? key}) : super(key: key);

  static final _appBarKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final word = ref.watch(_wordProvider);
    final category = ref.watch(_categoryProvider);

    final height = useState<double>(0);
    WidgetsBinding.instance?.addPostFrameCallback((cb) {
      // build が完了した後に AppBar の高さを計算して設定、再描画する
      final obj = _appBarKey.currentContext?.findRenderObject();
      if (obj != null) {
        // ValueNotifier 内で値が同じなら set がスキップされるので、事前にチェックはしないでよい
        height.value = obj.paintBounds.height;
      }
    });
    return SliverAppBar(
      title: Column(
        key: _appBarKey,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "フリーワード検索",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: controller.clear,
                ),
              ),
              onSubmitted: (value) {
                if (value != "" && word.state != value) {
                  word.state = value;
                }
              },
            ),
          ),
          ListTile(
            title: const Text("カテゴリー"),
            trailing: DropdownButton(
              value: category.state,
              items: mwsSearchCategoryMap.entries.map((entry) {
                return DropdownMenuItem(
                  value: entry.value,
                  child: Text(entry.key),
                );
              }).toList(),
              onChanged: (String? value) {
                if (value != null && category.state != value) {
                  category.state = value;
                }
              },
            ),
          ),
          const ThemeDivider(),
        ],
      ),
      centerTitle: true,
      toolbarHeight: height.value,
      floating: true,
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final word = ref.watch(_wordProvider);
    final category = ref.watch(_categoryProvider);

    if (word.state == "") {
      return SliverList(
        delegate: SliverChildListDelegate([Container()]),
      );
    }

    return SliverList(
      delegate: ref
          .watch(queryItemResultProvider(ListMatchingProductRequest(
            query: word.state,
            category: category.state,
          )))
          .when(
            loading: () => SliverChildListDelegate(
              [const Center(child: CircularProgressIndicator())],
            ),
            error: (error, stackTrace) {
              FirebaseCrashlytics.instance
                  .recordError(error, stackTrace, information: [
                DiagnosticsNode.message(
                    "WordSearchPage.AppBar.Body.queryItemResultProvider"),
                DiagnosticsNode.message(
                    "query: ${word.state}, category: ${category.state}"),
              ]);
              return SliverChildListDelegate(
                [Text("$error")],
              );
            },
            data: (items) {
              return SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if (index.isOdd) {
                    return const ThemeDivider();
                  }
                  return ProviderScope(
                    overrides: [
                      currentAsinDataProvider
                          .overrideWithValue(items[index ~/ 2]),
                    ],
                    child: const ItemTile(),
                  );
                },
                childCount: items.length * 2,
              );
            },
          ),
    );
  }
}
