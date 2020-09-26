import 'package:amasearch/models/item.dart';
import 'package:amasearch/models/purchase_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/all.dart';

import 'enums/item_condition.dart';
import 'enums/item_sub_condition.dart';
import 'enums/purchase_item_condition.dart';

part 'stock_item.freezed.dart';

final currentStockItemProvider = ScopedProvider<StockItem>(null);

@freezed
abstract class StockItem with _$StockItem {
  const factory StockItem({
    @required int purchasePrice,
    @required int sellPrice,
    @required bool useFba,
    @required int profitPerItem,
    @required int amount,
    @required ItemCondition condition,
    @required ItemSubCondition subCondition,
    @required String sku,
    @required String memo,
    @required String purchaseDate,
    @required AsinData item,
  }) = _StockItem;
}

extension StockItemExtension on StockItem {
  PurchaseSettings toPurchaseSettings() {
    var cond = PurchaseItemCondition.newItem;
    switch (subCondition) {
      case ItemSubCondition.newItem:
        break;
      case ItemSubCondition.mint:
        cond = PurchaseItemCondition.usedMint;
        break;
      case ItemSubCondition.veryGood:
        cond = PurchaseItemCondition.usedVeryGood;
        break;
      case ItemSubCondition.good:
        cond = PurchaseItemCondition.usedGood;
        break;
      case ItemSubCondition.acceptable:
        cond = PurchaseItemCondition.usedAcceptable;
        break;
    }
    return PurchaseSettings(
      formKey: GlobalKey<FormState>(),
      purchasePrice: purchasePrice,
      sellPrice: sellPrice,
      useFba: useFba,
      amount: amount,
      condition: cond,
      sku: sku,
      memo: memo,
    );
  }
}
