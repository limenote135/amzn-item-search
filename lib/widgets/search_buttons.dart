import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/events.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/models/general_settings_default.dart';
import 'package:amasearch/models/offer_listings.dart';
import 'package:amasearch/pages/common/keepa_page/keepa_page.dart';
import 'package:amasearch/pages/common/offer_listing_page/offer_listing_page.dart';
import 'package:amasearch/util/url_replacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentItemProvider =
    Provider<AsinData>((_) => throw UnimplementedError());

class SearchButtons extends HookConsumerWidget {
  const SearchButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentItemProvider);
    final buttons = ref.watch(
      generalSettingsControllerProvider.select((value) => value.customButtons),
    );
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      spacing: 8,
      children: [
        ElevatedButton(
          onPressed: () async {
            final url =
                replaceUrl(template: customButtonAmazonListingsUrl, item: item);
            await ref
                .read(analyticsControllerProvider)
                .logPushSearchButtonEvent(pushSearchButtonAmazonListName);
            await FlutterWebBrowser.openWebPage(url: url);
          },
          child: const Text("出品一覧"),
        ),
        ElevatedButton(
          onPressed: () async {
            await ref
                .read(analyticsControllerProvider)
                .logPushSearchButtonEvent(pushSearchButtonAmazonNewOffersName);
            await Navigator.push(
              context,
              OfferListingPage.route(
                OfferListingsParams(
                  asin: item.asin,
                  newItem: true,
                ),
              ),
            );
          },
          child: const Text("新品一覧"),
        ),
        ElevatedButton(
          onPressed: () async {
            await ref
                .read(analyticsControllerProvider)
                .logPushSearchButtonEvent(pushSearchButtonAmazonUsedOffersName);
            await Navigator.push(
              context,
              OfferListingPage.route(
                OfferListingsParams(
                  asin: item.asin,
                  usedLikeNew: true,
                  usedVeryGood: true,
                  usedGood: true,
                  usedAcceptable: true,
                ),
              ),
            );
          },
          child: const Text("中古一覧"),
        ),
        ElevatedButton(
          onPressed: () async {
            await ref
                .read(analyticsControllerProvider)
                .logPushSearchButtonEvent(pushSearchButtonKeepaName);
            await Navigator.push(context, KeepaPage.route(item.asin));
          },
          child: const Text("Keepa"),
        ),
        for (final button in buttons)
          if (button.enable)
            ElevatedButton(
              onPressed: () async {
                final url = replaceUrl(template: button.pattern, item: item);
                if (!url.startsWith("http")) {
                  return;
                }
                final eventName =
                    customButtonEventMap.containsKey(button.pattern)
                        ? customButtonEventMap[button.pattern]!
                        : button.pattern;
                await ref
                    .read(analyticsControllerProvider)
                    .logPushSearchButtonEvent(eventName);
                await FlutterWebBrowser.openWebPage(url: url);
              },
              child: Text(button.title),
            ),
      ],
    );
  }
}
