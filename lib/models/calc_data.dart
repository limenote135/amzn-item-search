import 'package:freezed_annotation/freezed_annotation.dart';

part 'calc_data.freezed.dart';

enum CalcOp {
  plus,
  minus,
  multiple,
  division,
  equal,
}

@freezed
class CalculateData with _$CalculateData {
  const factory CalculateData({
    @Default("0") String displayText,
    @Default(0) double total,
    @Default(CalcOp.plus) CalcOp op,
    @Default(true) bool inputComplete,
  }) = _CalculateData;
}
