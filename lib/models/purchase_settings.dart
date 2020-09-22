import 'package:ama_search/models/purchase_item_condition.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
    @Default("") String sku,
    @Default("") String memo,
  }) = _PurchaseSettings;
}
