import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/controllers/keep_item_controller.dart';
import 'package:amasearch/controllers/selected_keep_items_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'providers.dart';

class ItemSelectAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const ItemSelectAppBar({super.key});

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItems = ref.watch(selectedKeepItemsControllerProvider);
    return AppBar(
      title: Text("${selectedItems.length} 件選択"),
      leading: IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          ref.read(keepPageModeProvider.notifier).state = KeepPageMode.normal;
          ref.read(selectAllProvider.notifier).state = false;
          ref.read(selectedKeepItemsControllerProvider.notifier).removeAll();
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () async {
            final ret = await showOkCancelAlertDialog(
              context: context,
              title: "商品の削除",
              message: "${selectedItems.length} 件のアイテムをキープリストから削除します",
              isDestructiveAction: true,
            );

            if (ret == OkCancelResult.ok) {
              ref
                  .read(keepItemListControllerProvider.notifier)
                  .remove(selectedItems.map((e) => e.id).toList());
              ref
                  .read(selectedKeepItemsControllerProvider.notifier)
                  .removeAll();
            }
          },
        ),
      ],
    );
  }
}
