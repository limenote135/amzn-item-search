import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/events.dart';
import 'package:amasearch/models/enums/shortcut_type.dart';
import 'package:amasearch/models/offer_listings.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/pages/common/keepa_page/keepa_page.dart';
import 'package:amasearch/pages/common/offer_listing_page/offer_listing_page.dart';
import 'package:amasearch/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final navigationTargetProvider =
    Provider<String>((_) => throw UnimplementedError());

class NavigationAction extends HookConsumerWidget {
  const NavigationAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final target = ref.watch(navigationTargetProvider);
    final items = ref.watch(currentSearchItemProvider);

    var title = "";
    var event = "";
    Route<void> navigation;
    switch (target) {
      case navigationTargetKeepa:
        title = "Keepa";
        event = pushSearchButtonKeepaName;
        navigation = KeepaPage.route(items.asins.first.asin);
        break;
      case navigationTargetNewOffers:
        title = "新品一覧";
        event = pushSearchButtonAmazonNewOffersName;
        navigation = OfferListingPage.route(OfferListingsParams(
          asin: items.asins.first.asin,
          newItem: true,
        ));
        break;
      case navigationTargetUsedOffers:
        title = "中古一覧";
        event = pushSearchButtonAmazonUsedOffersName;
        navigation = OfferListingPage.route(OfferListingsParams(
          asin: items.asins.first.asin,
          usedLikeNew: true,
          usedVeryGood: true,
          usedGood: true,
          usedAcceptable: true,
        ));
        break;
      default:
        throw Exception("Unknown navigation target: $target");
    }
    return IconSlideAction(
      caption: title,
      color: Colors.deepPurpleAccent,
      icon: Icons.search,
      onTap: () async {
        unfocus();
        await ref
            .read(analyticsControllerProvider)
            .logPushSearchButtonEvent(event);
        await Navigator.of(context).push(navigation);
      },
    );
  }
}
