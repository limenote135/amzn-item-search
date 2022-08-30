import 'package:amasearch/models/enums/item_sub_condition.dart';
import 'package:amasearch/models/enums/purchase_item_condition.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/pages/common/purchase_settings/condition_text_tile.dart';
import 'package:amasearch/pages/common/purchase_settings/fba_tile.dart';
import 'package:amasearch/pages/common/purchase_settings/other_cost_tile.dart';
import 'package:amasearch/pages/common/purchase_settings/quantity_tile.dart';
import 'package:amasearch/pages/search/common/seller_list_tile.dart';
import 'package:amasearch/util/custom_validator.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:amasearch/widgets/with_underline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' as base;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

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
    StateProvider.autoDispose.family<FormGroup, StockItem>((ref, item) {
  return fb.group(<String, Object>{
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
    quantityField: [
      item.amount,
      Validators.required,
      Validators.number,
      Validators.min(1),
    ],
    // 型推論されないので明示的に型を指定する
    conditionField: FormControl<PurchaseItemCondition>(
      value: item.subCondition.toItemPurchaseCondition(),
    ),
    otherCostField: [
      item.otherCost,
      Validators.required,
      Validators.number,
      Validators.min(0),
    ],
    autogenSkuField: item.autogenSku,
    skuField: item.sku,
    retailerField: item.retailer,
    memoField: item.memo,
    conditionTextField: item.conditionText,
    purchaseDateField: DateTime.parse(item.purchaseDate).toLocal(),
  });
});

class PurchaseSettingsForm extends StatelessWidget {
  const PurchaseSettingsForm({Key? key, this.action}) : super(key: key);

  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return _Unfocus(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                const WithUnderLine(
                  ImageTile(),
                ),
                const SellerListTile(),
                const ThemeDivider(),
                const InputPricesTile(),
                const ItemConditionTile(),
                const FbaTile(),
                const QuantityTile(),
                const OtherCostTile(),
                const ProfitTile(),
                const FeeTile(),
                const TargetPriceTile(),
                const RetailerTile(),
                const PurchaseDateTile(),
                const ThemeDivider(),
                const SkuTile(),
                const ConditionTextTile(),
                ListTile(
                  title: ReactiveTextField<dynamic>(
                    formControlName: memoField,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(labelText: "メモ"),
                  ),
                ),
              ],
            ),
          ),
          if (action != null) action!,
        ],
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
        ReactiveForm.of(context)?.unfocus();
      },
      child: child,
    );
  }
}
