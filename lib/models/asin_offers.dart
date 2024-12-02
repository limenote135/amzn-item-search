import 'package:freezed_annotation/freezed_annotation.dart';

import 'offer_listings.dart';

part 'asin_offers.freezed.dart';

@freezed
class AsinOffers with _$AsinOffers {
  const factory AsinOffers({
    @Default(false) bool isValidNew,
    @Default(false) bool isValidUsed,
    @Default(false) bool isValidCart,
    @Default(0) int newTotal,
    @Default(0) int usedTotal,
    @Default(null) OfferItem? cart,
    @Default(<OfferItem>[]) List<OfferItem> newOffers,
    @Default(<OfferItem>[]) List<OfferItem> usedOffers,
  }) = _AsinOffers;
}
