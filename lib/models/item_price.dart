import 'package:amasearch/repository/mws.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/all.dart';

import 'enums/fulfillment_channel.dart';
import 'enums/item_condition.dart';
import 'enums/item_sub_condition.dart';
import 'fee_info.dart';

part 'item_price.freezed.dart';

final itemPricesFutureProvider =
    FutureProvider.autoDispose.family<ItemPrices, String>((ref, asin) async {
  final mws = ref.read(mwsRepositoryProvider);

  final newPricesF =
      mws.getLowestOfferListingsForASIN([asin], ItemCondition.newItem);
  final usedPricesF =
      mws.getLowestOfferListingsForASIN([asin], ItemCondition.usedItem);
  final feeInfoF =
      mws.getMyFeesEstimate(asin, 1000, useFba: true).then((value) async {
    if (value.fbaFees == -1 || value.fbaFees == null) {
      return mws.getMyFeesEstimate(asin, 1000, useFba: false);
    }
    return value;
  });

  final newPrice = await newPricesF;
  final usedPrice = await usedPricesF;
  final feeInfo = await feeInfoF;

  final newPriceInfo = ItemPrice(
    lowestPrice: newPrice.lowestPrice,
    shipping: newPrice.shipping,
    prices: newPrice.prices,
  );

  final usedPriceInfo = ItemPrice(
    lowestPrice: usedPrice.lowestPrice,
    shipping: usedPrice.shipping,
    prices: usedPrice.prices,
  );

  final ret = ItemPrices(
    newPrice: newPriceInfo,
    usedPrice: usedPriceInfo,
    feeInfo: FeeInfo(
      referralFeeRate: feeInfo.referralFeeRate,
      variableClosingFee: feeInfo.variableClosingFee,
      fbaFee: feeInfo.fbaFees,
    ),
  );

  ref.maintainState = true;
  return ret;
});

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
    @Default(ItemCondition.newItem) ItemCondition itemCondition,
    @Default(ItemSubCondition.newItem) ItemSubCondition subCondition,
    @Default(FulfillmentChannel.merchant) FulfillmentChannel channel,
    @Default(0) int price,
    @Default(0) int shipping,
    @Default(0) int point,
  }) = _PriceInfo;
}

@freezed
abstract class ItemPrice with _$ItemPrice {
  const factory ItemPrice({
    @Default(0) int lowestPrice, // 最安値 // TODO: 使ってないような？
    @Default(0) int shipping, // 送料
    @Default(<PriceDetail>[]) List<PriceDetail> prices,
  }) = _ItemPrice;
}
