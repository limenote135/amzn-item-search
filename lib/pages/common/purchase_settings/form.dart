import 'dart:typed_data';

import 'package:amasearch/controllers/search_settings_controller.dart';
import 'package:amasearch/models/enums/purchase_item_condition.dart';
import 'package:amasearch/models/item.dart';
import 'package:amasearch/models/item_price.dart';
import 'package:amasearch/pages/search/common/seller_list_tile.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:amasearch/widgets/with_underline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_forms_widgets/reactive_forms_widgets.dart';

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
    StateProvider.family<FormGroup, AsinData>((ref, item) {
  // 仮で初期値を新品最安値、無ければ中古最安値にする
  final lowestPrice = _calcLowestPrice(item.prices);
  final useFba = ref.read(searchSettingsControllerProvider.state).useFba;

  return fb.group(<String, dynamic>{
    purchasePriceField: positiveNumberOrEmpty,
    sellPriceField: [
      lowestPrice,
      Validators.required,
      Validators.number,
      Validators.min(0),
    ],
    useFbaField: useFba,
    quantityField: 1,
    conditionField: PurchaseItemCondition.newItem,
    autogenSkuField: true,
    skuField: "",
    retailerField: "",
    memoField: "",
    purchaseDateField: DateTime.now(),
  });
});

int _calcLowestPrice(ItemPrices prices) {
  if (prices.newPrices != null && prices.newPrices.isNotEmpty) {
    return prices.newPrices.first.price;
  }
  if (prices.usedPrices != null && prices.usedPrices.isNotEmpty) {
    return prices.usedPrices.first.price;
  }
  return -1;
}

class PurchaseSettingsForm extends HookWidget {
  const PurchaseSettingsForm({Key key, this.action, this.onComplete})
      : super(key: key);

  final Widget action;
  final void Function(ByteData bytes) onComplete;

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentAsinDataProvider);
    final form = useProvider(formValueProvider(item));
    return ReactiveForm(
      formGroup: form.state,
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
          const ItemConditionTile(),
          const RetailerTile(),
          const PurchaseDateTile(),
          const ThemeDivider(),
          const SkuTile(),
          ListTile(
            title: ReactiveTextField(
              formControlName: memoField,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              textAlign: TextAlign.start,
              decoration: const InputDecoration(labelText: "メモ"),
            ),
          ),
          if (action != null) action,
        ],
      ),
    );
  }
}
