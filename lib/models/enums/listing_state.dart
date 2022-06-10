enum ListingState {
  all,
  listings,
  notListings,
}

extension ListingStateExtention on ListingState {
  String toDisplayString() {
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
