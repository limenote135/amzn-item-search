import 'item_condition.dart';
import 'item_sub_condition.dart';

enum PurchaseItemCondition {
  newItem,
  usedMint,
  usedVeryGood,
  usedGood,
  usedAcceptable,
}

extension PurchaseItemConditionExtention on PurchaseItemCondition {
  ItemCondition toItemCondition() {
    switch (this) {
      case PurchaseItemCondition.newItem:
        return ItemCondition.newItem;
      case PurchaseItemCondition.usedMint:
      case PurchaseItemCondition.usedVeryGood:
      case PurchaseItemCondition.usedGood:
      case PurchaseItemCondition.usedAcceptable:
        return ItemCondition.usedItem;
    }
    throw Exception("Invalid PurchaseItemCondition: $this");
  }

  ItemSubCondition toItemSubCondition() {
    switch (this) {
      case PurchaseItemCondition.newItem:
        return ItemSubCondition.newItem;
      case PurchaseItemCondition.usedMint:
        return ItemSubCondition.mint;
      case PurchaseItemCondition.usedVeryGood:
        return ItemSubCondition.veryGood;
      case PurchaseItemCondition.usedGood:
        return ItemSubCondition.good;
      case PurchaseItemCondition.usedAcceptable:
        return ItemSubCondition.acceptable;
    }
    throw Exception("Invalid PurchaseItemCondition: $this");
  }
}
