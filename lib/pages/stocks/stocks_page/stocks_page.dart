import 'package:amasearch/controllers/selected_stock_items_controller.dart';
import 'package:amasearch/controllers/stock_item_controller.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/pages/stocks/common/item_delete_handler.dart';
import 'package:amasearch/pages/stocks/detail_page/detail_page.dart';
import 'package:amasearch/pages/stocks/stocks_page/item_tile.dart';
import 'package:amasearch/pages/stocks/stocks_page/summary_tile.dart';
import 'package:amasearch/pages/stocks/stocks_page/total_profit.dart';
import 'package:amasearch/util/csv.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:amasearch/widgets/with_underline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:share/share.dart';

import 'slidable_delete_tile.dart';

final _selectedItemCount = Provider((ref) {
  final items = ref.watch(selectedStockItemsControllerProvider.state);
  return items.length;
});

enum _StockPageActions {
  share,
  clear,
}

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
        ? _getNormalAppBar(context)
        : _getItemSelectAppBar(context, selectedItems);
  }

  AppBar _getNormalAppBar(BuildContext context) {
    return AppBar(
      title: const Text("仕入れ済み商品"),
      actions: [
        PopupMenuButton<_StockPageActions>(
          padding: const EdgeInsets.all(0),
          onSelected: (value) => handleAction(context, value),
          itemBuilder: (context) => const [
            PopupMenuItem(
              value: _StockPageActions.share,
              child: ListTile(
                leading: Icon(Icons.share),
                title: Text("共有"),
              ),
            ),
            PopupMenuItem(
              value: _StockPageActions.clear,
              child: ListTile(
                leading: Icon(Icons.delete),
                title: Text("リストをクリア"),
              ),
            )
          ],
        )
      ],
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

  Future<void> handleAction(
      BuildContext context, _StockPageActions value) async {
    final itemList = context.read(stockItemListControllerProvider.state);

    switch (value) {
      case _StockPageActions.share:
        final file = await StockItemCsv.create("StockList", itemList);
        await Share.shareFiles([file.absolute.path], subject: "仕入れ済み商品一覧");
        break;
      case _StockPageActions.clear:
        await itemDeleteHandler(
          context: context,
          deleteAll: true,
          content: "在庫リストからすべてのアイテムを削除します",
        );
        break;
    }
  }
}

class _Body extends HookWidget {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = useProvider(stockItemListControllerProvider.state);
    final selectedItems =
        useProvider(selectedStockItemsControllerProvider.state);

    final tile = _InkWell(
      child: selectedItems.isNotEmpty
          ? const ItemTile()
          : const SlidableDeleteTile(child: ItemTile()),
    );

    return Column(
      children: [
        const WithUnderLine(TotalProfit()),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const ThemeDivider(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final tileImpl = ProviderScope(
                overrides: [
                  currentStockItemProvider.overrideWithValue(items[index]),
                ],
                child: index != items.length - 1 ? tile : WithUnderLine(tile),
              );

              final summary = _getSummary(items, index);
              if (summary != null) {
                return Column(
                  children: [
                    summary,
                    const ThemeDivider(),
                    tileImpl,
                  ],
                );
              }

              return tileImpl;
            },
          ),
        ),
      ],
    );
  }

  Widget _getSummary(List<StockItem> items, int index) {
    final current =
        DateTime.parse(items[index].purchaseDate).toLocal().dayFormat();
    if (index == 0) {
      final lastIndex = _getLastIndex(items, 0, current);
      return ProviderScope(
        overrides: [
          dateItemsProvider
              .overrideWithValue(items.getRange(0, lastIndex).toList())
        ],
        child: const SummaryTile(),
      );
    }

    final above =
        DateTime.parse(items[index - 1].purchaseDate).toLocal().dayFormat();

    if (above != current) {
      final lastIndex = _getLastIndex(items, index, current);
      return ProviderScope(
        overrides: [
          dateItemsProvider
              .overrideWithValue(items.getRange(index, lastIndex).toList())
        ],
        child: const SummaryTile(),
      );
    }

    return null;
  }

  int _getLastIndex(List<StockItem> items, int startIndex, String day) {
    for (var i = startIndex + 1; i < items.length; i++) {
      final nextDay =
          DateTime.parse(items[i].purchaseDate).toLocal().dayFormat();
      if (day != nextDay) {
        return i;
      }
    }
    return items.length;
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
