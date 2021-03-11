import 'package:amasearch/controllers/stock_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TotalProfit extends HookWidget {
  const TotalProfit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = useProvider(stockItemListControllerProvider.state);

    var itemCount = 0;
    var profitValue = 0;

    for (final item in items) {
      itemCount += item.amount;
      profitValue += item.profitPerItem * item.amount;
    }
    return Row(
      children: [
        Expanded(
          child: Text("総商品数: $itemCount 個", textAlign: TextAlign.center),
        ),
        Expanded(
          child: Text("総粗利益: $profitValue 円", textAlign: TextAlign.center),
        ),
      ],
    );
  }
}
