import 'package:amasearch/models/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'fee_info.freezed.dart';
part 'fee_info.g.dart';

@freezed
abstract class FeeInfo with _$FeeInfo {
  @HiveType(typeId: feeInfoTypeId)
  const factory FeeInfo({
    @HiveField(0) @required double referralFeeRate,
    @HiveField(1) @required int variableClosingFee,
    @HiveField(2) @required int fbaFee,
  }) = _FeeInfo;
}
