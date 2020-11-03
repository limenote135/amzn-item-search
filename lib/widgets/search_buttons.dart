import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:hooks_riverpod/all.dart';

final currentAsinProvider = ScopedProvider<String>(null);

class SearchButtons extends HookWidget {
  const SearchButtons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final asin = useProvider(currentAsinProvider);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RaisedButton(
              child: const Text("Amazon"),
              onPressed: () async {
                final url = "https://www.amazon.co.jp/gp/product/$asin/";
                await context
                    .read(analyticsControllerProvider)
                    .logPushSearchButtonEvent(pushSearchButtonAmazonName);
                await FlutterWebBrowser.openWebPage(url: url);
              },
            ),
            RaisedButton(
              child: const Text("Keepa"),
              onPressed: () async {
                final url = "https://keepa.com/#!product/5-$asin/";
                await context
                    .read(analyticsControllerProvider)
                    .logPushSearchButtonEvent(pushSearchButtonKeepaName);
                await FlutterWebBrowser.openWebPage(url: url);
              },
            ),
            RaisedButton(
              child: const Text("Delta"),
              onPressed: () async {
                final url = "https://delta-tracer.com/item/detail/jp/$asin/";
                await context
                    .read(analyticsControllerProvider)
                    .logPushSearchButtonEvent(pushSearchButtonDeltaName);
                await FlutterWebBrowser.openWebPage(url: url);
              },
            ),
            RaisedButton(
              child: const Text("Keezon"),
              onPressed: () async {
                final url = "https://keezon.net/item/index?ASIN=$asin";
                await context
                    .read(analyticsControllerProvider)
                    .logPushSearchButtonEvent(pushSearchButtonKeezonName);
                await FlutterWebBrowser.openWebPage(url: url);
              },
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RaisedButton(
              child: const Text("出品確認"),
              onPressed: () async {
                final url =
                    "https://sellercentral.amazon.co.jp/abis/listing/syh?asin=$asin";
                await context
                    .read(analyticsControllerProvider)
                    .logPushSearchButtonEvent(
                        pushSearchButtonSellerCentralName);
                await FlutterWebBrowser.openWebPage(url: url);
              },
            ),
            RaisedButton(
              child: const Text("新品一覧"),
              onPressed: () async {
                final url =
                    "https://www.amazon.co.jp/gp/offer-listing/$asin/ref=olp_f_new?f_new=true";
                await context
                    .read(analyticsControllerProvider)
                    .logPushSearchButtonEvent(
                        pushSearchButtonAmazonNewListName);
                await FlutterWebBrowser.openWebPage(url: url);
              },
            ),
            RaisedButton(
              child: const Text("中古一覧"),
              onPressed: () async {
                final url =
                    "https://www.amazon.co.jp/gp/offer-listing/$asin/ref=olp_f_used?f_usedAcceptable=true&f_usedGood=true&f_used=true&f_usedLikeNew=true&f_usedVeryGood=true";
                await context
                    .read(analyticsControllerProvider)
                    .logPushSearchButtonEvent(
                        pushSearchButtonAmazonUsedListName);
                await FlutterWebBrowser.openWebPage(url: url);
              },
            ),
          ],
        )
      ],
    );
  }
}
