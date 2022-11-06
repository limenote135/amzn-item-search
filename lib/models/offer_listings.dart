import 'package:amasearch/repository/amazon.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'offer_listings.freezed.dart';

@freezed
class OfferListingsParams with _$OfferListingsParams {
  const factory OfferListingsParams({
    required String asin,
    @Default(false) bool prime,
    @Default(false) bool newItem,
    @Default(false) bool usedLikeNew,
    @Default(false) bool usedVeryGood,
    @Default(false) bool usedGood,
    @Default(false) bool usedAcceptable,
    @Default(0) int page,
  }) = _OfferListingsParams;
}

final offerListingsFutureProvider = FutureProvider.autoDispose
    .family<OfferListings, OfferListingsParams>((ref, param) async {
  final cancelToken = CancelToken();
  ref.onDispose(cancelToken.cancel);
  final amazon = ref.read(amazonRepositoryProvider);
  final ret = await amazon.getOffers(param, cancelToken);
  ref.keepAlive();
  return ret;
});

final offerTotalCountProvider = Provider.autoDispose
    .family<AsyncValue<int>, OfferListingsParams>((ref, param) {
  return ref
      .watch(offerListingsFutureProvider(param))
      .whenData((value) => value.total);
});

final cartOfferProvider =
    Provider.autoDispose.family<AsyncValue<OfferItem?>, String>((ref, asin) {
  final param = OfferListingsParams(
    asin: asin,
    prime: false,
    newItem: true,
    usedLikeNew: false,
    usedVeryGood: false,
    usedGood: false,
    usedAcceptable: false,
  );
  return ref
      .watch(offerListingsFutureProvider(param))
      .whenData((value) => value.cart);
});

final sellByAmazonProvider =
    FutureProvider.autoDispose.family<bool, String>((ref, asin) async {
  final param = OfferListingsParams(
    asin: asin,
    prime: false,
    newItem: true,
    usedLikeNew: false,
    usedVeryGood: false,
    usedGood: false,
    usedAcceptable: false,
  );
  final ret = await ref.watch(offerListingsFutureProvider(param).future);
  ref.keepAlive();
  return ret.cart?.sellerId == "" ||
      ret.offers.any((element) => element.sellerId == "");

  // return ref.watch(offerListingsFutureProvider(param)).whenData((value) {
  //   return value.cart?.sellerId == "" ||
  //       value.offers.any((element) => element.sellerId == "");
  // });
});

@freezed
class OfferAtIndexParam with _$OfferAtIndexParam {
  const factory OfferAtIndexParam({
    required OfferListingsParams params,
    required int index,
  }) = _OfferAtIndexParam;
}

final offerAtIndexProvider = Provider.autoDispose
    .family<AsyncValue<OfferItem>, OfferAtIndexParam>((ref, param) {
  final offsetInPage = param.index % 10;
  final page = param.index ~/ 10;

  return ref
      .watch(offerListingsFutureProvider(param.params.copyWith(page: page)))
      .whenData((value) => value.offers[offsetInPage]);
});

@freezed
class OfferListings with _$OfferListings {
  const factory OfferListings({
    required String asin,
    @Default(0) int total,
    OfferItem? cart,
    @Default(<OfferItem>[]) List<OfferItem> offers,
  }) = _OfferListings;
}

@freezed
class OfferItem with _$OfferItem {
  const factory OfferItem({
    required String shopName,
    @Default("") String sellerId,
    required int price,
    required String condition,
    required bool hasImage,
    required bool isFba,
  }) = _OfferItem;
}
