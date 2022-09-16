import 'package:amasearch/models/enums/stock_item_search_conditions.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';

part 'stock_item_filter.freezed.dart';

final currentStockItemFilterProvider =
    StateProvider((_) => const StockItemFilter());

@freezed
class StockItemFilter with _$StockItemFilter {
  const factory StockItemFilter({
    String? keyword,
    @Default(ListingState.all) ListingState listingState,
    @Default(ProductCondition.all) ProductCondition productCondition,
    @Default(FulfilmentChannel.all) FulfilmentChannel channel,
    int? purchasePriceLower,
    int? purchasePriceUpper,
    int? sellPriceLower,
    int? sellPriceUpper,
    DateTimeRange? purchaseDateRange,
  }) = _StockItemFilter;
}
