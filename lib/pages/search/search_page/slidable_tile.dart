import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/events.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/pages/search/common/item_delete_handler.dart';
import 'package:amasearch/pages/search/purchase_page/purchase_page.dart';
import 'package:amasearch/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SlidableTile extends HookConsumerWidget {
  const SlidableTile({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(currentSearchItemProvider);

    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      actionExtentRatio: 0.2,
      actions: [
        IconSlideAction(
          caption: "仕入れ",
          color: Colors.blue,
          icon: Icons.add_shopping_cart,
          onTap: () {
            unfocus();
            ref
                .read(analyticsControllerProvider)
                .logSingleEvent(directPurchaseEventName);
            Navigator.push(
              context,
              PurchasePage.route(items.asins.first),
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
            unfocus();
            await itemDeleteHandler(
              context: context,
              ref: ref,
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
