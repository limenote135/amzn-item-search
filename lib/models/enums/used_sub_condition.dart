import 'package:amasearch/models/constants.dart';
import 'package:hive/hive.dart';

import 'item_sub_condition.dart';

part 'used_sub_condition.g.dart';

@HiveType(typeId: usedSubConditionTypeId)
enum UsedSubCondition {
  @HiveField(0)
  all,
  @HiveField(1)
  mint,
  @HiveField(2)
  veryGood,
  @HiveField(3)
  good,
  @HiveField(4)
  acceptable,
}

extension UsedSubConditionExtention on UsedSubCondition {
  String toDisplayString() {
    switch (this) {
      case UsedSubCondition.mint:
        return "ほぼ新品";
      case UsedSubCondition.veryGood:
        return "非常に良い";
      case UsedSubCondition.good:
        return "良い";
      case UsedSubCondition.acceptable:
        return "可";
      case UsedSubCondition.all:
        return "すべて";
    }
    throw Exception("Invalid UsedSubCondition: $this");
  }

  ItemSubCondition toItemSubCondition() {
    switch (this) {
      case UsedSubCondition.mint:
        return ItemSubCondition.mint;
      case UsedSubCondition.veryGood:
        return ItemSubCondition.veryGood;
      case UsedSubCondition.good:
        return ItemSubCondition.good;
      case UsedSubCondition.acceptable:
        return ItemSubCondition.acceptable;
      case UsedSubCondition.all:
        throw Exception("Invalid UsedSubCondition: $this");
    }
    throw Exception("Invalid UsedSubCondition: $this");
  }
}
