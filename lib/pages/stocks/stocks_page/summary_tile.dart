import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/pages/stocks/stocks_page/stocks_page.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dateItemsProvider =
    Provider<List<StockItem>>((_) => throw UnimplementedError());

final currentPageModeProvider =
    Provider<StockPageMode>((_) => throw UnimplementedError());

class SummaryTile extends HookConsumerWidget {
  const SummaryTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageMode = ref.watch(currentPageModeProvider);

    final items = ref.watch(dateItemsProvider);
    final day = DateTime.parse(items.first.purchaseDate).toLocal().dayFormat();

    // 選択モード・出品モードでは邪魔なので日付のみ表示する
    if (pageMode == StockPageMode.select || pageMode == StockPageMode.listing) {
      return ColoredBox(
        color: Theme.of(context).backgroundColor,
        child: Text(day),
      );
    }

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

    return ColoredBox(
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [
          Text(day),
          Wrap(
            alignment: WrapAlignment.spaceAround,
            spacing: 8,
            children: [
              Text("商品数: $itemCount 個", textAlign: TextAlign.center),
              Text(
                "仕入額: ${numberFormatter.format(totalPurchase)} 円",
                textAlign: TextAlign.center,
              ),
              Text(
                "粗利額: ${numberFormatter.format(profitValue)}円",
                textAlign: TextAlign.center,
              ),
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
      ),
    );
  }
}
