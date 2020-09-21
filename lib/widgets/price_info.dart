import 'package:ama_search/controllers/search_settings_controller.dart';
import 'package:ama_search/models/fulfillment_channel.dart';
import 'package:ama_search/models/item.dart';
import 'package:ama_search/models/item_condition.dart';
import 'package:ama_search/models/item_price.dart';
import 'package:ama_search/models/used_sub_condition.dart';
import 'package:ama_search/styles/font.dart';
import 'package:ama_search/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PriceInfo extends StatelessWidget {
  const PriceInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Expanded(child: _PriceAndProfit(ItemCondition.newItem)),
        Expanded(child: _PriceAndProfit(ItemCondition.usedItem)),
      ],
    );
  }
}

class _PriceAndProfit extends HookWidget {
  const _PriceAndProfit(this.condition, {Key key}) : super(key: key);

  final ItemCondition condition;

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentAsinDataProvider);
    final settings = useProvider(searchSettingsControllerProvider.state);

    final detail = _getPriceDetail(
      item,
      subCond: settings.usedSubCondition,
      priorFba: settings.priorFba,
    );
    final smallSize = smallFontSize(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(text: "${condition.toDisplayString()}最安: ", children: [
            TextSpan(
              text: numberFormatter.format(detail.price),
              style: strongTextStyle,
            ),
            const TextSpan(text: " 円(送 "),
            TextSpan(
              text: numberFormatter.format(detail.shipping),
              style: strongTextStyle,
            ),
            const TextSpan(text: " 円)"),
          ]),
          style: smallSize,
        ),
        Text.rich(
          TextSpan(text: "粗利益: ", children: [
            TextSpan(
              text: calcProfit(
                detail.price,
                item.prices.feeInfo,
                useFba: settings.useFba,
              ),
              style: strongTextStyle,
            ),
            const TextSpan(text: " 円"),
          ]),
          style: smallSize,
        ),
      ],
    );
  }

  PriceDetail _getPriceDetail(AsinData item,
      {@required UsedSubCondition subCond, @required bool priorFba}) {
    final prices = _getConditionPrices(item);

    if (prices.isEmpty) {
      return const PriceDetail(price: 0, shipping: 0);
    }
    switch (condition) {
      case ItemCondition.newItem:
        if (priorFba) {
          return prices.firstWhere(
            (e) => e.channel == FulfillmentChannel.amazon,
            orElse: () => prices.first,
          );
        }
        return prices.first;
      case ItemCondition.usedItem:
        final conditionPrices = subCond == UsedSubCondition.all
            ? prices
            : prices
                .where((e) => e.subCondition == subCond.toItemSubCondition());

        if (conditionPrices.isEmpty) {
          return const PriceDetail(price: 0, shipping: 0);
        }

        if (priorFba) {
          return conditionPrices.firstWhere(
            (e) => e.channel == FulfillmentChannel.amazon,
            orElse: () => conditionPrices.first,
          );
        }
        return conditionPrices.first;
    }
    throw Exception("Invalid item condition: $condition");
  }

  List<PriceDetail> _getConditionPrices(AsinData item) {
    switch (condition) {
      case ItemCondition.newItem:
        return item.prices.newPrice.prices;
      case ItemCondition.usedItem:
        return item.prices.usedPrice.prices;
    }
    throw Exception("Invalid SearchCondition: $condition");
  }
}
