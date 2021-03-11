import 'package:amasearch/models/constants.dart';
import 'package:hive/hive.dart';

part 'item_condition.g.dart';

@HiveType(typeId: itemConditionTypeId)
enum ItemCondition {
  @HiveField(0)
  newItem,
  @HiveField(1)
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
  }

  String toDisplayString() {
    switch (this) {
      case ItemCondition.newItem:
        return "新品";
      case ItemCondition.usedItem:
        return "中古";
    }
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
