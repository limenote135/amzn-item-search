import 'package:amasearch/controllers/purchase_settings_controller.dart';
import 'package:amasearch/models/fee_info.dart';
import 'package:amasearch/models/item.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:amasearch/widgets/text_line_tile.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FeeTile extends HookWidget {
  const FeeTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentAsinDataProvider);
    final base = useProvider(currentPurchaseSettingsControllerProvider);
    final useFba = useProvider(base.state.select((value) => value.useFba));
    final sellPrice =
        useProvider(base.state.select((value) => value.sellPrice));
    final purchasePrice =
        useProvider(base.state.select((value) => value.purchasePrice));

    final totalFee = _calcTotalFee(
      sellPrice: sellPrice,
      purchasePrice: purchasePrice,
      feeInfo: item.prices.feeInfo,
      useFba: useFba,
    );

    final feeRate = (item.prices.feeInfo.referralFeeRate * 100).round();

    final sellFee =
        _calcSellFee(sellPrice, item.prices.feeInfo.referralFeeRate);
    final categoryFee = item.prices.feeInfo.variableClosingFee;
    final fbaFee = useFba ? item.prices.feeInfo.fbaFee : 0;

    return ExpansionTile(
      title: TextLine(
        leading: const Text("手数料"),
        main: Text("${numberFormatter.format(totalFee)} 円"),
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
                  leading: const Text("FBA手数料"),
                  main: Text("${numberFormatter.format(fbaFee)} 円")),
            ],
          ),
        )
      ],
    );
  }

  int _calcSellFee(int sellPrice, double feeRate) {
    return (sellPrice * feeRate).round();
  }

  int _calcTotalFee({
    @required int sellPrice,
    @required int purchasePrice,
    @required FeeInfo feeInfo,
    @required bool useFba,
  }) {
    final sellFee = _calcSellFee(sellPrice, feeInfo.referralFeeRate);
    final fbaFee = useFba ? feeInfo.fbaFee : 0;

    return sellFee + feeInfo.variableClosingFee + fbaFee;
  }
}
