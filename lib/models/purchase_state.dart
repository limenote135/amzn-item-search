import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:purchases_flutter/offerings_wrapper.dart';
import 'package:purchases_flutter/purchaser_info_wrapper.dart';

part 'purchase_state.freezed.dart';

@freezed
class PurchaseState with _$PurchaseState {
  const factory PurchaseState({
    required PurchaserInfo purchaseInfo,
    required Offerings offerings,
  }) = _PurchaseState;
}
