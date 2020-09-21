import 'package:ama_search/models/item_sub_condition.dart';

enum UsedSubCondition {
  all,
  mint,
  veryGood,
  good,
  acceptable,
}

extension UsedSubConditionExtention on UsedSubCondition {
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
    throw Exception("Invalid UsedSubCondition: $this");
  }
}
