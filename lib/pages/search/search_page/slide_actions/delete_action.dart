import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/pages/search/common/item_delete_handler.dart';
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
        await itemDeleteHandler(
          context: Scaffold.of(context).context,
          ref: ref,
          items: [items],
          content: "在庫リストからアイテムを削除します",
        );
      },
    );
  }
}
