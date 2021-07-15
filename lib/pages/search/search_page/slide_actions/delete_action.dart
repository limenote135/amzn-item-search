import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/events.dart';
import 'package:amasearch/controllers/search_item_controller.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DeleteAction extends HookConsumerWidget {
  const DeleteAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(currentSearchItemProvider);

    return IconSlideAction(
      caption: "削除",
      color: Colors.red,
      icon: Icons.delete,
      onTap: () async {
        unfocus();
        // ダイアログの前に read しておこないと例外が出る
        // Slidable() の直下に IconSlideAction を置かず、別 Widget にしていることが原因？
        final itemController = ref.read(searchItemControllerProvider.notifier);
        final analyzer = ref.read(analyticsControllerProvider);

        final ret = await showOkCancelAlertDialog(
          context: Scaffold.of(context).context,
          title: "商品の削除",
          message: "在庫リストからアイテムを削除します",
          isDestructiveAction: true,
        );
        final ok = ret == OkCancelResult.ok;
        if (ok) {
          itemController.remove([items]);
          await analyzer.logSingleEvent(deleteSearchHistoryEventName);
        }
      },
    );
  }
}
