import 'package:ama_search/models/item.dart';
import 'package:ama_search/models/item_price.dart';
import 'package:ama_search/models/search_condition.dart';
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
        Expanded(child: _PriceAndProfit(SearchCondition.newItem)),
        Expanded(child: _PriceAndProfit(SearchCondition.usedItem)),
      ],
    );
  }
}

class _PriceAndProfit extends HookWidget {
  const _PriceAndProfit(this.condition, {Key key}) : super(key: key);

  final SearchCondition condition;

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentAsinDataProvider);
    final detail = _getPriceDetail(item);
    final smallSize = smallFontSize(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(text: "${condition.toDisplayString()}最安: ", children: [
            TextSpan(
              text: "${detail.price}",
              style: strongTextStyle,
            ),
            const TextSpan(text: " 円(送 "),
            TextSpan(
              text: "${detail.shipping}",
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
                useFba: true, // TODO: FBA を使うか選択
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

  PriceDetail _getPriceDetail(AsinData item) {
    final prices = _getConditionPrices(item);

    if (prices.isEmpty) {
      return const PriceDetail(price: 0, shipping: 0);
    }
    return prices.first;
  }

  List<PriceDetail> _getConditionPrices(AsinData item) {
    switch (condition) {
      case SearchCondition.newItem:
        return item.prices.newPrice.prices;
      case SearchCondition.usedItem:
        return item.prices.usedPrice.prices;
    }
    throw Exception("Invalid SearchCondition: $condition");
  }
}
