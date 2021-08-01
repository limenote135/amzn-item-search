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
  }

  String toDisplayShortString() {
    switch (this) {
      case UsedSubCondition.mint:
        return "ほぼ新";
      case UsedSubCondition.veryGood:
        return "非良";
      case UsedSubCondition.good:
        return "良い";
      case UsedSubCondition.acceptable:
        return "可";
      case UsedSubCondition.all:
        return "すべて";
    }
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
  }

  // lessEq は自身が引数で与えられたコンディションと等しいか、より悪いかどうかを返します。
  // this is less than target
  // this が検索設定、 target が表示するかどうかの商品を想定
  bool lessEq(ItemSubCondition target) {
    if (target == ItemSubCondition.newItem) {
      throw Exception("InvalidArgument: newItem");
    }

    switch (this) {
      case UsedSubCondition.all:
        return true;
      case UsedSubCondition.mint:
        return target == ItemSubCondition.mint;
      case UsedSubCondition.veryGood:
        if (target == ItemSubCondition.mint ||
            target == ItemSubCondition.veryGood) {
          return true;
        }
        return false;
      case UsedSubCondition.good:
        if (target == ItemSubCondition.mint ||
            target == ItemSubCondition.veryGood ||
            target == ItemSubCondition.good) {
          return true;
        }
        return false;
      case UsedSubCondition.acceptable:
        // 自身が acceptable の時は target は acceptable 以上
        return true;
    }
  }
}
