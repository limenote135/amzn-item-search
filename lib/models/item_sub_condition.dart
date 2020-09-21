enum ItemSubCondition {
  newItem,
  mint,
  veryGood,
  good,
  acceptable,
}

ItemSubCondition toItemSubCondition(String condition) {
  switch(condition) {
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