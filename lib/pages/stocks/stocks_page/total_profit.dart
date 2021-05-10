import 'package:amasearch/controllers/stock_item_controller.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TotalProfit extends HookWidget {
  const TotalProfit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = useProvider(stockItemListControllerProvider);

    var itemCount = 0;
    var profitValue = 0;
    var totalPurchase = 0;
    var totalSellPrice = 0;

    for (final item in items) {
      itemCount += item.amount;
      profitValue += item.profitPerItem * item.amount;
      totalPurchase += item.purchasePrice * item.amount;
      totalSellPrice += item.sellPrice * item.amount;
    }
    final roi =
        totalPurchase == 0 ? 0 : (profitValue / totalPurchase * 100).round();
    final profitRate =
        totalSellPrice == 0 ? 0 : (profitValue / totalSellPrice * 100).round();
    return Column(
      children: [
        Wrap(
          alignment: WrapAlignment.spaceAround,
          spacing: 8,
          children: [
            Text("総商品数: $itemCount 個", textAlign: TextAlign.center),
            Text("仕入総額: ${numberFormatter.format(totalPurchase)} 円",
                textAlign: TextAlign.center),
            Text("粗利総額: ${numberFormatter.format(profitValue)}円",
                textAlign: TextAlign.center),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("利益率: $profitRate %", textAlign: TextAlign.center),
            Text("ROI: $roi %", textAlign: TextAlign.center),
          ],
        ),
      ],
    );
  }
}
