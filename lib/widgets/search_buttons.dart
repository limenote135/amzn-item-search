import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/events.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/item.dart';
import 'package:amasearch/models/offer_listings.dart';
import 'package:amasearch/pages/common/offer_listing_page/offer_listing_page.dart';
import 'package:amasearch/util/url_replacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentItemProvider = ScopedProvider<AsinData>(null);

class SearchButtons extends HookWidget {
  const SearchButtons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentItemProvider);
    final buttons = useProvider(generalSettingsControllerProvider.state
        .select((value) => value.customButtons));
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      spacing: 8,
      direction: Axis.horizontal,
      children: [
        RaisedButton(
          child: const Text("Amazon"),
          onPressed: () async {
            final url = "https://www.amazon.co.jp/gp/product/${item.asin}/";
            await context
                .read(analyticsControllerProvider)
                .logPushSearchButtonEvent(pushSearchButtonAmazonName);
            await FlutterWebBrowser.openWebPage(url: url);
          },
        ),
        RaisedButton(
          child: const Text("Keepa"),
          onPressed: () async {
            final url = "https://keepa.com/#!product/5-${item.asin}/";
            await context
                .read(analyticsControllerProvider)
                .logPushSearchButtonEvent(pushSearchButtonKeepaName);
            await FlutterWebBrowser.openWebPage(url: url);
          },
        ),
        RaisedButton(
          child: const Text("Delta"),
          onPressed: () async {
            final url = "https://delta-tracer.com/item/detail/jp/${item.asin}/";
            await context
                .read(analyticsControllerProvider)
                .logPushSearchButtonEvent(pushSearchButtonDeltaName);
            await FlutterWebBrowser.openWebPage(url: url);
          },
        ),
        RaisedButton(
          child: const Text("Keezon"),
          onPressed: () async {
            final url = "https://keezon.net/item/index?ASIN=${item.asin}";
            await context
                .read(analyticsControllerProvider)
                .logPushSearchButtonEvent(pushSearchButtonKeezonName);
            await FlutterWebBrowser.openWebPage(url: url);
          },
        ),
        RaisedButton(
          child: const Text("出品確認"),
          onPressed: () async {
            final url =
                "https://sellercentral.amazon.co.jp/abis/listing/syh?asin=${item.asin}";
            await context
                .read(analyticsControllerProvider)
                .logPushSearchButtonEvent(pushSearchButtonSellerCentralName);
            await FlutterWebBrowser.openWebPage(url: url);
          },
        ),
        RaisedButton(
          child: const Text("出品一覧"),
          onPressed: () async {
            final url =
                "https://www.amazon.co.jp/gp/offer-listing/${item.asin}/";
            await context
                .read(analyticsControllerProvider)
                .logPushSearchButtonEvent(pushSearchButtonAmazonListName);
            await FlutterWebBrowser.openWebPage(url: url);
          },
        ),
        RaisedButton(
          child: const Text("新品一覧"),
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
        ),
        RaisedButton(
          child: const Text("中古一覧"),
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
        ),
        for (final button in buttons)
          if (button.enable)
            RaisedButton(
              child: Text(button.title),
              onPressed: () async {
                final url = replaceUrl(template: button.pattern, item: item);
                if (!url.startsWith("http")) {
                  return;
                }
                await context
                    .read(analyticsControllerProvider)
                    .logPushSearchButtonEvent(button.pattern);
                await FlutterWebBrowser.openWebPage(url: url);
              },
            ),
      ],
    );
  }
}
