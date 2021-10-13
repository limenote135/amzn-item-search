import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/pages/search/common/search_item_tile.dart';
import 'package:amasearch/pages/search/detail_page/detail_page.dart';
import 'package:amasearch/util/util.dart';
import 'package:amasearch/widgets/async_value_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'word_search_page.dart';

final currentAsinProvider = Provider<String>((_) => throw UnimplementedError());

class ItemTile extends HookConsumerWidget {
  const ItemTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asin = ref.watch(currentAsinProvider);
    final asinDataAsyncValue = ref.watch(asinDataFutureProvider(asin));
    return AsyncValueListTileWidget<AsinData>(
      value: asinDataAsyncValue,
      errorInfo: [
        "WordSearchPage.ItemTile.asinDataFutureProvider",
        "ASIN: $asin",
      ],
      data: (value) => ProviderScope(
        overrides: [
          currentAsinDataProvider.overrideWithValue(value),
          currentSearchDateProvider.overrideWithValue(null),
        ],
        child: const _InkWell(
          child: SearchItemTile(),
        ),
      ),
    );
  }
}

class _InkWell extends HookConsumerWidget {
  const _InkWell({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentAsinDataProvider);
    return InkWell(
      onTap: () {
        unfocus();
        Navigator.push(
          context,
          DetailPage.route(item, WordSearchPage.routeName),
        );
      },
      child: child,
    );
  }
}
