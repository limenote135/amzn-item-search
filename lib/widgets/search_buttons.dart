import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/events.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/models/general_settings_default.dart';
import 'package:amasearch/models/offer_listings.dart';
import 'package:amasearch/pages/common/keepa_page/keepa_page.dart';
import 'package:amasearch/pages/common/offer_listing_page/offer_listing_page.dart';
import 'package:amasearch/pages/common/variation_page/variation_page.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/url_replacer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

final currentItemProvider =
    Provider<AsinData>((_) => throw UnimplementedError());

class SearchButtons extends HookConsumerWidget {
  const SearchButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentItemProvider);
    final isPaidUser = ref.watch(isPaidUserProvider);
    final standardButtons = ref.watch(
      generalSettingsControllerProvider
          .select((value) => value.standardButtons),
    );
    var buttons = ref.watch(
      generalSettingsControllerProvider.select(
        (value) => value.customButtons.where((e) => e.enable).toList(),
      ),
    );
    if (!isPaidUser) {
      buttons = buttons.take(4).toList();
    }
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      spacing: 8,
      children: [
        if (standardButtons[standardButtonAmazonListKey] ?? true)
          ElevatedButton(
            onPressed: () async {
              final url = replaceUrl(
                template: customButtonAmazonListingsUrl,
                item: item,
              );
              await ref
                  .read(analyticsControllerProvider)
                  .logPushSearchButtonEvent(pushSearchButtonAmazonListName);
              await launchUrl(
                Uri.parse(url),
                mode: LaunchMode.inAppBrowserView,
              );
            },
            child: const Text("出品一覧"),
          ),
        if (standardButtons[standardButtonNewOffersKey] ?? true)
          ElevatedButton(
            onPressed: () async {
              await ref
                  .read(analyticsControllerProvider)
                  .logPushSearchButtonEvent(
                    pushSearchButtonAmazonNewOffersName,
                  );
              await OfferListingPage.goToOfferListingPage(
                context,
                OfferListingsParams(
                  asin: item.asin,
                  newItem: true,
                ),
              );
            },
            child: const Text("新品一覧"),
          ),
        if (standardButtons[standardButtonUsedOffersKey] ?? true)
          ElevatedButton(
            onPressed: () async {
              await ref
                  .read(analyticsControllerProvider)
                  .logPushSearchButtonEvent(
                    pushSearchButtonAmazonUsedOffersName,
                  );
              await OfferListingPage.goToOfferListingPage(
                context,
                OfferListingsParams(
                  asin: item.asin,
                  usedLikeNew: true,
                  usedVeryGood: true,
                  usedGood: true,
                  usedAcceptable: true,
                ),
              );
            },
            child: const Text("中古一覧"),
          ),
        if (standardButtons[standardButtonKeepaPageKey] ?? true)
          ElevatedButton(
            onPressed: () async {
              await ref
                  .read(analyticsControllerProvider)
                  .logPushSearchButtonEvent(pushSearchButtonKeepaName);
              await Navigator.push(context, KeepaPage.route(item.asin));
            },
            child: const Text("Keepa"),
          ),
        if (item.variationRoot != "" &&
            (standardButtons[standardButtonVariationPageKey] ?? true) &&
            isPaidUser)
          ElevatedButton(
            onPressed: () async {
              await ref
                  .read(analyticsControllerProvider)
                  .logPushSearchButtonEvent(pushSearchButtonVariationName);
              await Navigator.push(
                context,
                VariationPage.route(item.variationRoot),
              );
            },
            child: const Text("ﾊﾞﾘｴｰｼｮﾝ"),
          ),
        for (final button in buttons)
          ElevatedButton(
            onPressed: () async {
              final url = replaceUrl(template: button.pattern, item: item);
              if (!url.startsWith("http")) {
                return;
              }
              final eventName = customButtonEventMap.containsKey(button.pattern)
                  ? customButtonEventMap[button.pattern]!
                  : button.pattern;
              await ref
                  .read(analyticsControllerProvider)
                  .logPushSearchButtonEvent(eventName);
              await launchUrl(
                Uri.parse(url),
                mode: LaunchMode.inAppBrowserView,
              );
            },
            child: Text(button.title),
          ),
      ],
    );
  }
}
