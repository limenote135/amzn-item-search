import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/models/enums/item_condition.dart';
import 'package:amasearch/pages/search/common/seller_list_tile.dart';
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

class SearchItemDetail extends ConsumerWidget {
  const SearchItemDetail({super.key, this.additionalWidget});

  final Widget? additionalWidget;

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
          if (additionalWidget != null) additionalWidget!,
          floatingActionMargin,
        ],
      ).toList(),
    );
  }
}

class _Restricted extends ConsumerWidget {
  const _Restricted();

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
