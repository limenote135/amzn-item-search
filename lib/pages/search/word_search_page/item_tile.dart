import 'package:amasearch/models/item_price.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/pages/search/common/search_item_tile.dart';
import 'package:amasearch/pages/search/detail_page/detail_page.dart';
import 'package:amasearch/util/util.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'word_search_page.dart';

class ItemTile extends HookConsumerWidget {
  const ItemTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentAsinDataProvider);
    return ref.watch(itemPricesFutureProvider(item.asin)).when(
          loading: () => const ListTile(
            title: Center(child: CircularProgressIndicator()),
          ),
          error: (error, stackTrace) {
            FirebaseCrashlytics.instance
                .recordError(error, stackTrace, information: [
              DiagnosticsNode.message(
                  "WordSearchPage.ItemTile.itemPricesFutureProvider"),
              DiagnosticsNode.message("ASIN: ${item.asin}"),
            ]);
            return ListTile(
              title: Text("$error"),
            );
          },
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
              child: const _InkWell(
                child: SearchItemTile(),
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
