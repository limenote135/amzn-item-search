import 'package:amasearch/models/item.dart';
import 'package:amasearch/pages/search/common/item_delete_handler.dart';
import 'package:amasearch/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SlidableDeleteTile extends HookWidget {
  const SlidableDeleteTile({Key key, @required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final provider = useProvider(currentItemControllerProvider);
    final items = useProvider(provider.state);

    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      actionExtentRatio: 0.2,
      secondaryActions: [
        IconSlideAction(
          color: Colors.red,
          icon: Icons.delete,
          onTap: () async {
            unfocus();
            await itemDeleteHandler(
              context: context,
              items: [items],
              content: "在庫リストからアイテムを削除します",
            );
          },
        ),
      ],
      child: child,
    );
  }
}
