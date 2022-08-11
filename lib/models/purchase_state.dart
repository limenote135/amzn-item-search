import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

part 'purchase_state.freezed.dart';

@freezed
class PurchaseState with _$PurchaseState {
  const factory PurchaseState({
    required CustomerInfo purchaseInfo,
    required Offerings offerings,
  }) = _PurchaseState;
}
