import 'package:amasearch/repository/amazon.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'offer_stocks.freezed.dart';

@freezed
abstract class OfferStocksParam with _$OfferStocksParam {
  const factory OfferStocksParam({
    @required String asin,
    @required String sellerId,
  }) = _OfferStocksParam;
}

final offerStocksFutureProvider = FutureProvider.autoDispose
    .family<int, OfferStocksParam>((ref, param) async {
  final cancelToken = CancelToken();
  ref.onDispose(cancelToken.cancel);
  final amazon = ref.read(amazonRepositoryProvider);
  final ret =
      await amazon.getStockCount(param.asin, param.sellerId, cancelToken);
  ref.maintainState = true; // TODO:

  return ret;
});
