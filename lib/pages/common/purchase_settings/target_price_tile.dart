import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/fee_info.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/pages/common/purchase_settings/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class TargetPriceTile extends HookWidget {
  const TargetPriceTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentAsinDataProvider);

    final form = ReactiveForm.of(context)!;
    final useFba = getBool(form, useFbaField);
    final purchasePrice = getInt(form, purchasePriceField);

    final showTargetRate = useProvider(generalSettingsControllerProvider
        .select((value) => value.enableTargetProfit));
    final targetRate = useProvider(generalSettingsControllerProvider
        .select((value) => value.targetProfitValue));
    final minProfit = useProvider(
        generalSettingsControllerProvider.select((value) => value.minProfit));

    final targetPrice = _calcTargetSellPrice(
        purchasePrice > 0 ? purchasePrice : 0,
        item.prices?.feeInfo,
        targetRate,
        minProfit,
        useFba);

    if (!showTargetRate) {
      return Container();
    }

    return ListTile(
      title: Row(
        children: [
          const Text("目標利益達成販売価格"),
          const Spacer(),
          Text("$targetPrice 円"),
        ],
      ),
    );
  }

  // 購入価格から目標の利益率を達成できる販売価格を計算する
  int _calcTargetSellPrice(int purchasePrice, FeeInfo? feeInfo, int rate,
      int minProfit, bool useFba) {
    if (feeInfo == null) {
      return 0;
    }
    // 販売価格 = 購入価格 + カテゴリ手数料 + FBA 手数料 + 利益
    // 利益 = max(販売価格 * 利益率, 最低利益額)
    final fbaFee = useFba && feeInfo.fbaFee != -1 ? feeInfo.fbaFee : 0;
    final price = purchasePrice + feeInfo.variableClosingFee + fbaFee;

    // 利益 = 販売価格 * 利益率の場合の販売価格を計算
    final denominator = 1 - feeInfo.referralFeeRate - rate / 100;
    final sellPrice1 = denominator > 0 ? (price / denominator).round() : 0;
    final profitTemp = sellPrice1 * rate / 100;

    if (profitTemp > minProfit) {
      // 最低利益額を超えているならこれを販売価格にする
      return sellPrice1;
    }

    // 利益率では最低利益額を下回るので、利益額を最低利益額として販売価格を計算
    final denominator2 = 1 - feeInfo.referralFeeRate;
    final sellPrice2 = ((price + minProfit) / denominator2).round();
    return sellPrice2 > 0 ? sellPrice2 : 0;
  }
}
