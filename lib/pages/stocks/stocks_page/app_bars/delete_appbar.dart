import 'package:amasearch/controllers/selected_stock_items_controller.dart';
import 'package:amasearch/controllers/stock_item_controller.dart';
import 'package:amasearch/pages/stocks/common/item_delete_handler.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'common.dart';

class DeleteAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const DeleteAppBar({super.key});

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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
            ),
            onPressed: selectedItems.isNotEmpty
                ? () async {
                    final deleted = await itemDeleteHandler(
                      context: context,
                      ref: ref,
                      items: selectedItems,
                      content: "${selectedItems.length} 件の商品を在庫リストから削除します",
                    );
                    if (deleted) {
                      ref
                          .read(stockItemListControllerProvider.notifier)
                          .remove(selectedItems);
                      ref
                          .read(selectedStockItemsControllerProvider.notifier)
                          .removeAll();
                      resetState(ref);
                    }
                  }
                : null,
            child: const Text("確定"),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
