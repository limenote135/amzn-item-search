import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/controllers/search_settings_controller.dart';
import 'package:amasearch/models/enums/fulfillment_channel.dart';
import 'package:amasearch/models/enums/item_condition.dart';
import 'package:amasearch/models/enums/item_sub_condition.dart';
import 'package:amasearch/models/item.dart';
import 'package:amasearch/pages/search/common/util.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:amasearch/util/price_util.dart';
import 'package:amasearch/widgets/text_line_tile.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PriceDetailTile extends HookWidget {
  const PriceDetailTile(this.type, {Key key}) : super(key: key);

  final ItemCondition type;

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentAsinDataProvider);
    final setting = useProvider(searchSettingsControllerProvider.state);

    final detail = getPriceDetail(
      item: item,
      condition: type,
      subCond: setting.usedSubCondition,
      priorFba: setting.priorFba,
    );

    final sellFeeRate = (item.prices.feeInfo.referralFeeRate * 100).round();
    final sellFee =
        (detail.price * item.prices.feeInfo.referralFeeRate).round();

    final showTargetPrice = useProvider(generalSettingsControllerProvider.state
        .select((value) => value.enableTargetProfit));
    final targetPriceRate = useProvider(generalSettingsControllerProvider.state
        .select((value) => value.targetProfitValue));

    final targetPrice = calcTargetPrice(
      sellPrice: detail.price,
      feeInfo: item.prices.feeInfo,
      targetRate: targetPriceRate,
      useFba: setting.useFba,
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
              item.prices.feeInfo,
              useFba: setting.useFba,
            )} 円"),
          ),
          if (showTargetPrice)
            TextLine(
              leading: const Text("目標利益率達成額"),
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
                main: Text("${item.prices.feeInfo.variableClosingFee} 円"),
              ),
              TextLine(
                leading: const Text("FBA 手数料"),
                main: item.prices.feeInfo.fbaFee != -1
                    ? Text("${item.prices.feeInfo.fbaFee} 円")
                    : const Text("(不明) 円"),
              )
            ],
          ),
        )
      ],
    );
  }

  String _createTitle({
    @required ItemCondition type,
    @required ItemSubCondition subCond,
    @required FulfillmentChannel channel,
  }) {
    final isFba = channel == FulfillmentChannel.amazon;
    if (type == ItemCondition.newItem) {
      return "新品最安値 ${isFba ? "(FBA)" : ""}";
    } else {
      return "中古最安値 (${subCond.toDisplayShortString()}${isFba ? " FBA" : ""})";
    }
  }
}
