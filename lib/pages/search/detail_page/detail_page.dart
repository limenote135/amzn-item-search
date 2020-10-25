import 'package:amasearch/models/enums/item_condition.dart';
import 'package:amasearch/models/item.dart';
import 'package:amasearch/pages/search/camera_page/camera_page.dart';
import 'package:amasearch/pages/search/common/constants.dart';
import 'package:amasearch/pages/search/detail_page/price_detail_tile.dart';
import 'package:amasearch/pages/search/detail_page/seller_list_tile.dart';
import 'package:amasearch/pages/search/purchase_page/purchase_page.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:amasearch/widgets/floating_action_margin.dart';
import 'package:amasearch/widgets/item_image.dart';
import 'package:amasearch/widgets/search_buttons.dart';
import 'package:amasearch/widgets/text_line_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

class DetailPage extends HookWidget {
  const DetailPage({Key key}) : super(key: key);
  static const routeName = "/detail";

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentAsinDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("商品詳細"),
      ),
      body: const _Body(),
      floatingActionButton: Row(
        children: [
          const Padding(padding: EdgeInsets.only(left: 30)),
          FloatingActionButton(
            child: AnimatedTheme(
              data: ThemeData.light(),
              child: const Icon(Icons.add_shopping_cart),
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (context) => ProviderScope(
                  overrides: [
                    currentAsinDataProvider.overrideWithValue(item),
                  ],
                  child: const PurchasePage(),
                ),
              ),
            ),
          ),
          const Spacer(),
          FloatingActionButton(
            child: AnimatedTheme(
              data: ThemeData.light(),
              child: const Icon(Icons.camera_alt),
            ),
            heroTag: onStartCameraHeroTag,
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  CameraPage.routeName, ModalRoute.withName("/"));
            },
          ),
        ],
      ),
    );
  }
}

class _Body extends HookWidget {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentAsinDataProvider);
    return ListView(
      children: ListTile.divideTiles(
        context: context,
        tiles: [
          ListTile(
            leading: ItemImage(
              url: item.imageUrl,
              data: item.imageData,
            ),
            title: Text(item.title),
          ),
          InkWell(
            child: TextListTile(
              leading: const Text("JAN"),
              main: Text(item.jan),
            ),
            onLongPress: () {
              Clipboard.setData(ClipboardData(text: item.jan)).then((_) {
                Scaffold.of(context).removeCurrentSnackBar();
                Scaffold.of(context).showSnackBar(const SnackBar(
                  content: Text("JAN コードをコピーしました"),
                ));
              });
            },
          ),
          InkWell(
            child: TextListTile(
              leading: const Text("ASIN"),
              main: Text(item.asin),
            ),
            onLongPress: () {
              Clipboard.setData(ClipboardData(text: item.asin)).then((_) {
                Scaffold.of(context).removeCurrentSnackBar();
                Scaffold.of(context).showSnackBar(const SnackBar(
                  content: Text("ASIN をコピーしました"),
                ));
              });
            },
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
              currentAsinProvider.overrideWithValue(item.asin),
            ],
            child: const SearchButtons(),
          ),
          floatingActionMargin,
        ],
      ).toList(),
    );
  }
}
