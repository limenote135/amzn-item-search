import 'package:amasearch/models/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'fee_expression.freezed.dart';
part 'fee_expression.g.dart';

@freezed
class FeeExpression with _$FeeExpression {
  @JsonSerializable(fieldRename: FieldRename.snake)
  @HiveType(typeId: feeExpressionTypeId)
  const factory FeeExpression({
    @HiveField(0) @Default(0) int moreThan,
    @HiveField(1) @Default("") String exp,
  }) = _FeeExpression;

  factory FeeExpression.fromJson(Map<String, dynamic> json) =>
      _$FeeExpressionFromJson(json);
}
