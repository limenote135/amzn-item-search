import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fee_info.freezed.dart';

@freezed
abstract class FeeInfo with _$FeeInfo {
  const factory FeeInfo({
    @required double referralFeeRate,
    @required int variableClosingFee,
    @required int fbaFee,
  }) = _FeeInfo;
}
