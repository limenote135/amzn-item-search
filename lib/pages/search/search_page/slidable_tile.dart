import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/events.dart';
import 'package:amasearch/models/item.dart';
import 'package:amasearch/pages/search/common/item_delete_handler.dart';
import 'package:amasearch/pages/search/purchase_page/purchase_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/all.dart';

class SlidableTile extends HookWidget {
  const SlidableTile({Key key, @required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final provider = useProvider(currentItemControllerProvider);
    final firstItem = useProvider(provider.state.select((e) => e.asins.first));
    final items = useProvider(provider.state);

    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      actionExtentRatio: 0.2,
      actions: [
        IconSlideAction(
          caption: "仕入れ",
          color: Colors.blue,
          icon: Icons.add_shopping_cart,
          onTap: () {
            context
                .read(analyticsControllerProvider)
                .logSingleEvent(directPurchaseEventName);
            Navigator.push(
              context,
              PurchasePage.route(firstItem),
            );
          },
        ),
      ],
      secondaryActions: [
        IconSlideAction(
          caption: "削除",
          color: Colors.red,
          icon: Icons.delete,
          onTap: () async {
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
