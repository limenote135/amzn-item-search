import 'package:ama_search/controllers/search_settings_controller.dart';
import 'package:ama_search/models/item.dart';
import 'package:ama_search/models/item_condition.dart';
import 'package:ama_search/pages/search/common/util.dart';
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

    final detail = getPriceDetail(
      item: item,
      condition: condition,
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
}
