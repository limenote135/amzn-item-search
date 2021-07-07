import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/controllers/search_settings_controller.dart';
import 'package:amasearch/models/enums/fulfillment_channel.dart';
import 'package:amasearch/models/enums/item_condition.dart';
import 'package:amasearch/models/enums/item_sub_condition.dart';
import 'package:amasearch/models/item_price.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/styles/font.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:amasearch/util/price_util.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'util.dart';

class PriceInfo extends StatelessWidget {
  const PriceInfo({Key? key}) : super(key: key);

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

class _PriceAndProfit extends HookConsumerWidget {
  const _PriceAndProfit(this.condition, {Key? key}) : super(key: key);

  final ItemCondition condition;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentAsinDataProvider);
    final settings = ref.watch(searchSettingsControllerProvider);

    final showTargetPrice = ref.watch(generalSettingsControllerProvider
        .select((value) => value.enableTargetProfit));
    final targetPriceRate = ref.watch(generalSettingsControllerProvider
        .select((value) => value.targetProfitValue));
    final minProfit = ref.watch(
        generalSettingsControllerProvider.select((value) => value.minProfit));
    final isMajorCustomer = ref.watch(generalSettingsControllerProvider
        .select((value) => value.isMajorCustomer));

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
        Text("状態: ${_conditionText(detail)}", style: smallSize),
        Text.rich(
          TextSpan(text: "粗利益: ", children: [
            TextSpan(
              text: calcProfitText(
                detail.price,
                item.prices?.feeInfo,
                useFba: settings.useFba,
                isMajorCustomer: isMajorCustomer,
              ),
              style: strongTextStyle,
            ),
            const TextSpan(text: " 円"),
          ]),
          style: smallSize,
        ),
        if (showTargetPrice)
          Text.rich(
            TextSpan(text: "目標額: ", children: [
              TextSpan(
                text: numberFormatter.format(calcTargetPrice(
                  sellPrice: detail.price,
                  feeInfo: item.prices?.feeInfo,
                  targetRate: targetPriceRate,
                  minProfit: minProfit,
                  useFba: settings.useFba,
                  isMajorCustomer: isMajorCustomer,
                )),
                style: strongTextStyle,
              ),
              const TextSpan(text: "円"),
            ]),
            style: smallSize,
          ),
      ],
    );
  }

  String _conditionText(PriceDetail detail) {
    if (detail.price == 0) {
      return " - ";
    }
    final channel = detail.channel == FulfillmentChannel.amazon ? " (FBA)" : "";
    return detail.subCondition.toDisplayShortString() + channel;
  }
}
