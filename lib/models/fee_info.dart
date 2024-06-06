import 'package:amasearch/models/constants.dart';
import 'package:amasearch/models/fee_expression.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'fee_info.freezed.dart';
part 'fee_info.g.dart';

@freezed
class FeeInfo with _$FeeInfo {
  @JsonSerializable(fieldRename: FieldRename.snake)
  @HiveType(typeId: feeInfoTypeId)
  const factory FeeInfo({
    @HiveField(0) @JsonKey(name: "fee_rate") @Default(0) double referralFeeRate,
    @HiveField(1)
    @JsonKey(name: "closing_fee")
    @Default(0)
    int variableClosingFee,
    @HiveField(2) @Default(-1) int fbaFee,
    @HiveField(3) FeeExpression? feeExp,
    @HiveField(4, defaultValue: 0) @Default(0) int fbaLowPriceFee,
    @HiveField(5, defaultValue: 0) @Default(0) double referralFeeLowPriceRate,
  }) = _FeeInfo;

  factory FeeInfo.fromJson(Map<String, dynamic> json) =>
      _$FeeInfoFromJson(json);
}
