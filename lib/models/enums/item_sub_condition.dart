enum ItemSubCondition {
  newItem,
  mint,
  veryGood,
  good,
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
