import 'dart:async';

import 'package:amasearch/models/enums/item_sub_condition.dart';
import 'package:amasearch/models/enums/purchase_item_condition.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/pages/common/purchase_settings/condition_text_tile.dart';
import 'package:amasearch/pages/common/purchase_settings/fba_tile.dart';
import 'package:amasearch/pages/common/purchase_settings/other_cost_tile.dart';
import 'package:amasearch/pages/common/purchase_settings/quantity_tile.dart';
import 'package:amasearch/pages/search/common/seller_list_tile.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/custom_validator.dart';
import 'package:amasearch/util/util.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:amasearch/widgets/with_underline.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'break_even_tile.dart';
import 'fee_tile.dart';
import 'image_tile.dart';
import 'input_prices_tile.dart';
import 'item_condition_tile.dart';
import 'listing_date_tile.dart';
import 'listing_image_tile.dart';
import 'profit_tile.dart';
import 'purchase_date_tile.dart';
import 'retailer_tile.dart';
import 'sku_tile.dart';
import 'target_price_tile.dart';
import 'values.dart';

extension on AutoDisposeRef<dynamic> {
  // autoDispose を指定した時間だけ延する
  void cacheFor(Duration duration) {
    final link = keepAlive();
    final timer = Timer(duration, link.close);
    onDispose(timer.cancel);
  }
}

final formValueProvider =
    StateProvider.autoDispose.family<FormGroup, StockItem>((ref, item) {
  ref.cacheFor(const Duration(minutes: 10));
  final date =
      item.purchaseDate != "" ? item.purchaseDate : currentTimeString();
  final date2 = item.listingDate != null
      ? DateTime.parse(item.listingDate!).toLocal()
      : null;
  final state = fb.group(<String, Object>{
    purchasePriceField: [
      item.purchasePrice == 0 ? "" : "${item.purchasePrice}",
      positiveNumberOrEmpty,
    ],
    sellPriceField: [
      item.sellPrice,
      Validators.required,
      Validators.number(),
      Validators.min(0),
    ],
    useFbaField: item.useFba,
    quantityField: [
      item.amount,
      Validators.required,
      Validators.number(),
      Validators.min(1),
    ],
    // 型推論されないので明示的に型を指定する
    conditionField: FormControl<PurchaseItemCondition>(
      value: item.subCondition.toItemPurchaseCondition(),
    ),
    otherCostField: [
      item.otherCost,
      Validators.required,
      Validators.number(),
    ],
    autogenSkuField: item.autogenSku,
    skuField: [
      item.sku,
      Validators.maxLength(40),
    ],
    retailerField: item.retailer,
    listingImagesField: FormArray<String>(
      item.images.map((e) => FormControl<String>(value: e)).toList(),
    ),
    memoField: item.memo,
    conditionTextField: item.conditionText,
    purchaseDateField: DateTime.parse(date).toLocal(),
    listingDateField: FormControl<DateTime>(
      value: date2,
    ),
  });

  return state;
});

class PurchaseSettingsForm extends ConsumerWidget {
  const PurchaseSettingsForm({super.key, this.action});

  final Widget? action;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPaidUser = ref.watch(isPaidUserProvider);

    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              const WithUnderLine(
                ImageTile(),
              ),
              if (isPaidUser) const SellerListTile(),
              if (isPaidUser) const ThemeDivider(),
              const InputPricesTile(),
              const ItemConditionTile(),
              const FbaTile(),
              const QuantityTile(),
              const OtherCostTile(),
              const ProfitTile(),
              const FeeTile(),
              const BreakEvenTile(),
              const TargetPriceTile(),
              const RetailerTile(),
              const PurchaseDateTile(),
              const ListingDateTile(),
              const ThemeDivider(),
              const SkuTile(),
              const ConditionTextTile(),
              const ListingImageTile(),
              ListTile(
                title: ReactiveTextField<dynamic>(
                  formControlName: memoField,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(labelText: "メモ"),
                  onTapOutside: (_) => unfocus,
                ),
              ),
            ],
          ),
        ),
        if (action != null) action!,
      ],
    );
  }
}
