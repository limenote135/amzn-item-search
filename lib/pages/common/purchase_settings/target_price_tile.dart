import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/pages/common/purchase_settings/values.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:amasearch/util/price_util.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class TargetPriceTile extends HookConsumerWidget {
  const TargetPriceTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentAsinDataProvider);

    final form = ReactiveForm.of(context)!;
    final useFba = getBool(form, useFbaField);
    final purchasePrice = getInt(form, purchasePriceField);

    final showTargetRate = ref.watch(
      generalSettingsControllerProvider
          .select((value) => value.enableTargetProfit),
    );
    final targetRate = ref.watch(
      generalSettingsControllerProvider
          .select((value) => value.targetProfitValue),
    );
    final minProfit = ref.watch(
      generalSettingsControllerProvider.select((value) => value.minProfit),
    );

    final targetPrice = calcTargetPriceFromPurchasePrice(
      purchasePrice: purchasePrice > 0 ? purchasePrice : 0,
      feeInfo: item.prices?.feeInfo,
      rate: targetRate,
      minProfit: minProfit,
      useFba: useFba,
    );

    if (!showTargetRate) {
      return Container();
    }

    return ListTile(
      title: Row(
        children: [
          const Text("目標利益達成販売価格"),
          const Spacer(),
          Text("${numberFormatter.format(targetPrice)} 円"),
        ],
      ),
    );
  }
}
