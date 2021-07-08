import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/controllers/search_settings_controller.dart';
import 'package:amasearch/models/enums/fulfillment_channel.dart';
import 'package:amasearch/models/enums/item_condition.dart';
import 'package:amasearch/models/enums/item_sub_condition.dart';
import 'package:amasearch/models/fee_info.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/pages/search/common/util.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:amasearch/util/price_util.dart';
import 'package:amasearch/widgets/text_line_tile.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PriceDetailTile extends HookConsumerWidget {
  const PriceDetailTile(this.type, {Key? key}) : super(key: key);

  final ItemCondition type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentAsinDataProvider);
    final setting = ref.watch(searchSettingsControllerProvider);

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
      condition: type,
      subCond: setting.usedSubCondition,
      priorFba: setting.priorFba,
    );

    final feeInfo = item.prices?.feeInfo ??
        const FeeInfo(referralFeeRate: 0, variableClosingFee: 0, fbaFee: -1);

    final sellFeeRate = (feeInfo.referralFeeRate * 100).round();
    var sellFee = (detail.price * feeInfo.referralFeeRate).round();
    if (!isMajorCustomer) {
      sellFee += 100; // 小口手数料
    }

    final targetPrice = calcTargetPrice(
      sellPrice: detail.price,
      feeInfo: feeInfo,
      targetRate: targetPriceRate,
      minProfit: minProfit,
      useFba: setting.useFba,
      isMajorCustomer: isMajorCustomer,
    );

    return ExpansionTile(
      title: Column(
        children: [
          TextLine(
            leading: Text(_createTitle(
              type: type,
              subCond: detail.subCondition, //TODO:表示している商品の状態を出すべき？
              channel: detail.channel,
            )),
            main: Text("${numberFormatter.format(detail.price)} 円"),
          ),
          TextLine(
            leading: const Text("  うち、送料"),
            main: Text("${numberFormatter.format(detail.shipping)} 円"),
          ),
          TextLine(
            leading: const Text("粗利益"),
            main: Text("${calcProfitText(
              detail.price,
              feeInfo,
              useFba: setting.useFba,
              isMajorCustomer: isMajorCustomer,
            )} 円"),
          ),
          if (showTargetPrice)
            TextLine(
              leading: const Text("目標利益達成額"),
              main: Text("$targetPrice 円"),
            ),
        ],
      ),
      children: [
        ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ThemeDivider(),
              TextLine(
                leading: Text("販売手数料($sellFeeRate%)"),
                main: Text("$sellFee 円"),
              ),
              TextLine(
                leading: const Text("カテゴリー成約料"),
                main: Text("${feeInfo.variableClosingFee} 円"),
              ),
              TextLine(
                leading: const Text("FBA 手数料"),
                main: feeInfo.fbaFee != -1
                    ? Text(setting.useFba
                        ? "${feeInfo.fbaFee} 円"
                        : "(${feeInfo.fbaFee} 円)")
                    : const Text("(不明) 円"),
              )
            ],
          ),
        )
      ],
    );
  }

  String _createTitle({
    required ItemCondition type,
    required ItemSubCondition subCond,
    required FulfillmentChannel channel,
  }) {
    final isFba = channel == FulfillmentChannel.amazon;
    if (type == ItemCondition.newItem) {
      return "新品最安値 ${isFba ? "(FBA)" : ""}";
    } else {
      return "中古最安値 (${subCond.toDisplayShortString()}${isFba ? " FBA" : ""})";
    }
  }
}
