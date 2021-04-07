import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/events.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/pages/search/purchase_page/purchase_page.dart';
import 'package:amasearch/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PurchaseAction extends HookConsumerWidget {
  const PurchaseAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(currentSearchItemProvider);

    return IconSlideAction(
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
    );
  }
}
