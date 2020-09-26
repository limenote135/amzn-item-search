import 'package:amasearch/models/enums/item_condition.dart';
import 'package:amasearch/models/item.dart';
import 'package:amasearch/pages/search/detail_page/price_detail_tile.dart';
import 'package:amasearch/pages/search/detail_page/seller_list_tile.dart';
import 'package:amasearch/pages/search/purchase_page/purchase_page.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:amasearch/widgets/floating_action_margin.dart';
import 'package:amasearch/widgets/item_image.dart';
import 'package:amasearch/widgets/search_buttons.dart';
import 'package:amasearch/widgets/text_line_tile.dart';
import 'package:flutter/material.dart';
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_shopping_cart),
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
          TextListTile(
            leading: const Text("JAN"),
            main: Text(item.jan),
          ),
          TextListTile(
            leading: const Text("ASIN"),
            main: Text(item.asin),
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
