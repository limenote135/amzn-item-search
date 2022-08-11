import 'package:amasearch/models/purchase_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

final purchaseStateNotifierProvider =
    StateNotifierProvider<PurchaseStateNotifier, AsyncValue<PurchaseState>>(
  (_) => PurchaseStateNotifier(),
);

class PurchaseStateNotifier extends StateNotifier<AsyncValue<PurchaseState>> {
  PurchaseStateNotifier() : super(const AsyncValue.loading()) {
    _initState();
  }

  Future<void> _initState() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final purchaserInfo = await Purchases.getCustomerInfo();
      final offerings = await Purchases.getOfferings();
      return PurchaseState(purchaseInfo: purchaserInfo, offerings: offerings);
    });
  }

  Future<void> refreshState() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final purchaserInfo = await Purchases.getCustomerInfo();
      final offerings = await Purchases.getOfferings();
      return PurchaseState(purchaseInfo: purchaserInfo, offerings: offerings);
    });
  }
}
