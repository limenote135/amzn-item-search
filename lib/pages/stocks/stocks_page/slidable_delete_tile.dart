import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/pages/stocks/common/item_delete_handler.dart';
import 'package:amasearch/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SlidableDeleteTile extends HookConsumerWidget {
  const SlidableDeleteTile({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentStockItemProvider);
    return Slidable(
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.25,
        children: [
          SlidableAction(
            label: "削除",
            backgroundColor: Colors.red,
            icon: Icons.delete,
            onPressed: (_) async {
              unfocus();
              // onPressed から渡される context だとダイアログが表示できないので Widget の context を使う
              await itemDeleteHandler(
                context: context,
                ref: ref,
                items: [item],
                content: "リストからアイテムを削除します",
              );
            },
          ),
        ],
      ),
      child: child,
    );
  }
}
