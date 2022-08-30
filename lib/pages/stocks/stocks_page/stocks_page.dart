import 'package:amasearch/controllers/selected_stock_items_controller.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/pages/stocks/detail_page/detail_page.dart';
import 'package:amasearch/pages/stocks/stocks_page/app_bars/common.dart';
import 'package:amasearch/pages/stocks/stocks_page/app_bars/item_select_appbar.dart';
import 'package:amasearch/pages/stocks/stocks_page/app_bars/listings_appbar.dart';
import 'package:amasearch/pages/stocks/stocks_page/app_bars/normal_appbar.dart';
import 'package:amasearch/pages/stocks/stocks_page/app_bars/page_mode.dart';
import 'package:amasearch/pages/stocks/stocks_page/app_bars/upload_appbar.dart';
import 'package:amasearch/pages/stocks/stocks_page/item_tile.dart';
import 'package:amasearch/pages/stocks/stocks_page/share/keys.dart';
import 'package:amasearch/pages/stocks/stocks_page/summary_tile.dart';
import 'package:amasearch/pages/stocks/stocks_page/total_profit.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:amasearch/widgets/with_underline.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'provider.dart';
import 'slidable_delete_tile.dart';

final _selectedItemCount = Provider((ref) {
  final items = ref.watch(selectedStockItemsControllerProvider);
  return items.length;
});

class StocksPage extends HookConsumerWidget {
  const StocksPage({Key? key}) : super(key: key);
  static const routeName = "/stocks";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(stockPageModeProvider);
    // 選択モードで選択アイテム数が 0 になったらノーマルモードに戻る
    ref.listen<int>(_selectedItemCount, (previous, next) {
      if (next == 0 && mode == StockPageMode.select) {
        ref.read(stockPageModeProvider.notifier).state = StockPageMode.normal;
        ref.read(selectAllProvider.notifier).state = false;
      }
    });

    return Scaffold(
      appBar: _appBarSelector(mode),
      body: const _Body(),
    );
  }

  PreferredSizeWidget _appBarSelector(StockPageMode mode) {
    switch (mode) {
      case StockPageMode.normal:
        return const NormalAppBar();
      case StockPageMode.select:
        return const ItemSelectAppBar();
      case StockPageMode.listing:
        return const ListingsAppBar();
      case StockPageMode.upload:
        return const UploadAppBar();
    }
  }
}

class _Body extends HookConsumerWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(filteredStockListProvider);
    final mode = ref.watch(stockPageModeProvider);
    final keyMaps = ref.watch(captureKeyMapProvider);
    final selectAll = ref.watch(selectAllProvider);

    final tile = _InkWell(
      child: mode == StockPageMode.normal
          ? const SlidableDeleteTile(child: ItemTile())
          : const ItemTile(),
    );

    return Column(
      children: [
        if (mode == StockPageMode.select ||
            mode == StockPageMode.listing ||
            mode == StockPageMode.upload)
          WithUnderLine(
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text("すべて選択"),
              value: selectAll,
              onChanged: (value) {
                if (value == null) {
                  return;
                }

                if (value) {
                  ref
                      .read(selectedStockItemsControllerProvider.notifier)
                      .setItems(items);
                  ref.read(selectAllProvider.notifier).state = true;
                } else {
                  ref
                      .read(selectedStockItemsControllerProvider.notifier)
                      .removeAll();
                  ref.read(selectAllProvider.notifier).state = false;
                }
              },
            ),
          ),
        if (mode == StockPageMode.normal)
          WithUnderLine(
            RepaintBoundary(
              key: summaryKey,
              child: ColoredBox(
                color: Theme.of(context).backgroundColor,
                child: const TotalProfit(),
              ),
            ),
          ),
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
                final day = DateTime.parse(items[index].purchaseDate)
                    .toLocal()
                    .dayFormat();
                return Column(
                  children: [
                    RepaintBoundary(
                      key: keyMaps[day],
                      child: ProviderScope(
                        overrides: [
                          currentPageModeProvider.overrideWithValue(mode),
                        ],
                        child: summary,
                      ),
                    ),
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
    final mode = ref.watch(stockPageModeProvider);

    return InkWell(
      onTap: () {
        switch (mode) {
          case StockPageMode.normal:
            // ノーマルモードでタップ時は詳細画面へ遷移
            Navigator.push(
              context,
              DetailPage.route(item),
            );
            break;
          case StockPageMode.select:
          case StockPageMode.listing:
          case StockPageMode.upload:
            // 選択モード・出品モードでタップ時は選択アイテムに追加
            ref
                .read(selectedStockItemsControllerProvider.notifier)
                .toggleItem(item);
            break;
        }
      },
      onLongPress: () {
        switch (mode) {
          case StockPageMode.normal:
            // ノーマルモードで長押しした場合は選択モードに切り替え
            ref.read(stockPageModeProvider.notifier).state =
                StockPageMode.select;
            break;
          case StockPageMode.select:
          case StockPageMode.listing:
          case StockPageMode.upload:
            break;
        }
        ref
            .read(selectedStockItemsControllerProvider.notifier)
            .toggleItem(item);
      },
      child: child,
    );
  }
}
