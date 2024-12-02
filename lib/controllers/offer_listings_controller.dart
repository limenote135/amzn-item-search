import 'package:amasearch/models/asin_offers.dart';
import 'package:amasearch/models/offer_listings.dart';
import 'package:riverpod/riverpod.dart';

final offerListingsControllerProvider =
    StateNotifierProvider<OfferListingsController, Map<String, AsinOffers>>(
  (ref) => OfferListingsController(),
);

final asinOfferProvider = Provider.autoDispose.family<AsinOffers, String>(
  (ref, asin) {
    final controller = ref.watch(offerListingsControllerProvider);
    return controller[asin] ?? const AsinOffers();
  },
);

class OfferListingsController extends StateNotifier<Map<String, AsinOffers>> {
  OfferListingsController() : super({});

  void addNewOffers(
    String asin,
    int? total,
    OfferItem? cart,
    List<OfferItem> items,
  ) {
    final offers = state[asin] ?? const AsinOffers();
    final newOffers = offers.copyWith(
      newTotal: total ?? offers.newTotal,
      newOffers: <OfferItem>[
        ...offers.newOffers,
        ...items,
      ],
      isValidNew: true,
      cart: cart ?? offers.cart,
      isValidCart: true,
    );
    state = {...state, asin: newOffers};
  }

  void addUsedOffers(
    String asin,
    int? total,
    OfferItem? cart,
    List<OfferItem> items,
  ) {
    final offers = state[asin] ?? const AsinOffers();
    final usedOffers = offers.copyWith(
      usedTotal: total ?? offers.usedTotal,
      usedOffers: <OfferItem>[
        ...offers.usedOffers,
        ...items,
      ],
      isValidUsed: true,
      cart: cart ?? offers.cart,
      isValidCart: true,
    );
    state = {...state, asin: usedOffers};
  }
}
