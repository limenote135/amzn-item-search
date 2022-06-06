import 'package:amasearch/models/constants.dart';
import 'package:amasearch/models/enums/purchase_item_condition.dart';
import 'package:amasearch/models/enums/used_sub_condition.dart';
import 'package:hive/hive.dart';

part 'item_sub_condition.g.dart';

@HiveType(typeId: itemSubConditionTypeId)
enum ItemSubCondition {
  @HiveField(0)
  newItem,
  @HiveField(1)
  mint,
  @HiveField(2)
  veryGood,
  @HiveField(3)
  good,
  @HiveField(4)
  acceptable,
}

extension ItemSubConditionExtention on ItemSubCondition {
  String toDisplayShortString() {
    switch (this) {
      case ItemSubCondition.newItem:
        return "新品";
      case ItemSubCondition.mint:
        return "ほぼ新";
      case ItemSubCondition.veryGood:
        return "非良";
      case ItemSubCondition.good:
        return "良い";
      case ItemSubCondition.acceptable:
        return "可";
    }
  }

  String toDisplayString() {
    switch (this) {
      case ItemSubCondition.newItem:
        return "新品";
      case ItemSubCondition.mint:
        return "ほぼ新品";
      case ItemSubCondition.veryGood:
        return "非常に良い";
      case ItemSubCondition.good:
        return "良い";
      case ItemSubCondition.acceptable:
        return "可";
    }
  }

  PurchaseItemCondition toItemPurchaseCondition() {
    switch (this) {
      case ItemSubCondition.newItem:
        return PurchaseItemCondition.newItem;
      case ItemSubCondition.mint:
        return PurchaseItemCondition.usedMint;
      case ItemSubCondition.veryGood:
        return PurchaseItemCondition.usedVeryGood;
      case ItemSubCondition.good:
        return PurchaseItemCondition.usedGood;
      case ItemSubCondition.acceptable:
        return PurchaseItemCondition.usedAcceptable;
    }
  }

  UsedSubCondition toUsedSubCondition() {
    switch (this) {
      case ItemSubCondition.newItem:
        throw Exception("NewItem cannot be UsedSubCondition");
      case ItemSubCondition.mint:
        return UsedSubCondition.mint;
      case ItemSubCondition.veryGood:
        return UsedSubCondition.veryGood;
      case ItemSubCondition.good:
        return UsedSubCondition.good;
      case ItemSubCondition.acceptable:
        return UsedSubCondition.acceptable;
    }
  }
}

ItemSubCondition toItemSubCondition(String condition) {
  switch (condition) {
    case "New":
    case "new":
      return ItemSubCondition.newItem;
    case "Mint":
    case "like_new":
      return ItemSubCondition.mint;
    case "VeryGood":
    case "very_good":
      return ItemSubCondition.veryGood;
    case "Good":
    case "good":
      return ItemSubCondition.good;
    case "Acceptable":
    case "acceptable":
      return ItemSubCondition.acceptable;
    default:
      throw Exception("Unknown item sub condition: $condition");
  }
}
