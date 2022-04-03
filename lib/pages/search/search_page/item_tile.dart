import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/pages/search/camera_page/camera_page.dart';
import 'package:amasearch/pages/search/common/route_from.dart';
import 'package:amasearch/pages/search/common/search_item_tile.dart';
import 'package:amasearch/pages/search/detail_page/detail_page.dart';
import 'package:amasearch/pages/search/item_select_page/item_select_page.dart';
import 'package:amasearch/repository/mws.dart';
import 'package:amasearch/util/util.dart';
import 'package:amasearch/widgets/async_value_widget.dart';
import 'package:amasearch/widgets/image_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'slidable_tile.dart';

class ItemTile extends HookConsumerWidget {
  const ItemTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentFutureSearchItemProvider);
    final searchItemAsyncValue = ref.watch(searchItemFutureProvider(item));
    final from = ref.watch(fromRouteProvider);
    return AsyncValueListTileWidget<SearchItem>(
      value: searchItemAsyncValue,
      errorInfo: [
        "SearchPage.ItemTile.searchItemFutureProvider",
        "item: ${item.toString()}",
      ],
      data: (value) {
        if (value.asins.isEmpty) {
          return InkWell(
            onLongPress: () async {
              await Clipboard.setData(ClipboardData(text: value.jan));
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("コピーしました: ${value.jan}"),
                ),
              );
            },
            child: Center(
              child: SizedBox(
                height: 30,
                child: Text("${value.jan}: 見つかりませんでした"),
              ),
            ),
          );
        }
        return ProviderScope(
          overrides: [
            currentSearchItemProvider.overrideWithValue(value),
          ],
          child: SlidableTile(
            // カメラページで表示する場合は削除不可
            disableDelete: from == CameraPage.routeName,
            child: const ItemTileImpl(),
          ),
        );
      },
    );
  }
}

class ItemTileImpl extends HookConsumerWidget {
  const ItemTileImpl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentSearchItemProvider);
    final firstItem = item.asins.first;
    final fromRoute = ref.watch(fromRouteProvider);
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
