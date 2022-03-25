import 'package:amasearch/models/item_price.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/pages/search/common/route_from.dart';
import 'package:amasearch/pages/search/common/search_item_tile.dart';
import 'package:amasearch/pages/search/detail_page/detail_page.dart';
import 'package:amasearch/pages/search/search_page/slidable_tile.dart';
import 'package:amasearch/widgets/async_value_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ItemTile extends HookConsumerWidget {
  const ItemTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentAsinDataProvider);
    final itemPriceAsyncValue = ref.watch(itemPricesFutureProvider(item.asin));
    return AsyncValueListTileWidget<ItemPriceFutureProviderResponse>(
      value: itemPriceAsyncValue,
      errorInfo: [
        "ItemSelectPage.ItemTile.itemPricesFutureProvider",
        "ASIN: ${item.asin}",
      ],
      data: (value) {
        final newItem = item.copyWith(
          prices: value.prices,
          sellByAmazon: value.sellByAmazon,
        );
        return ProviderScope(
          overrides: [
            currentAsinDataProvider.overrideWithValue(newItem),
            currentSearchDateProvider.overrideWithValue(null),
          ],
          child: const SlidableTile(
            disableDelete: true,
            child: _InkWell(
              child: SearchItemTile(),
            ),
          ),
        );
      },
    );
  }
}

class _InkWell extends HookConsumerWidget {
  const _InkWell({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentAsinDataProvider);
    final fromRoute = ref.watch(fromRouteProvider);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          DetailPage.route(item, fromRoute),
        );
      },
      child: child,
    );
  }
}
