import 'package:amasearch/models/enums/purchase_item_condition.dart';
import 'package:amasearch/models/purchase_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/all.dart';

final currentPurchaseSettingsControllerProvider = ScopedProvider<
    AutoDisposeStateNotifierProvider<PurchaseSettingsController>>(null);

final purchaseSettingsControllerProvider = StateNotifierProvider.autoDispose
    .family<PurchaseSettingsController, String>((ref, asin) {
  ref.maintainState = true;
  return PurchaseSettingsController();
});

final initPurchaseSettingsControllerProvider = StateNotifierProvider.autoDispose
    .family<PurchaseSettingsController, PurchaseSettings>(
        (ref, init) => PurchaseSettingsController(init: init));

class PurchaseSettingsController extends StateNotifier<PurchaseSettings> {
  PurchaseSettingsController({PurchaseSettings init})
      : super(init ?? PurchaseSettings(formKey: GlobalKey<FormState>()));

  void update({
    int purchasePrice,
    int sellPrice,
    bool useFba,
    int amount,
    PurchaseItemCondition condition,
    int profit,
    bool enableAutogenSku,
    String sku,
    String memo,
  }) {
    state = state.copyWith(
      purchasePrice: purchasePrice ?? state.purchasePrice,
      sellPrice: sellPrice ?? state.sellPrice,
      useFba: useFba ?? state.useFba,
      amount: amount ?? state.amount,
      condition: condition ?? state.condition,
      profit: profit ?? state.profit,
      enableAutogenSku: enableAutogenSku ?? state.enableAutogenSku,
      sku: sku ?? state.sku,
      memo: memo ?? state.memo,
    );
  }
}
