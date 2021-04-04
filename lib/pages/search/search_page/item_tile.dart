import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/pages/search/common/route_from.dart';
import 'package:amasearch/pages/search/common/search_item_tile.dart';
import 'package:amasearch/pages/search/detail_page/detail_page.dart';
import 'package:amasearch/pages/search/item_select_page/item_select_page.dart';
import 'package:amasearch/repository/mws.dart';
import 'package:amasearch/util/util.dart';
import 'package:amasearch/widgets/image_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'slidable_delete_tile.dart';
import 'slidable_tile.dart';

class ItemTile extends HookWidget {
  const ItemTile({Key? key, this.deletable = true}) : super(key: key);

  final bool deletable;

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentFutureSearchItemProvider);
    return useProvider(searchItemFutureProvider(item)).when(
      loading: () => const ListTile(
        title: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stackTrace) => ListTile(
        title: SizedBox(
          height: 30,
          child: Text("$error"),
        ),
      ),
      data: (value) {
        if (value.asins.isEmpty) {
          return ProviderScope(
            overrides: [
              currentSearchItemProvider.overrideWithValue(value),
            ],
            child: SlidableDeleteTile(
              child: Center(
                child: SizedBox(
                  height: 30,
                  child: Text("${value.jan}: 見つかりませんでした"),
                ),
              ),
            ),
          );
        }
        return ProviderScope(
          overrides: [
            currentSearchItemProvider.overrideWithValue(value),
          ],
          child: deletable
              ? const SlidableTile(child: ItemTileImpl())
              : const ItemTileImpl(),
        );
      },
    );
  }
}

class ItemTileImpl extends HookWidget {
  const ItemTileImpl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentSearchItemProvider);
    final firstItem = item.asins.first;
    final fromRoute = useProvider(fromRouteProvider);
    final fbaFee = firstItem.prices?.feeInfo.fbaFee ?? 0;
    return InkWell(
      onTap: () {
        unfocus();
        if (item.asins.length == 1) {
          Navigator.push(
            context,
            DetailPage.route(firstItem, fromRoute),
          );
        } else {
          Navigator.push(
            context,
            ItemSelectPage.route(item.asins, fromRoute),
          );
        }
      },
      child: ProviderScope(
        overrides: [
          currentAsinDataProvider.overrideWithValue(firstItem),
          currentAsinCountProvider.overrideWithValue(item.asins.length),
          currentSearchDateProvider.overrideWithValue(item.searchDate),
          isEllipsisProvider.overrideWithValue(true),
          currentFbaFeeProvider.overrideWithValue(fbaFee),
        ],
        child: const SearchItemTile(),
      ),
    );
  }
}
