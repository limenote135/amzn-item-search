import 'package:amasearch/models/constants.dart';
import 'package:hive/hive.dart';

part 'pricetar_rule.g.dart';

@HiveType(typeId: pricetarRuleTypeId)
enum PricetarRule {
  @HiveField(0)
  nothing,
  @HiveField(1)
  fbaSameCondition,
  @HiveField(2)
  sameCondition,
  @HiveField(3)
  fbaLowest,
  @HiveField(4)
  lowest,
  @HiveField(5)
  cart,
}

extension PricetarRuleExtension on PricetarRule {
  String toDisplayString() {
    switch (this) {
      case PricetarRule.nothing:
        return "自動改定なし";
      case PricetarRule.fbaSameCondition:
        return "FBA状態合わせモード";
      case PricetarRule.sameCondition:
        return "状態合わせモード";
      case PricetarRule.fbaLowest:
        return "FBA最安値モード";
      case PricetarRule.lowest:
        return "最安値モード";
      case PricetarRule.cart:
        return "カート価格モード";
    }
  }

  int toPricetarCsvValue() {
    switch (this) {
      case PricetarRule.nothing:
        return 0;
      case PricetarRule.fbaSameCondition:
        return 1;
      case PricetarRule.sameCondition:
        return 2;
      case PricetarRule.fbaLowest:
        return 3;
      case PricetarRule.lowest:
        return 4;
      case PricetarRule.cart:
        return 5;
    }
  }
}
