import 'dart:io';

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

    final showTargetPrice = ref.watch(
      generalSettingsControllerProvider
          .select((value) => value.enableTargetProfit),
    );
    final targetPriceRate = ref.watch(
      generalSettingsControllerProvider
          .select((value) => value.targetProfitValue),
    );
    final minProfit = ref.watch(
      generalSettingsControllerProvider.select((value) => value.minProfit),
    );

    final detail = getPriceDetail(
      item: item,
      condition: condition,
      subCond: settings.usedSubCondition,
      priorFba: settings.priorFba,
    );
    final smallSize = smallFontSize(context);

    final query = MediaQuery.of(context);
    final width = (query.size.width - 75) / 2 / query.textScaleFactor;

    final priceDigit = _getDigit(detail.price);
    final shipDigit = _getDigit(detail.shipping);
    final digit = priceDigit + shipDigit;

    // 4ケタ円商品+4桁円送料が入らない場合は送料は改行して表示する
    final needNewLine =
        (Platform.isIOS ? width < 160 : width < 140) && digit > 8;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: "${condition.toDisplayString()}: ",
            children: [
              TextSpan(
                text: numberFormatter.format(detail.price),
                style: strongTextStyle,
              ),
              const TextSpan(text: " 円"),
              if (needNewLine) const TextSpan(text: "\n"),
              const TextSpan(text: "(送 "),
              TextSpan(
                text: numberFormatter.format(detail.shipping),
                style: strongTextStyle,
              ),
              const TextSpan(text: " 円)"),
            ],
          ),
          style: smallSize,
        ),
        Text("状態: ${_conditionText(detail)}", style: smallSize),
        Text.rich(
          TextSpan(
            text: "粗利益: ",
            children: [
              TextSpan(
                text: calcProfitText(
                  detail.price,
                  item.prices?.feeInfo,
                  useFba: settings.useFba,
                ),
                style: strongTextStyle,
              ),
              const TextSpan(text: " 円"),
            ],
          ),
          style: smallSize,
        ),
        if (showTargetPrice)
          Text.rich(
            TextSpan(
              text: "目標額: ",
              children: [
                TextSpan(
                  text: numberFormatter.format(
                    calcTargetPrice(
                      sellPrice: detail.price,
                      feeInfo: item.prices?.feeInfo,
                      targetRate: targetPriceRate,
                      minProfit: minProfit,
                      useFba: settings.useFba,
                    ),
                  ),
                  style: strongTextStyle,
                ),
                const TextSpan(text: "円"),
              ],
            ),
            style: smallSize,
          ),
      ],
    );
  }

  int _getDigit(int n) {
    if (n == 0) {
      return 1;
    }
    var digit = 0;
    var num = n;
    while (num != 0) {
      num ~/= 10;
      digit++;
    }
    return digit;
  }

  String _conditionText(PriceDetail detail) {
    if (detail.price == 0) {
      return " - ";
    }
    final channel = detail.channel == FulfillmentChannel.amazon ? " (FBA)" : "";
    return detail.subCondition.toDisplayShortString() + channel;
  }
}
