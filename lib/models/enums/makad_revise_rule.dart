import 'package:amasearch/models/constants.dart';
import 'package:hive/hive.dart';

part 'makad_revise_rule.g.dart';

@HiveType(typeId: makadReviseRuleTypeId)
enum MakadReviseRule {
  @HiveField(0)
  defaultRule,
  @HiveField(1)
  nothing,
  @HiveField(2)
  usedFbaSameCondition,
  @HiveField(3)
  usedSameCondition,
  @HiveField(4)
  usedBetterLowest,
  @HiveField(5)
  newFbaLowest,
  @HiveField(6)
  newLowest,
  @HiveField(7)
  newSelfLowest,
  @HiveField(8)
  cart,
  @HiveField(9)
  lowest;

  String get displayString {
    switch (this) {
      case MakadReviseRule.defaultRule:
        return "デフォルト";
      case MakadReviseRule.nothing:
        return "自動改定なし";
      case MakadReviseRule.usedFbaSameCondition:
        return "FBA状態合わせ(中古)";
      case MakadReviseRule.usedSameCondition:
        return "状態合わせ(中古)";
      case MakadReviseRule.usedBetterLowest:
        return "上位最安値(中古)";
      case MakadReviseRule.newFbaLowest:
        return "FBA状態合わせ(新品)";
      case MakadReviseRule.newLowest:
        return "最安値(新品)";
      case MakadReviseRule.newSelfLowest:
        return "自己最安値(新品)";
      case MakadReviseRule.cart:
        return "カート価格";
      case MakadReviseRule.lowest:
        return "全最安値";
    }
  }

  Object get makadCsvValue {
    switch (this) {
      case MakadReviseRule.defaultRule:
        return "";
      case MakadReviseRule.nothing:
        return 0;
      case MakadReviseRule.usedFbaSameCondition:
        return 1;
      case MakadReviseRule.usedSameCondition:
        return 2;
      case MakadReviseRule.usedBetterLowest:
        return 7;
      case MakadReviseRule.newFbaLowest:
        return 3;
      case MakadReviseRule.newLowest:
        return 4;
      case MakadReviseRule.newSelfLowest:
        return 6;
      case MakadReviseRule.cart:
        return 5;
      case MakadReviseRule.lowest:
        return 8;
    }
  }
}
