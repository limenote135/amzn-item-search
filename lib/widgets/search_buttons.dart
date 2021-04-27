import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/events.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/offer_listings.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/pages/common/offer_listing_page/offer_listing_page.dart';
import 'package:amasearch/util/url_replacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentItemProvider = ScopedProvider<AsinData>(null);

class SearchButtons extends HookWidget {
  const SearchButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentItemProvider);
    final buttons = useProvider(generalSettingsControllerProvider
        .select((value) => value.customButtons));
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      spacing: 8,
      direction: Axis.horizontal,
      children: [
        ElevatedButton(
          onPressed: () async {
            final url =
                "https://www.amazon.co.jp/gp/offer-listing/${item.asin}/";
            await context
                .read(analyticsControllerProvider)
                .logPushSearchButtonEvent(pushSearchButtonAmazonListName);
            await FlutterWebBrowser.openWebPage(url: url);
          },
          child: const Text("出品一覧"),
        ),
        ElevatedButton(
          onPressed: () async {
            await context
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
            await context
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
            final url = "https://keepa.com/#!product/5-${item.asin}/";
            await context
                .read(analyticsControllerProvider)
                .logPushSearchButtonEvent(pushSearchButtonKeepaName);
            await FlutterWebBrowser.openWebPage(url: url);
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
                await context
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
