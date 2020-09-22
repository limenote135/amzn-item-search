import 'package:ama_search/controllers/search_settings_controller.dart';
import 'package:ama_search/models/fulfillment_channel.dart';
import 'package:ama_search/models/item.dart';
import 'package:ama_search/models/item_condition.dart';
import 'package:ama_search/models/used_sub_condition.dart';
import 'package:ama_search/pages/search/common/util.dart';
import 'package:ama_search/pages/search/detail_page/text_line_tile.dart';
import 'package:ama_search/util/util.dart';
import 'package:ama_search/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

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

    final sellFeeRate = (item.prices.feeInfo.referralFeeRate * 100).toInt();
    final sellFee =
        (detail.price * item.prices.feeInfo.referralFeeRate).round();

    return ExpansionTile(
      title: Column(
        children: [
          TextLine(
            leading: Text(_createTitle(
              type: type,
              subCond: setting.usedSubCondition, //TODO:表示している商品の状態を出すべき？
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
            main: Text("${calcProfit(
              detail.price,
              item.prices.feeInfo,
              useFba: setting.useFba,
            )} 円"),
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
    @required UsedSubCondition subCond,
    @required FulfillmentChannel channel,
  }) {
    final isFba = channel == FulfillmentChannel.amazon;
    if (type == ItemCondition.newItem) {
      return "新品最安値 ${isFba ? "(FBA)" : ""}";
    } else {
      return "中古最安値 (${subCond.toDisplayString()}${isFba ? " FBA" : ""})";
    }
  }
}
