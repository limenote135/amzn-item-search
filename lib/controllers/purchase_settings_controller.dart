import 'package:ama_search/models/purchase_item_condition.dart';
import 'package:ama_search/models/purchase_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/all.dart';

final purchaseSettingsControllerProvider =
    StateNotifierProvider.family<PurchaseSettingsController, String>(
        (ref, asin) => PurchaseSettingsController());

class PurchaseSettingsController extends StateNotifier<PurchaseSettings> {
  PurchaseSettingsController()
      : super(PurchaseSettings(formKey: GlobalKey<FormState>()));

  void update({
    int purchasePrice,
    int sellPrice,
    bool useFba,
    int amount,
    PurchaseItemCondition condition,
    String sku,
    String memo,
  }) {
    state = state.copyWith(
      purchasePrice: purchasePrice ?? state.purchasePrice,
      sellPrice: sellPrice ?? state.sellPrice,
      useFba: useFba ?? state.useFba,
      amount: amount ?? state.amount,
      condition: condition ?? state.condition,
      sku: sku ?? state.sku,
      memo: memo ?? state.memo,
    );
  }
}
