import 'package:amasearch/models/keep_item_filter.dart';

String createSearchParam(KeepItemFilter filter) {
  final params = <String>[];
  if (filter.keyword != null && filter.keyword != "") {
    params.add("kw");
  }
  if (filter.rankLower != null || filter.rankUpper != null) {
    params.add("rk");
  }
  if (!filter.priorFba) {
    params.add("!fba");
  }
  if (filter.newPriceLower != null || filter.newPriceUpper != null) {
    params.add("np");
  }
  if (filter.usedPriceLower != null || filter.usedPriceUpper != null) {
    params.add("up");
  }
  if (filter.keepDateRange != null) {
    params.add("kd");
  }

  return params.join(",");
}
