import 'package:amasearch/models/item_price.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/pages/search/common/route_from.dart';
import 'package:amasearch/pages/search/common/search_item_tile.dart';
import 'package:amasearch/pages/search/detail_page/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ItemTile extends HookWidget {
  const ItemTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentAsinDataProvider);
    return useProvider(itemPricesFutureProvider(item.asin)).when(
      loading: () => const ListTile(
        title: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stackTrace) => ListTile(
        title: Text("$error"),
      ),
      data: (value) {
        final newItem = item.copyWith(
          prices: value,
        );
        return ProviderScope(
          overrides: [
            currentAsinDataProvider.overrideWithValue(newItem),
            currentSearchDateProvider.overrideWithValue(null),
          ],
          child: const _InkWell(
            child: SearchItemTile(),
          ),
        );
      },
    );
  }
}

class _InkWell extends HookWidget {
  const _InkWell({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentAsinDataProvider);
    final fromRoute = useProvider(fromRouteProvider);
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
