import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/pages/common/purchase_settings/values.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:amasearch/util/price_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ProfitTile extends HookWidget {
  const ProfitTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentAsinDataProvider);
    final form = ReactiveForm.of(context);
    final quantity = getInt(form, quantityField);
    final sellPrice = getInt(form, sellPriceField);
    final purchasePrice = getInt(form, purchasePriceField);
    final useFba = getBool(form, useFbaField);
    final profit = calcProfit(
        sellPrice: sellPrice,
        purchasePrice: purchasePrice,
        fee: item.prices?.feeInfo,
        useFba: useFba);
    return ListTile(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("粗利益"),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(_getProfitText(profit, quantity)),
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
