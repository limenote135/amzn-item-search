import 'package:amasearch/models/constants.dart';
import 'package:amasearch/repository/mws_category.dart';
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

extension AlertConditionExtension on AlertCondition {
  String toSummary() {
    switch (type) {
      case AlertType.profit:
        return "粗利 $value 円以上";
      case AlertType.rank:
        return "ランキング $value 位以内";
      case AlertType.category:
        if (mwsCategoryIdMap.containsValue(value)) {
          final name = mwsCategoryIdMap.entries
              .singleWhere((element) => element.value == value)
              .key;
          return "カテゴリ $name";
        }
        return "カテゴリ 不明";
      case AlertType.condition:
        final val = AlertOfferCondition.values[value];
        return "状態 ${val.toDisplayString()}";
      case AlertType.premium:
        return "プレ値";
      case AlertType.noAmazon:
        return "Amazon販売無し";
      case AlertType.noNewOffer:
        return "新品無し";
      case AlertType.newOfferCount:
        return "新品出品 $value人以下";
      case AlertType.usedOfferCount:
        return "中古出品 $value人以下";
    }
  }
}
