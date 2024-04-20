import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/controllers/keep_item_controller.dart';
import 'package:amasearch/pages/keep/search_page/search_page.dart';
import 'package:amasearch/util/util.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'providers.dart';

enum _KeepPageActions {
  update,
  clear,
}

class NormalAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const NormalAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterCount = ref.watch(filterCountProvider);
    return AppBar(
      title: const Text("キープ商品"),
      actions: [
        IconButton(
          icon: Badge.count(
            count: filterCount,
            isLabelVisible: filterCount > 0,
            backgroundColor: Colors.orange,
            textColor: !isDark(context) ? Colors.black : Colors.white,
            child: const Icon(Icons.search),
          ),
          onPressed: () {
            Navigator.of(context).push(SearchPage.route());
          },
        ),
        PopupMenuButton<_KeepPageActions>(
          padding: EdgeInsets.zero,
          onSelected: (value) async {
            switch (value) {
              case _KeepPageActions.update:
                ref.read(keepPageModeProvider.notifier).state =
                    KeepPageMode.refresh;
              case _KeepPageActions.clear:
                final ret = await showOkCancelAlertDialog(
                  context: context,
                  title: "商品の削除",
                  message: "キープリストからすべてのアイテムを削除します。\n"
                      "この操作は取り消せません。よろしいですか？",
                  isDestructiveAction: true,
                );
                if (ret == OkCancelResult.ok) {
                  ref.read(keepItemListControllerProvider.notifier).removeAll();
                }
            }
          },
          itemBuilder: (context) => const [
            PopupMenuItem(
              value: _KeepPageActions.update,
              child: ListTile(
                leading: Icon(Icons.update),
                title: Text("価格情報を更新"),
              ),
            ),
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
