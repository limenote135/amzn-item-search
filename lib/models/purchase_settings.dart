import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'enums/purchase_item_condition.dart';

part 'purchase_settings.freezed.dart';

@freezed
abstract class PurchaseSettings with _$PurchaseSettings {
  const factory PurchaseSettings({
    @required GlobalKey<FormState> formKey,
    @Default(0) int purchasePrice,
    @Default(0) int sellPrice,
    @Default(true) bool useFba,
    @Default(1) int amount,
    @Default(PurchaseItemCondition.newItem) PurchaseItemCondition condition,
    @Default(0) int profit,
    @Default(true) bool enableAutogenSku,
    @Default("") String sku,
    @Default("") String retailer,
    @Default("") String memo,
    @required String purchaseDate,
  }) = _PurchaseSettings;
}
