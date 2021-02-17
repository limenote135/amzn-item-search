import 'package:amasearch/models/constants.dart';
import 'package:amasearch/models/enums/purchase_item_condition.dart';
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
    throw Exception("Invalid UsedSubCondition: $this");
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
    throw Exception("Invalid UsedSubCondition: $this");
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
    throw Exception("Invalid UsedSubCondition: $this");
  }
}

ItemSubCondition toItemSubCondition(String condition) {
  switch (condition) {
    case "New":
      return ItemSubCondition.newItem;
    case "Mint":
      return ItemSubCondition.mint;
    case "VeryGood":
      return ItemSubCondition.veryGood;
    case "Good":
      return ItemSubCondition.good;
    case "Acceptable":
      return ItemSubCondition.acceptable;
    default:
      throw Exception("Unknown item sub condition: $condition");
  }
}
