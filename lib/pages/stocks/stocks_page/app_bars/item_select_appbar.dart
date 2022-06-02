import 'package:amasearch/controllers/selected_stock_items_controller.dart';
import 'package:amasearch/controllers/stock_item_controller.dart';
import 'package:amasearch/pages/stocks/common/item_delete_handler.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'common.dart';
import 'listings.dart';

class ItemSelectAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const ItemSelectAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItems = ref.watch(selectedStockItemsControllerProvider);
    return AppBar(
      title: Text("${selectedItems.length} 件選択"),
      leading: IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          resetState(ref);
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.upload_file),
          onPressed: () async {
            await callListings(context, ref, selectedItems);
          },
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () async {
            final deleted = await itemDeleteHandler(
              context: context,
              ref: ref,
              items: selectedItems,
              content: "${selectedItems.length} 件のアイテムを在庫リストから削除します",
            );
            if (deleted) {
              ref
                  .read(stockItemListControllerProvider.notifier)
                  .remove(selectedItems);
              ref
                  .read(selectedStockItemsControllerProvider.notifier)
                  .removeAll();
            }
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
