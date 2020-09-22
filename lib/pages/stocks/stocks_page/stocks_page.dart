import 'package:amasearch/controllers/stock_item_controller.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/pages/stocks/stocks_page/item_tile.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

class StocksPage extends StatelessWidget {
  const StocksPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("仕入れ済み在庫"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends HookWidget {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = useProvider(stockItemListControllerProvider.state);

    return ListView(
      children: [
        ...ListTile.divideTiles(
          context: context,
          tiles: [
            for (final item in items)
              ProviderScope(
                overrides: [
                  currentStockItemProvider.overrideWithValue(item),
                ],
                child: const ItemTile(),
              )
          ],
        ).toList(),
        const ThemeDivider(),
      ],
    );
  }
}
