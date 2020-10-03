import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:url_launcher/url_launcher.dart';

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
                //TODO: canLaunch する必要があるか？
                if (await canLaunch(url)) {
                  await launch(url, forceWebView: true, enableJavaScript: true);
                } else {
                  throw Exception('Could not launch $url');
                }
              },
            ),
            RaisedButton(
              child: const Text("Keepa"),
              onPressed: () async {
                final url = "https://keepa.com/#!product/5-$asin/";
                if (await canLaunch(url)) {
                  await launch(url,
                      forceWebView: true,
                      enableJavaScript: true,
                      enableDomStorage: true);
                } else {
                  throw Exception('Could not launch $url');
                }
              },
            ),
            RaisedButton(
              child: const Text("Delta"),
              onPressed: () async {
                final url = "https://delta-tracer.com/item/detail/jp/$asin/";
                if (await canLaunch(url)) {
                  await launch(url, forceWebView: true, enableJavaScript: true);
                } else {
                  throw Exception('Could not launch $url');
                }
              },
            ),
            RaisedButton(
              child: const Text("Keezon"),
              onPressed: () async {
                final url = "https://keezon.net/item/index?ASIN=$asin";
                if (await canLaunch(url)) {
                  await launch(url, forceWebView: true, enableJavaScript: true);
                } else {
                  throw Exception('Could not launch $url');
                }
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
                if (await canLaunch(url)) {
                  await launch(url, forceWebView: true, enableJavaScript: true);
                } else {
                  throw Exception('Could not launch $url');
                }
              },
            ),
            RaisedButton(
              child: const Text("新品一覧"),
              onPressed: () async {
                final url =
                    "https://www.amazon.co.jp/gp/offer-listing/$asin/ref=olp_f_new?f_new=true";
                if (await canLaunch(url)) {
                  await launch(url, forceWebView: true, enableJavaScript: true);
                } else {
                  throw Exception('Could not launch $url');
                }
              },
            ),
            RaisedButton(
              child: const Text("中古一覧"),
              onPressed: () async {
                final url =
                    "https://www.amazon.co.jp/gp/offer-listing/$asin/ref=olp_f_used?f_usedAcceptable=true&f_usedGood=true&f_used=true&f_usedLikeNew=true&f_usedVeryGood=true";
                if (await canLaunch(url)) {
                  await launch(url, forceWebView: true, enableJavaScript: true);
                } else {
                  throw Exception('Could not launch $url');
                }
              },
            ),
          ],
        )
      ],
    );
  }
}
