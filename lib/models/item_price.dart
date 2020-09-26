import 'package:amasearch/models/constants.dart';
import 'package:amasearch/repository/mws.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/all.dart';

import 'enums/fulfillment_channel.dart';
import 'enums/item_condition.dart';
import 'enums/item_sub_condition.dart';
import 'fee_info.dart';

part 'item_price.freezed.dart';
part 'item_price.g.dart';

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

  final ret = ItemPrices(
    newPrices: newPrice.prices,
    usedPrices: usedPrice.prices,
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
  @HiveType(typeId: itemPricesTypeId)
  const factory ItemPrices({
    @HiveField(0) @Default(<PriceDetail>[]) List<PriceDetail> newPrices,
    @HiveField(1) @Default(<PriceDetail>[]) List<PriceDetail> usedPrices,
    @HiveField(2) @required FeeInfo feeInfo,
  }) = _ItemPrices;
}

@freezed
abstract class PriceDetail with _$PriceDetail {
  @HiveType(typeId: priceDetailTypeId)
  const factory PriceDetail({
    @HiveField(0) @Default(ItemCondition.newItem) ItemCondition itemCondition,
    @HiveField(1)
    @Default(ItemSubCondition.newItem)
        ItemSubCondition subCondition,
    @HiveField(2)
    @Default(FulfillmentChannel.merchant)
        FulfillmentChannel channel,
    @HiveField(3) @Default(0) int price,
    @HiveField(4) @Default(0) int shipping,
    @HiveField(5) @Default(0) int point,
  }) = _PriceDetail;
}
