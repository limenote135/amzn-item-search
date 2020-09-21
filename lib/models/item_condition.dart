enum ItemCondition {
  newItem,
  usedItem,
}

extension SearchConditionExtention on ItemCondition {
  String toMwsParam() {
    switch (this) {
      case ItemCondition.newItem:
        return "New";
      case ItemCondition.usedItem:
        return "Used";
    }
    throw Exception("Invalid SearchCondition: $this");
  }

  String toDisplayString() {
    switch (this) {
      case ItemCondition.newItem:
        return "新品";
      case ItemCondition.usedItem:
        return "中古";
    }
    throw Exception("Invalid SearchCondition: $this");
  }
}

ItemCondition toItemCondition(String condition) {
  switch (condition) {
    case "New":
      return ItemCondition.newItem;
    case "Used":
      return ItemCondition.usedItem;
    default:
      throw Exception("Unknown item condition: $condition");
  }
}
