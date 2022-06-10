// 仕入れ画面の検索時の商品コンディションの指定に使う
enum ProductCondition {
  all,
  newItem,
  usedAll,
  usedMint,
  usedVeryGood,
  usedGood,
  usedAcceptable,
}

extension ProductConditionExtention on ProductCondition {
  String toDisplayString() {
    switch (this) {
      case ProductCondition.all:
        return "すべて";
      case ProductCondition.newItem:
        return "新品";
      case ProductCondition.usedAll:
        return "中古";
      case ProductCondition.usedMint:
        return "中古(ほぼ新品)";
      case ProductCondition.usedVeryGood:
        return "中古(非常に良い)";
      case ProductCondition.usedGood:
        return "中古(良い)";
      case ProductCondition.usedAcceptable:
        return "中古(可)";
    }
  }
}
