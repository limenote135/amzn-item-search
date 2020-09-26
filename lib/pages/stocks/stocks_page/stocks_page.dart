import 'package:amasearch/controllers/selected_stock_items_controller.dart';
import 'package:amasearch/controllers/stock_item_controller.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/pages/stocks/common/item_delete_handler.dart';
import 'package:amasearch/pages/stocks/detail_page/detail_page.dart';
import 'package:amasearch/pages/stocks/stocks_page/item_tile.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

import 'slidable_delete_tile.dart';

final _selectedItemCount = Provider((ref) {
  final items = ref.watch(selectedStockItemsControllerProvider.state);
  return items.length;
});

class StocksPage extends HookWidget {
  const StocksPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarSelector(context),
      body: const _Body(),
    );
  }

  AppBar _appBarSelector(BuildContext context) {
    final selectedItems =
        useProvider(selectedStockItemsControllerProvider.state);

    return selectedItems.isEmpty
        ? _getNormalAppBar()
        : _getItemSelectAppBar(context, selectedItems);
  }

  AppBar _getNormalAppBar() {
    return AppBar(
      title: const Text("仕入れ済み在庫"),
      //TODO: 共有と CSV 作成
    );
  }

  AppBar _getItemSelectAppBar(BuildContext context, List<StockItem> selected) {
    return AppBar(
      title: Text("${selected.length} 件選択"),
      leading: IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () =>
            context.read(selectedStockItemsControllerProvider).removeAll(),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () async {
            final deleted = await itemDeleteHandler(
              context: context,
              items: selected,
              content: "${selected.length} 件のアイテムを在庫リストから削除します",
            );
            if (deleted) {
              context.read(stockItemListControllerProvider).remove(selected);
              context.read(selectedStockItemsControllerProvider).removeAll();
            }
          },
        )
      ],
    );
  }
}

class _Body extends HookWidget {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = useProvider(stockItemListControllerProvider.state);
    final selectedItems =
        useProvider(selectedStockItemsControllerProvider.state);

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
                child: _InkWell(
                  child: selectedItems.isNotEmpty
                      ? const ItemTile()
                      : const SlidableDeleteTile(child: ItemTile()),
                ),
              )
          ],
        ).toList(),
        const ThemeDivider(),
      ],
    );
  }
}

class _InkWell extends HookWidget {
  const _InkWell({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentStockItemProvider);
    return InkWell(
      onTap: () {
        final count = context.read(_selectedItemCount);
        if (count > 0) {
          context.read(selectedStockItemsControllerProvider).toggleItem(item);
        } else {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => ProviderScope(
                overrides: [
                  currentStockItemProvider.overrideWithValue(item),
                ],
                child: const DetailPage(),
              ),
            ),
          );
        }
      },
      onLongPress: () =>
          context.read(selectedStockItemsControllerProvider).toggleItem(item),
      child: child,
    );
  }
}
