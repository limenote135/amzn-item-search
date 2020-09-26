import 'package:amasearch/controllers/purchase_settings_controller.dart';
import 'package:amasearch/controllers/stock_item_controller.dart';
import 'package:amasearch/models/enums/purchase_item_condition.dart';
import 'package:amasearch/models/fee_info.dart';
import 'package:amasearch/models/item.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/pages/common/purchase_settings/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditPage extends StatelessWidget {
  const EditPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("仕入れ内容の変更"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends HookWidget {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentStockItemProvider);
    final base = useProvider(currentPurchaseSettingsControllerProvider);
    final formKey = useProvider(base.state.select((value) => value.formKey));

    return ProviderScope(
      overrides: [
        currentAsinDataProvider.overrideWithValue(item.item),
        currentPurchaseSettingsControllerProvider.overrideWithValue(base),
      ],
      child: PurchaseSettingsForm(
        action: RaisedButton(
          child: const Text("更新"),
          onPressed: () {
            if (formKey.currentState.validate()) {
              final data = context.read(base.state);
              context.read(stockItemListControllerProvider).update(
                    item.copyWith(
                      purchasePrice: data.purchasePrice,
                      sellPrice: data.sellPrice,
                      useFba: data.useFba,
                      profitPerItem: _calcProfit(
                          sellPrice: data.sellPrice,
                          purchasePrice: data.purchasePrice,
                          feeInfo: item.item.prices.feeInfo,
                          useFba: data.useFba),
                      amount: data.amount,
                      condition: data.condition.toItemCondition(),
                      subCondition: data.condition.toItemSubCondition(),
                      sku: data.sku,
                      memo: data.memo,
                    ),
                  );
              Navigator.of(context)
                  .popUntil((route) => route.settings.name == "/");
            }
          },
        ),
      ),
    );
  }

  // TODO: 重複なのでなんとかしたい
  int _calcProfit({
    @required int sellPrice,
    @required int purchasePrice,
    @required FeeInfo feeInfo,
    @required bool useFba,
  }) {
    final fee = (sellPrice * feeInfo.referralFeeRate).round() +
        feeInfo.variableClosingFee +
        (useFba ? feeInfo.fbaFee : 0);

    final profit = sellPrice - purchasePrice - fee;

    return profit;
  }
}
