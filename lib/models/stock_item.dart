import 'package:amasearch/models/constants.dart';
import 'package:amasearch/models/item.dart';
import 'package:amasearch/models/purchase_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'enums/item_condition.dart';
import 'enums/item_sub_condition.dart';
import 'enums/purchase_item_condition.dart';

part 'stock_item.freezed.dart';
part 'stock_item.g.dart';

final currentStockItemProvider = ScopedProvider<StockItem>(null);

@freezed
abstract class StockItem with _$StockItem {
  @HiveType(typeId: stockItemTypeId)
  const factory StockItem({
    @HiveField(0) @required String purchaseDate,
    @HiveField(1) @required int purchasePrice,
    @HiveField(2) @required int sellPrice,
    @HiveField(3) @required bool useFba,
    @HiveField(4) @required int profitPerItem,
    @HiveField(5) @required int amount,
    @HiveField(6) @required ItemCondition condition,
    @HiveField(7) @required ItemSubCondition subCondition,
    @HiveField(8) @required String sku,
    @HiveField(9) @required String memo,
    @HiveField(10) @required AsinData item,
    @HiveField(11) @required String retailer,
    @HiveField(12) @required String id, // 主キー
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
      enableAutogenSku: false, // StockPage で編集する際に呼ばれるので false に
      retailer: retailer,
      memo: memo,
      purchaseDate: purchaseDate,
    );
  }
}
