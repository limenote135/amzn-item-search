import 'package:amasearch/models/constants.dart';
import 'package:amasearch/models/enums/used_sub_condition.dart';
import 'package:hive/hive.dart';

part 'alert_type.g.dart';

@HiveType(typeId: alertTypeTypeId)
enum AlertType {
  @HiveField(0)
  profit,
  @HiveField(1)
  rank,
  @HiveField(2)
  category,
  @HiveField(3)
  condition,
  @HiveField(4)
  premium,
  @HiveField(5)
  noAmazon,
  @HiveField(6)
  noNewOffer,
}

@HiveType(typeId: alertOfferConditionTypeId)
enum AlertOfferCondition {
  @HiveField(0)
  newItem,
  @HiveField(1)
  usedAll,
  @HiveField(2)
  usedMint,
  @HiveField(3)
  usedVeryGood,
  @HiveField(4)
  usedGood,
  @HiveField(5)
  usedAcceptable,
}

extension AlertOfferConditionExtension on AlertOfferCondition {
  String toDisplayString() {
    switch (this) {
      case AlertOfferCondition.newItem:
        return "新品";
      case AlertOfferCondition.usedAll:
        return "中古(すべて)";
      case AlertOfferCondition.usedMint:
        return "中古(ほぼ新品以上)";
      case AlertOfferCondition.usedVeryGood:
        return "中古(非常に良い以上)";
      case AlertOfferCondition.usedGood:
        return "中古(良い以上)";
      case AlertOfferCondition.usedAcceptable:
        return "中古(可以上)";
    }
  }

  UsedSubCondition toUsedSubCondition() {
    switch (this) {
      case AlertOfferCondition.usedMint:
        return UsedSubCondition.mint;
      case AlertOfferCondition.usedVeryGood:
        return UsedSubCondition.veryGood;
      case AlertOfferCondition.usedGood:
        return UsedSubCondition.good;
      case AlertOfferCondition.usedAcceptable:
        return UsedSubCondition.acceptable;
      case AlertOfferCondition.newItem:
      case AlertOfferCondition.usedAll:
        throw Exception("Cannot convert to UsedSubCondition form $name");
    }
  }
}
