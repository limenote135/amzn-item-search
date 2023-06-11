import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/models/fee_info.dart';
import 'package:amasearch/pages/common/purchase_settings/values.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:amasearch/util/price_util.dart';
import 'package:amasearch/widgets/text_line_tile.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FeeTile extends HookConsumerWidget {
  const FeeTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentAsinDataProvider);

    final form = ReactiveForm.of(context)!;
    final useFba = getBool(form, useFbaField);
    final sellPrice = getInt(form, sellPriceField);
    final purchasePrice = getInt(form, purchasePriceField);
    final smallProgram = getBool(form, smallProgramField);
    final smallFee = item.smallFee;

    var feeInfo = item.prices?.feeInfo ?? const FeeInfo();
    if(smallProgram) {
      feeInfo = feeInfo.copyWith(fbaFee: smallFee);
    }
    final totalFee = _calcTotalFee(
      sellPrice: sellPrice,
      purchasePrice: purchasePrice,
      feeInfo: feeInfo,
      useFba: useFba,
    );

    final feeRate = (feeInfo.referralFeeRate * 100).round();

    final sellFee = _calcSellFee(sellPrice, feeInfo.referralFeeRate);
    final categoryFee = feeInfo.variableClosingFee;
    final tax = ((sellFee + categoryFee) * (taxRate - 1)).round();

    final fbaFeeText = _fbaFeeText(useFba: useFba, feeInfo: feeInfo);

    return ExpansionTile(
      title: TextLine(
        leading: const Text("手数料"),
        main: Text("$totalFee 円"),
      ),
      children: [
        const ThemeDivider(),
        ListTile(
          title: Column(
            children: [
              TextLine(
                leading: Text("販売手数料($feeRate%)"),
                main: Text("${numberFormatter.format(sellFee)} 円"),
              ),
              TextLine(
                leading: const Text("カテゴリ成約料"),
                main: Text("${numberFormatter.format(categoryFee)} 円"),
              ),
              TextLine(
                leading: const Text("上記にかかる消費税"),
                main: Text("$tax 円"),
              ),
              TextLine(
                leading: const Text("FBA手数料"),
                main: Text("$fbaFeeText 円"),
              ),
            ],
          ),
        )
      ],
    );
  }

  String _fbaFeeText({required bool useFba, required FeeInfo feeInfo}) {
    if (!useFba) {
      return "0";
    } else if (feeInfo.fbaFee == -1) {
      return "(不明)";
    } else {
      return numberFormatter.format(feeInfo.fbaFee);
    }
  }

  int _calcSellFee(int sellPrice, double feeRate) {
    return (sellPrice * feeRate).round();
  }

  String _calcTotalFee({
    required int sellPrice,
    required int purchasePrice,
    required FeeInfo feeInfo,
    required bool useFba,
  }) {
    final sellFee = _calcSellFee(sellPrice, feeInfo.referralFeeRate);
    final fbaFee = useFba && feeInfo.fbaFee != -1 ? feeInfo.fbaFee : 0;
    final totalFee =
        ((sellFee + feeInfo.variableClosingFee) * taxRate + fbaFee).round();
    final str = numberFormatter.format(totalFee);

    if (useFba && feeInfo.fbaFee == -1) {
      return "$str + α";
    } else {
      return str;
    }
  }
}
