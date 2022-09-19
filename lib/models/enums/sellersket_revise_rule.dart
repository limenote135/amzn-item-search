import 'package:amasearch/models/constants.dart';
import 'package:hive/hive.dart';

part 'sellersket_revise_rule.g.dart';

@HiveType(typeId: sellerSketReviseRuleTypeId)
enum SellerSketReviseRule {
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
  cart;

  String get displayString {
    switch (this) {
      case SellerSketReviseRule.nothing:
        return "自動改定なし";
      case SellerSketReviseRule.fbaSameCondition:
        return "FBA状態合わせモード";
      case SellerSketReviseRule.sameCondition:
        return "状態合わせモード";
      case SellerSketReviseRule.fbaLowest:
        return "FBA最安値モード";
      case SellerSketReviseRule.lowest:
        return "最安値モード";
      case SellerSketReviseRule.cart:
        return "カート価格モード";
    }
  }
}

extension SellerSketReviseRuleExtension on SellerSketReviseRule {
  int toSellerSketCsvValue() {
    switch (this) {
      case SellerSketReviseRule.nothing:
        return 0;
      case SellerSketReviseRule.fbaSameCondition:
        return 1;
      case SellerSketReviseRule.sameCondition:
        return 2;
      case SellerSketReviseRule.fbaLowest:
        return 3;
      case SellerSketReviseRule.lowest:
        return 4;
      case SellerSketReviseRule.cart:
        return 5;
    }
  }
}
