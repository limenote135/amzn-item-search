import 'package:ama_search/models/fee_info.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_price.freezed.dart';

@freezed
abstract class ItemPrices with _$ItemPrices {
  const factory ItemPrices({
    @required ItemPrice newPrice,
    @required ItemPrice usedPrice,
    @required FeeInfo feeInfo,
  }) = _ItemPrices;
}

@freezed
abstract class PriceDetail with _$PriceDetail {
  const factory PriceDetail({
    @Default("") String itemCondition,
    @Default("") String subCondition,
    @Default("") String channel,
    @Default(0) int price,
    @Default(0) int shipping,
    @Default(0) int point,
  }) = _PriceInfo;
}

@freezed
abstract class ItemPrice with _$ItemPrice {
  const factory ItemPrice({
    @Default(0) int lowestPrice, // 最安値
    @Default(0) int shipping, // 送料
    @Default(<PriceDetail>[]) List<PriceDetail> prices,
  }) = _ItemPrice;
}
