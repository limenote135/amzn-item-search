import 'dart:typed_data';

import 'package:amasearch/models/enums/item_sub_condition.dart';
import 'package:amasearch/models/enums/purchase_item_condition.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/pages/search/common/seller_list_tile.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:amasearch/widgets/with_underline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' as base;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_touch_spin/reactive_touch_spin.dart';

import 'custom_validator.dart';
import 'fee_tile.dart';
import 'image_tile.dart';
import 'input_prices_tile.dart';
import 'item_condition_tile.dart';
import 'profit_tile.dart';
import 'purchase_date_tile.dart';
import 'retailer_tile.dart';
import 'sku_tile.dart';
import 'target_price_tile.dart';
import 'values.dart';

final formValueProvider =
    StateProvider.family<FormGroup, StockItem>((ref, item) {
  return fb.group(<String, dynamic>{
    purchasePriceField: [
      item.purchasePrice == 0 ? "" : "${item.purchasePrice}",
      positiveNumberOrEmpty,
    ],
    sellPriceField: [
      item.sellPrice,
      Validators.required,
      Validators.number,
      Validators.min(0),
    ],
    useFbaField: item.useFba,
    quantityField: item.amount,
    // 型推論されないので明示的に型を指定する
    conditionField: FormControl<PurchaseItemCondition>(
        value: item.subCondition.toItemPurchaseCondition()),
    autogenSkuField: item.autogenSku,
    skuField: item.sku,
    retailerField: item.retailer,
    memoField: item.memo,
    purchaseDateField: DateTime.parse(item.purchaseDate),
  });
});

class PurchaseSettingsForm extends HookWidget {
  const PurchaseSettingsForm({Key? key, this.action, this.onComplete})
      : super(key: key);

  final Widget? action;
  final void Function(ByteData bytes)? onComplete;

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentStockItemProvider);
    final form = useProvider(formValueProvider(item));
    return ReactiveForm(
      formGroup: form.state,
      child: _Unfocus(
        child: ListView(
          children: [
            WithUnderLine(
              ImageTile(
                onComplete: onComplete,
              ),
            ),
            const SellerListTile(),
            const ThemeDivider(),
            const InputPricesTile(),
            const ItemConditionTile(),
            ReactiveSwitchListTile(
              formControlName: useFbaField,
              title: const Text("FBA を利用"),
            ),
            ListTile(
              title: Row(
                children: [
                  const Expanded(child: Text("個数")),
                  Flexible(
                    child: ReactiveTouchSpin<int>(
                      formControlName: quantityField,
                      textStyle: const TextStyle(fontSize: 18),
                      min: 1,
                      max: 99,
                      step: 1,
                    ),
                  ),
                ],
              ),
            ),
            const ProfitTile(),
            const FeeTile(),
            const TargetPriceTile(),
            const RetailerTile(),
            const PurchaseDateTile(),
            const ThemeDivider(),
            const SkuTile(),
            ListTile(
              title: ReactiveTextField<dynamic>(
                formControlName: memoField,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                textAlign: TextAlign.start,
                decoration: const InputDecoration(labelText: "メモ"),
              ),
            ),
            if (action != null) action!,
          ],
        ),
      ),
    );
  }
}

class _Unfocus extends StatelessWidget {
  const _Unfocus({Key? key, this.child}) : super(key: key);

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return base.Listener(
      onPointerDown: (event) {
        ReactiveForm.of(context).unfocus();
      },
      child: child,
    );
  }
}
