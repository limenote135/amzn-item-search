import 'package:amasearch/models/offer_listings.dart';
import 'package:riverpod/riverpod.dart';

final currentOfferItemProvider =
    Provider<OfferItem>((_) => throw UnimplementedError());

final currentOfferListingParamProvider =
    Provider<OfferListingsParams>((_) => throw UnimplementedError());

final currentItemIndexProvider =
    Provider<int>((_) => throw UnimplementedError());

final currentSellerIdProvider =
    Provider<String>((_) => throw UnimplementedError());

final currentAsinProvider = Provider<String>((_) => throw UnimplementedError());
