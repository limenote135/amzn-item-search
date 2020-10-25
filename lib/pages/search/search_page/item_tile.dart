import 'package:amasearch/models/item.dart';
import 'package:amasearch/pages/search/common/search_item_tile.dart';
import 'package:amasearch/pages/search/detail_page/detail_page.dart';
import 'package:amasearch/pages/search/item_select_page/item_select_page.dart';
import 'package:amasearch/pages/search/search_page/slidable_tile.dart';
import 'package:amasearch/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

class ItemTile extends HookWidget {
  const ItemTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemFuture = useProvider(currentItemFutureProvider);
    return useProvider(itemFuture).whenData((value) {
      //TODO: 不要な書き込みが多い
      context.read(value).save();
      return value;
    }).when(
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
        final data = useProvider(value.state);
        if (data.asins.isEmpty) {
          return Center(
            child: SizedBox(
              height: 30,
              child: Text("${data.jan}: 見つかりませんでした"),
            ),
          );
        }
        return ProviderScope(
          overrides: [
            currentItemControllerProvider.overrideWithValue(value),
          ],
          child: const SlidableTile(child: ItemTileImpl()),
        );
      },
    );
  }
}

class ItemTileImpl extends HookWidget {
  const ItemTileImpl({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useProvider(currentItemControllerProvider);
    final item = useProvider(controller.state);
    final firstItem = item.asins.first;
    return InkWell(
      onTap: () {
        unfocus();
        if (item.asins.length == 1) {
          Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (context) => ProviderScope(
                  overrides: [
                    currentAsinDataProvider.overrideWithValue(firstItem),
                  ],
                  child: const DetailPage(),
                ),
              ));
        } else {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => ProviderScope(
                overrides: [
                  currentAsinListProvider.overrideWithValue(item.asins),
                ],
                child: const ItemSelectPage(),
              ),
            ),
          );
        }
      },
      child: ProviderScope(
        overrides: [
          currentAsinDataProvider.overrideWithValue(firstItem),
          currentAsinCountProvider.overrideWithValue(item.asins.length),
          currentSearchDateProvider.overrideWithValue(item.searchDate),
          isEllipsisProvider.overrideWithValue(true),
        ],
        child: SearchItemTile(
          onComplete: (bytes) {
            context
                .read(controller)
                .setImageBinary(firstItem.asin, bytes.buffer.asUint8List());
          },
        ),
      ),
    );
  }
}
