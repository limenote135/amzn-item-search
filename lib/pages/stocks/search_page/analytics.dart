import 'package:amasearch/models/enums/stock_item_search_conditions.dart';
import 'package:amasearch/models/stock_item_filter.dart';

String createSearchParam(StockItemFilter filter) {
  final params = <String>[];
  if (filter.keyword != null && filter.keyword != "") {
    params.add("kw");
  }
  if (filter.listingState != ListingState.all) {
    params.add("ls");
  }
  if (filter.productCondition != ProductCondition.all) {
    params.add("cond");
  }
  if (filter.purchasePriceUpper != null || filter.purchasePriceLower != null) {
    params.add("pp");
  }
  if (filter.sellPriceLower != null || filter.sellPriceUpper != null) {
    params.add("sp");
  }
  if (filter.purchaseDateRange != null) {
    params.add("pd");
  }
  if (filter.channel != FulfilmentChannel.all) {
    params.add("fba");
  }
  if (filter.retailer != null && filter.retailer != "") {
    params.add("rt");
  }

  return params.join(",");
}
