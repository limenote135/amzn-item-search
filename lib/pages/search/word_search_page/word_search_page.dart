import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/repository/mws.dart';
import 'package:amasearch/repository/mws_category.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'item_tile.dart';

class WordSearchPage extends StatelessWidget {
  const WordSearchPage({Key? key}) : super(key: key);
  static const String routeName = "/word_search";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("フリーワード検索"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends HookWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final word = useState<String>("");
    final category = useState<String>("All");
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "単語を入力してください",
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: controller.clear,
              ),
            ),
            onSubmitted: (value) {
              if (value != "" && word.value != value) {
                word.value = value;
              }
            },
          ),
        ),
        ListTile(
          title: const Text("カテゴリー"),
          trailing: DropdownButton(
            value: category.value,
            items: mwsSearchCategoryMap.entries.map((entry) {
              return DropdownMenuItem(
                value: entry.value,
                child: Text(entry.key),
              );
            }).toList(),
            onChanged: (String? value) {
              if (value != null && category.value != value) {
                category.value = value;
              }
            },
          ),
        ),
        const ThemeDivider(),
        if (word.value != "")
          useProvider(queryItemResultProvider(ListMatchingProductRequest(
            query: word.value,
            category: category.value,
          ))).when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => Text("$error"),
            data: (value) {
              return Expanded(
                child: ListView(
                  children: [
                    ...ListTile.divideTiles(
                      context: context,
                      tiles: [
                        for (final item in value)
                          ProviderScope(
                            overrides: [
                              currentAsinDataProvider.overrideWithValue(item),
                            ],
                            child: const ItemTile(),
                          ),
                      ],
                    ).toList(),
                    const ThemeDivider(),
                  ],
                ),
              );
            },
          )
      ],
    );
  }
}
