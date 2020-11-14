import 'package:amasearch/controllers/purchase_settings_controller.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

class ProfitTile extends HookWidget {
  const ProfitTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final base = useProvider(currentPurchaseSettingsControllerProvider);

    final amount = useProvider(base.state.select((value) => value.amount));
    final sellPrice =
        useProvider(base.state.select((value) => value.sellPrice));
    final purchasePrice =
        useProvider(base.state.select((value) => value.purchasePrice));
    final profit = useProvider(base.state.select((value) => value.profit));

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

  String _getProfitText(int profit, int amount) {
    final formattedProfit = numberFormatter.format(profit);
    final formattedTotal = numberFormatter.format(profit * amount);
    return "$formattedProfit 円 * $amount 個 = $formattedTotal 円";
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
