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
}
