import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';

part 'keep_item_filter.freezed.dart';

final currentKeepItemFilterProvider =
    StateProvider((_) => const KeepItemFilter());

@freezed
class KeepItemFilter with _$KeepItemFilter {
  const factory KeepItemFilter({
    String? keyword,
    int? rankLower,
    int? rankUpper,
    @Default(true) bool priorFba,
    int? newPriceLower,
    int? newPriceUpper,
    int? usedPriceLower,
    int? usedPriceUpper,
    DateTimeRange? keepDateRange,
  }) = _KeepItemFilter;
}
