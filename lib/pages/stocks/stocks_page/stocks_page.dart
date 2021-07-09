import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:adaptive_dialog/adaptive_dialog.dart';
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
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';

import 'slidable_delete_tile.dart';

final _selectedItemCount = Provider((ref) {
  final items = ref.watch(selectedStockItemsControllerProvider);
  return items.length;
});

enum _StockPageActions {
  upload,
  share,
  clear,
}

// 仕入れ日のリスト
final _daysProvider = Provider((ref) {
  final items = ref.watch(stockItemListControllerProvider);
  return [
    ...{
      ...items.map((e) => DateTime.parse(e.purchaseDate).toLocal().dayFormat())
    }
  ];
});

// 実績シェア用に仕入れ日ごとに GlobalKey を作成
final _captureKeyMapProvider = Provider((ref) {
  final days = ref.watch(_daysProvider);
  final map = <String, GlobalKey>{};
  for (final day in days) {
    map[day] = GlobalKey();
  }
  return map;
});

// トータル仕入れ向けに GlobalKey を作成
final _summaryKey = GlobalKey();

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
              value: _StockPageActions.upload,
              child: ListTile(
                leading: Icon(Icons.file_upload_outlined),
                title: Text("商品リストを送る"),
              ),
            ),
            PopupMenuItem(
              value: _StockPageActions.share,
              child: ListTile(
                leading: Icon(Icons.share),
                title: Text("仕入実績をシェア"),
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

    final days = ref.watch(_daysProvider);
    final maps = ref.watch(_captureKeyMapProvider);

    switch (value) {
      case _StockPageActions.upload:
        final file =
            await StockItemCsv.create("StockList", itemList, settings.csvOrder);
        await Share.shareFiles([file.absolute.path], subject: "仕入れ済み商品一覧");
        await ref
            .read(analyticsControllerProvider)
            .logSingleEvent(uploadListEventName);
        break;
      case _StockPageActions.share:
        final result = await showConfirmationDialog(
          context: context,
          title: "シェアする日を決めてください",
          message: "どの日の実績をシェアしますか？",
          actions: [
            const AlertDialogAction(key: "total", label: "トータル実績"),
            ...days.map((e) => AlertDialogAction(key: e, label: e))
          ],
        );
        if (result != null) {
          final key = result == "total" ? _summaryKey : maps[result]!;
          await shareImageAndText(key);
          await ref
              .read(analyticsControllerProvider)
              .logSingleEvent(shareSnsEventName);
        }
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

  Future<ByteData> exportToImage(GlobalKey globalKey) async {
    final boundary =
        globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;

    final image = await boundary!.toImage(
      pixelRatio: 3,
    );
    final byteData = await image.toByteData(
      format: ui.ImageByteFormat.png,
    );
    return byteData!;
  }

  Future<File> saveFile(String filename, List<int> imageData) async {
    final directory = await getTemporaryDirectory();

    final exportFile = File('${directory.path}/$filename.png');
    if (!exportFile.existsSync()) {
      await exportFile.create(recursive: true);
    }
    final file = await exportFile.writeAsBytes(imageData);
    return file;
  }

  Future shareImageAndText(GlobalKey globalKey) async {
    final bytes = await exportToImage(globalKey);
    final widgetImageBytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    final applicationDocumentsFile = await saveFile("stock", widgetImageBytes);

    final path = applicationDocumentsFile.path;
    await Share.shareFiles([path], subject: "仕入実績");
    await applicationDocumentsFile.delete();
  }
}

class _Body extends HookConsumerWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(stockItemListControllerProvider);
    final selectedItems = ref.watch(selectedStockItemsControllerProvider);

    final keyMaps = ref.watch(_captureKeyMapProvider);

    final tile = _InkWell(
      child: selectedItems.isNotEmpty
          ? const ItemTile()
          : const SlidableDeleteTile(child: ItemTile()),
    );

    return Column(
      children: [
        WithUnderLine(RepaintBoundary(
          key: _summaryKey,
          child: Container(
            color: Theme.of(context).backgroundColor,
            child: const TotalProfit(),
          ),
        )),
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
                final day =
                    DateTime.parse(items[index].purchaseDate).dayFormat();
                return Column(
                  children: [
                    RepaintBoundary(
                      key: keyMaps[day],
                      child: summary,
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
