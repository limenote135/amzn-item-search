import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/models/query_params.dart';
import 'package:amasearch/pages/search/common/search_item_tile.dart';
import 'package:amasearch/pages/search/detail_page/detail_page.dart';
import 'package:amasearch/repository/mws.dart';
import 'package:amasearch/util/util.dart';
import 'package:amasearch/widgets/async_value_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'word_search_page.dart';

final currentIndex = Provider<int>((_) => throw UnimplementedError());
// 検索時のパラメータに固定するため、override して値を保持するための Provider を用意しておく
// ItemTile で ref.watch(_currentQueryItemsRequest) のように取得すると、
// 別の検索文字列で検索した瞬間、新しい文字列での値を取得してしまう。
//
// ある検索ワードで60件目まで表示している状態で別のキーワードを検索した際、
// 検索文字列を watch していると、文字列が変わった瞬間に新しい文字列の結果の60件分取得してしまう
// 各 ItemTile で、その ItemTile が表示された時点の検索文字列を保持しておくことで、
// 新しい文字列で検索した際は最初の20件だけ表示するようになる
final currentQueryParam =
    Provider<QueryItemsRequest>((_) => throw UnimplementedError());

class ItemTile extends ConsumerWidget {
  const ItemTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final param = ref.watch(currentQueryParam);
    final index = ref.watch(currentIndex);
    final req = AsinDataIndexAtParam(param: param, index: index);
    final asinDataAsyncValue = ref.watch(asinDataAtIndex(req));
    return AsyncValueListTileWidget<AsinData>(
      value: asinDataAsyncValue,
      errorInfo: [
        "WordSearchPage.ItemTile.asinDataAtIndex",
        "param: $param, index: $index",
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
  const _InkWell({required this.child});

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
