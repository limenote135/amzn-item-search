import 'package:ama_search/controllers/purchase_settings_controller.dart';
import 'package:ama_search/models/fee_info.dart';
import 'package:ama_search/models/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

class ProfitTile extends HookWidget {
  const ProfitTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentAsinDataProvider);
    final base = purchaseSettingsControllerProvider(item.asin);

    final amount = useProvider(base.state.select((value) => value.amount));
    final useFba = useProvider(base.state.select((value) => value.useFba));
    final sellPrice =
        useProvider(base.state.select((value) => value.sellPrice));
    final purchasePrice =
        useProvider(base.state.select((value) => value.purchasePrice));

    final profit = _calcProfit(
      sellPrice: sellPrice,
      purchasePrice: purchasePrice,
      feeInfo: item.prices.feeInfo,
      useFba: useFba,
    );

    return ListTile(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("粗利益"),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(_getProfitText(profit, amount)),
              Text("利益率 ${_getProfitRate(profit, sellPrice)} %"),
              Text("ROI ${_getProfitRoi(profit, purchasePrice)} %")
            ],
          )
        ],
      ),
    );
  }

  int _calcProfit({
    @required int sellPrice,
    @required int purchasePrice,
    @required FeeInfo feeInfo,
    @required bool useFba,
  }) {
    final fee = (sellPrice * feeInfo.referralFeeRate).toInt() +
        feeInfo.variableClosingFee +
        (useFba ? feeInfo.fbaFee : 0);

    final profit = sellPrice - purchasePrice - fee;

    print("fee $fee, profit $profit");
    return profit;
  }

  String _getProfitText(int profit, int amount) {
    return "$profit 円 * $amount 個 = ${profit * amount} 円";
  }

  int _getProfitRate(int profit, int sellPrice) {
    if (profit <= 0 || sellPrice <= 0) {
      return 0;
    }
    return (profit / sellPrice * 100).round();
  }

  int _getProfitRoi(int profit, int purchasePrice) {
    if (profit <= 0 || purchasePrice <= 0) {
      return 0;
    }
    return (profit / purchasePrice * 100).round();
  }
}
