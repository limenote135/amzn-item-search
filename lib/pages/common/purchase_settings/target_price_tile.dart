import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/controllers/purchase_settings_controller.dart';
import 'package:amasearch/models/fee_info.dart';
import 'package:amasearch/models/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TargetPriceTile extends HookWidget {
  const TargetPriceTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentAsinDataProvider);
    final base = useProvider(currentPurchaseSettingsControllerProvider);
    final useFba = useProvider(base.state.select((value) => value.useFba));
    final purchasePrice =
        useProvider(base.state.select((value) => value.purchasePrice));

    final showTargetRate = useProvider(generalSettingsControllerProvider.state
        .select((value) => value.enableTargetProfit));
    final targetRate = useProvider(generalSettingsControllerProvider.state
        .select((value) => value.targetProfitValue));

    final targetPrice = _calcTargetSellPrice(
        purchasePrice > 0 ? purchasePrice : 0,
        item.prices.feeInfo,
        targetRate,
        useFba);

    if (!showTargetRate) {
      return Container();
    }
    return ListTile(
      title: Row(
        children: [
          const Text("目標利益率達成販売価格"),
          const Spacer(),
          Text("$targetPrice 円"),
        ],
      ),
    );
  }

  // 購入価格から目標の利益率を達成できる販売価格を計算する
  int _calcTargetSellPrice(
      int purchasePrice, FeeInfo feeInfo, int rate, bool useFba) {
    final fbaFee = useFba ? feeInfo.fbaFee : 0;
    final price = purchasePrice + feeInfo.variableClosingFee + fbaFee;
    final denominator = 1 - feeInfo.referralFeeRate - rate / 100;

    return denominator > 0 ? (price / denominator).round() : 0;
  }
}
