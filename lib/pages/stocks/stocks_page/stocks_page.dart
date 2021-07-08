import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/events.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
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
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share/share.dart';

import 'slidable_delete_tile.dart';

final _selectedItemCount = Provider((ref) {
  final items = ref.watch(selectedStockItemsControllerProvider);
  return items.length;
});

enum _StockPageActions {
  share,
  clear,
}

class StocksPage extends HookConsumerWidget {
  const StocksPage({Key? key}) : super(key: key);
  static const routeName = "/stocks";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: _appBarSelector(context, ref),
      body: const _Body(),
    );
  }

  AppBar _appBarSelector(BuildContext context, WidgetRef ref) {
    final selectedItems = ref.watch(selectedStockItemsControllerProvider);

    return selectedItems.isEmpty
        ? _getNormalAppBar(context, ref)
        : _getItemSelectAppBar(context, ref, selectedItems);
  }

  AppBar _getNormalAppBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("仕入れ済み商品"),
      actions: [
        PopupMenuButton<_StockPageActions>(
          padding: EdgeInsets.zero,
          onSelected: (value) => handleAction(context, ref, value),
          itemBuilder: (context) => const [
            PopupMenuItem(
              value: _StockPageActions.share,
              child: ListTile(
                leading: Icon(Icons.file_upload_outlined),
                title: Text("商品リストを送る"),
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

  AppBar _getItemSelectAppBar(
      BuildContext context, WidgetRef ref, List<StockItem> selected) {
    return AppBar(
      title: Text("${selected.length} 件選択"),
      leading: IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () =>
            ref.read(selectedStockItemsControllerProvider.notifier).removeAll(),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () async {
            final deleted = await itemDeleteHandler(
              context: context,
              ref: ref,
              items: selected,
              content: "${selected.length} 件のアイテムを在庫リストから削除します",
            );
            if (deleted) {
              ref
                  .read(stockItemListControllerProvider.notifier)
                  .remove(selected);
              ref
                  .read(selectedStockItemsControllerProvider.notifier)
                  .removeAll();
            }
          },
        )
      ],
    );
  }

  Future<void> handleAction(
      BuildContext context, WidgetRef ref, _StockPageActions value) async {
    final itemList = ref.read(stockItemListControllerProvider);
    final settings = ref.read(generalSettingsControllerProvider);

    switch (value) {
      case _StockPageActions.share:
        final file =
            await StockItemCsv.create("StockList", itemList, settings.csvOrder);
        await Share.shareFiles([file.absolute.path], subject: "仕入れ済み商品一覧");
        await ref
            .read(analyticsControllerProvider)
            .logSingleEvent(shareEventName);
        break;
      case _StockPageActions.clear:
        await itemDeleteHandler(
          context: context,
          ref: ref,
          deleteAll: true,
          content: "在庫リストからすべてのアイテムを削除します",
        );
        break;
    }
  }
}

class _Body extends HookConsumerWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(stockItemListControllerProvider);
    final selectedItems = ref.watch(selectedStockItemsControllerProvider);

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

  Widget? _getSummary(List<StockItem> items, int index) {
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

class _InkWell extends HookConsumerWidget {
  const _InkWell({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentStockItemProvider);
    return InkWell(
      onTap: () {
        final count = ref.read(_selectedItemCount);
        if (count > 0) {
          ref
              .read(selectedStockItemsControllerProvider.notifier)
              .toggleItem(item);
        } else {
          Navigator.push(
            context,
            DetailPage.route(item),
          );
        }
      },
      onLongPress: () => ref
          .read(selectedStockItemsControllerProvider.notifier)
          .toggleItem(item),
      child: child,
    );
  }
}
