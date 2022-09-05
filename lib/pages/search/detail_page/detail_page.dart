import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/models/enums/item_condition.dart';
import 'package:amasearch/pages/search/camera_page/camera_page.dart';
import 'package:amasearch/pages/search/common/constants.dart';
import 'package:amasearch/pages/search/common/route_from.dart';
import 'package:amasearch/pages/search/common/seller_list_tile.dart';
import 'package:amasearch/pages/search/purchase_page/purchase_page.dart';
import 'package:amasearch/styles/font.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:amasearch/widgets/floating_action_margin.dart';
import 'package:amasearch/widgets/item_image.dart';
import 'package:amasearch/widgets/search_buttons.dart';
import 'package:amasearch/widgets/strong_container.dart';
import 'package:amasearch/widgets/text_line_tile.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'price_detail_tile.dart';

class DetailPage extends HookConsumerWidget {
  const DetailPage({Key? key}) : super(key: key);
  static const routeName = "/search/detail";

  static Route<void> route(AsinData item, String fromRoute) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => ProviderScope(
        overrides: [
          currentAsinDataProvider.overrideWithValue(item),
          fromRouteProvider.overrideWithValue(fromRoute),
        ],
        child: const DetailPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentAsinDataProvider);
    final fromRoute = ref.watch(fromRouteProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("商品詳細"),
      ),
      body: const _Body(),
      floatingActionButton: Row(
        children: [
          const Padding(padding: EdgeInsets.only(left: 30)),
          FloatingActionButton(
            onPressed: () => Navigator.push(
              context,
              PurchasePage.route(item),
            ),
            child: AnimatedTheme(
              data: ThemeData.light(),
              child: const Icon(Icons.add_shopping_cart),
            ),
          ),
          const Spacer(),
          FloatingActionButton(
            heroTag: onStartCameraHeroTag,
            onPressed: () async {
              if (fromRoute == CameraPage.routeName) {
                Navigator.of(context)
                    .popUntil(ModalRoute.withName(CameraPage.routeName));
              } else {
                final route = await CameraPage.route(context);
                if (route != null) {
                  await Navigator.of(context)
                      .pushAndRemoveUntil(route, ModalRoute.withName("/"));
                }
              }
            },
            child: AnimatedTheme(
              data: ThemeData.light(),
              child: const Icon(Icons.camera_alt),
            ),
          ),
        ],
      ),
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentAsinDataProvider);
    final isRestricted = item.restrictions.newItem | item.restrictions.used;
    return ListView(
      children: ListTile.divideTiles(
        context: context,
        tiles: [
          if (isRestricted) const _Restricted(),
          InkWell(
            onLongPress: () {
              Clipboard.setData(ClipboardData(text: item.title)).then((_) {
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("商品名をコピーしました"),
                  ),
                );
              });
            },
            child: ListTile(
              leading: ItemImage(
                url: item.imageUrl,
              ),
              title: Text(item.title),
            ),
          ),
          InkWell(
            onLongPress: () {
              Clipboard.setData(ClipboardData(text: item.jan)).then((_) {
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("JAN コードをコピーしました"),
                  ),
                );
              });
            },
            child: TextListTile(
              leading: const Text("JAN"),
              main: Text(item.jan),
            ),
          ),
          InkWell(
            onLongPress: () {
              Clipboard.setData(ClipboardData(text: item.asin)).then((_) {
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("ASIN をコピーしました"),
                  ),
                );
              });
            },
            child: TextListTile(
              leading: const Text("ASIN"),
              main: Text(item.asin),
            ),
          ),
          TextListTile(
            leading: const Text("順位"),
            main: Text("${numberFormatter.format(item.rank)} 位"),
          ),
          const PriceDetailTile(ItemCondition.newItem),
          const PriceDetailTile(ItemCondition.usedItem),
          const SellerListTile(),
          ProviderScope(
            overrides: [
              currentItemProvider.overrideWithValue(item),
            ],
            child: const SearchButtons(),
          ),
          floatingActionMargin,
        ],
      ).toList(),
    );
  }
}

class _Restricted extends ConsumerWidget {
  const _Restricted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentAsinDataProvider);

    final target = _createRestrictedText(item.restrictions);
    return StrongContainer(
      ListTile(
        title: Column(
          children: [
            Text("出品不可商品です$target", style: strongTextStyle),
            Text.rich(
              TextSpan(
                text: "出品許可申請はこちら",
                style: const TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    await FlutterWebBrowser.openWebPage(
                      url:
                          "https://sellercentral.amazon.co.jp/hz/approvalrequest/restrictions/approve?asin=${item.asin}",
                    );
                  },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _createRestrictedText(ListingRestrictions restrictions) {
    if (restrictions.newItem && !restrictions.used) {
      return "(新品)";
    }
    if (!restrictions.newItem && restrictions.used) {
      return "(中古)";
    }
    return "(新/古)";
  }
}
