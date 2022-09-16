// 仕入れ画面の検索時の商品コンディションの指定に使う
enum ProductCondition {
  all,
  newItem,
  usedAll,
  usedMint,
  usedVeryGood,
  usedGood,
  usedAcceptable;

  String get displayString {
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

enum ListingState {
  all,
  listings,
  notListings;

  String get displayString {
    switch (this) {
      case ListingState.all:
        return "すべて";
      case ListingState.listings:
        return "出品済み";
      case ListingState.notListings:
        return "未出品";
    }
  }
}

// 検索時の出品方法の指定に使う
enum FulfilmentChannel {
  all,
  amazon,
  merchant;

  String get displayString {
    switch (this) {
      case FulfilmentChannel.all:
        return "すべて";
      case FulfilmentChannel.amazon:
        return "FBA";
      case FulfilmentChannel.merchant:
        return "自己発送";
    }
  }
}
