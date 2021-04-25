import 'package:amasearch/models/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'enums/alert_type.dart';

part 'alert_condition.freezed.dart';
part 'alert_condition.g.dart';

@freezed
class AlertCondition with _$AlertCondition {
  @HiveType(typeId: alertConditionTypeId)
  const factory AlertCondition({
    @HiveField(0) @JsonKey(name: "t") required AlertType type,
    @HiveField(1) @JsonKey(name: "v") @Default(0) int value,
  }) = _AlertCondition;

  factory AlertCondition.fromJson(Map<String, dynamic> json) =>
      _$AlertConditionFromJson(json);
}
