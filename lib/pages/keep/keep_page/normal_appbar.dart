import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/controllers/keep_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum _KeepPageActions {
  clear,
}

class NormalAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const NormalAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("キープ商品"),
      actions: [
        PopupMenuButton<_KeepPageActions>(
          padding: EdgeInsets.zero,
          onSelected: (value) async {
            switch (value) {
              case _KeepPageActions.clear:
                final ret = await showOkCancelAlertDialog(
                  context: context,
                  title: "商品の削除",
                  message: "キープリストからすべてのアイテムを削除します",
                  isDestructiveAction: true,
                );
                if (ret == OkCancelResult.ok) {
                  ref.read(keepItemListControllerProvider.notifier).removeAll();
                }
            }
          },
          itemBuilder: (context) => const [
            PopupMenuItem(
              value: _KeepPageActions.clear,
              child: ListTile(
                leading: Icon(Icons.delete),
                title: Text("リストをクリア"),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
