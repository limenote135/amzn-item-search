import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/pages/search/common/route_from.dart';
import 'package:amasearch/pages/search/common/search_item_tile.dart';
import 'package:amasearch/pages/search/detail_page/detail_page.dart';
import 'package:amasearch/pages/search/purchase_page/purchase_page.dart';
import 'package:amasearch/pages/search/search_page/slidable_tile.dart';
import 'package:amasearch/repository/mws.dart';
import 'package:amasearch/widgets/async_value_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ItemTile extends ConsumerWidget {
  const ItemTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentAsinDataProvider);
    return ProviderScope(
      overrides: [
        currentAsinDataProvider.overrideWithValue(item),
        currentSearchDateProvider.overrideWithValue(null),
      ],
      child: SlidableTile(
        onPurchase: () {
          Navigator.push(
            context,
            PurchasePage.route(item),
          );
        },
        child: const _InkWell(
          child: SearchItemTile(),
        ),
      ),
    );
  }
}

class ItemTileWithRequest extends ConsumerWidget {
  const ItemTileWithRequest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentAsinDataProvider);
    final listingRestrictionAsyncValue =
        ref.watch(listingsRestrictionFutureProvider(item.asin));
    return AsyncValueListTileWidget<ListingRestrictions>(
      value: listingRestrictionAsyncValue,
      errorInfo: [
        "ItemSelectPage.ItemTile.listingRestrictionFutureProvider",
        "ASIN: ${item.asin}",
      ],
      data: (value) {
        final newItem = item.copyWith(
          restrictions: value,
        );
        return ProviderScope(
          overrides: [
            currentAsinDataProvider.overrideWithValue(newItem),
            currentSearchDateProvider.overrideWithValue(null),
          ],
          child: SlidableTile(
            onPurchase: () {
              Navigator.push(
                context,
                PurchasePage.route(item),
              );
            },
            child: const _InkWell(
              child: SearchItemTile(),
            ),
          ),
        );
      },
    );
  }
}

class _InkWell extends ConsumerWidget {
  const _InkWell({required this.child});

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
