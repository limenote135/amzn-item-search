import 'package:amasearch/controllers/selected_stock_items_controller.dart';
import 'package:amasearch/models/enums/item_condition.dart';
import 'package:amasearch/models/enums/item_sub_condition.dart';
import 'package:amasearch/models/item.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/styles/font.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:amasearch/util/price_util.dart';
import 'package:amasearch/util/util.dart';
import 'package:amasearch/widgets/image_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _isSelectedProvider = Provider.family<bool, StockItem>((ref, item) {
  final selectedItems = ref.watch(selectedStockItemsControllerProvider.state);
  return selectedItems.contains(item);
});

class ItemTile extends HookWidget {
  const ItemTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentStockItemProvider);
    final isSelected = useProvider(_isSelectedProvider(item));

    return ProviderScope(
      overrides: [
        currentStockItemProvider.overrideWithValue(item),
        currentAsinDataProvider.overrideWithValue(item.item),
      ],
      child: Container(
        color: _getSelectedColor(context, isSelected),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            TileImage(),
            Expanded(child: _TileBody()),
          ],
        ),
      ),
    );
  }

  Color _getSelectedColor(BuildContext context, bool isSelected) {
    if (isSelected) {
      return isDark(context) ? Colors.white24 : Colors.black26;
    }
    return Theme.of(context).canvasColor;
  }
}

class _TileBody extends HookWidget {
  const _TileBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentStockItemProvider);
    final detail = useProvider(currentAsinDataProvider);
    final smallSize = smallFontSize(context);

    final profitRate = item.sellPrice > 0
        ? (item.profitPerItem / item.sellPrice * 100).round()
        : 0;

    final breakEven = calcBreakEven(
      purchase: item.purchasePrice,
      useFba: item.useFba,
      feeInfo: detail.prices.feeInfo,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(detail.title, style: captionSize(context)),
        Row(
          children: [
            Expanded(child: Text("JAN: ${detail.jan}", style: smallSize)),
            Expanded(child: Text("ASIN: ${detail.asin}", style: smallSize)),
          ],
        ),
        Row(
          children: [
            Expanded(
                child: Text("参考価格: ${detail.listPrice} 円", style: smallSize)),
            Expanded(child: Text("順位: ${detail.rank} 位", style: smallSize))
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(text: "販売予定: ", children: [
                      TextSpan(
                        text: numberFormatter.format(item.sellPrice),
                        style: strongTextStyle,
                      ),
                      const TextSpan(text: " 円"),
                    ]),
                    style: smallSize,
                  ),
                  Text.rich(
                    TextSpan(text: "仕入れ値: ", children: [
                      TextSpan(
                        text: numberFormatter.format(item.purchasePrice),
                        style: strongTextStyle,
                      ),
                      const TextSpan(text: " 円"),
                    ]),
                    style: smallSize,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(text: "粗利益: ", children: [
                      TextSpan(
                        text: numberFormatter.format(item.profitPerItem),
                        style: strongTextStyle,
                      ),
                      const TextSpan(text: " 円 / 個"),
                    ]),
                    style: smallSize,
                  ),
                  Text("利益率: $profitRate %", style: smallSize),
                ],
              ),
            )
          ],
        ),
        Row(
          children: [
            Expanded(child: Text("損益分岐: $breakEven円", style: smallSize)),
            Expanded(
                child: Text("状態: ${_conditionText(item)}", style: smallSize)),
          ],
        ),
        Row(
          children: [
            Expanded(child: Text("個数: ${item.amount} 個", style: smallSize)),
            Expanded(
              child: Text(
                  "仕入れ日: "
                  "${DateTime.parse(item.purchaseDate).toLocal().format()}",
                  style: smallSize),
            ),
          ],
        )
      ],
    );
  }

  String _conditionText(StockItem item) {
    final fba = item.useFba ? "FBA" : "自己発";
    final cond = item.condition.toDisplayString();

    switch (item.subCondition) {
      case ItemSubCondition.newItem:
        return "$cond $fba";
      case ItemSubCondition.mint:
      case ItemSubCondition.veryGood:
      case ItemSubCondition.good:
      case ItemSubCondition.acceptable:
        return "$cond(${item.subCondition.toDisplayShortString()}) $fba";
    }
    throw Exception("Unknown ItemSubCondition: ${item.subCondition}");
  }
}
