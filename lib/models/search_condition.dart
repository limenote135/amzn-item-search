enum SearchCondition {
  newItem,
  usedItem,
}

extension SearchConditionExtention on SearchCondition {
  String toMwsParam() {
    switch (this) {
      case SearchCondition.newItem:
        return "New";
      case SearchCondition.usedItem:
        return "Used";
    }
    throw Exception("Invalid SearchCondition: $this");
  }

  String toDisplayString() {
    switch (this) {
      case SearchCondition.newItem:
        return "新品";
      case SearchCondition.usedItem:
        return "中古";
    }
    throw Exception("Invalid SearchCondition: $this");
  }
}
