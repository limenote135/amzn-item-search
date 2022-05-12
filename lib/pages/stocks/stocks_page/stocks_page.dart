import 'dart:async';
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
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/cloud_functions.dart';
import 'package:amasearch/util/csv.dart';
import 'package:amasearch/util/error_report.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:amasearch/util/listings.dart';
import 'package:amasearch/util/util.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:amasearch/widgets/with_underline.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart';
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
  listing,
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

final _stockPageModeProvider = StateProvider((_) => StockPageMode.normal);

final _selectAllProvider = StateProvider((_) => false);

enum StockPageMode {
  normal,
  select,
  listing,
}

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
    final mode = ref.watch(_stockPageModeProvider);
    // 選択モードで選択アイテム数が 0 になったらノーマルモードに戻る
    ref.listen<int>(_selectedItemCount, (previous, next) {
      if (next == 0 && mode == StockPageMode.select) {
        ref.read(_stockPageModeProvider.notifier).state = StockPageMode.normal;
        ref.read(_selectAllProvider.notifier).state = false;
      }
    });

    return Scaffold(
      appBar: _appBarSelector(context, ref),
      body: const _Body(),
    );
  }

  void _resetState(WidgetRef ref) {
    ref.read(_stockPageModeProvider.notifier).state = StockPageMode.normal;
    ref.read(selectedStockItemsControllerProvider.notifier).removeAll();
    ref.read(_selectAllProvider.notifier).state = false;
  }

  AppBar _appBarSelector(BuildContext context, WidgetRef ref) {
    final selectedItems = ref.watch(selectedStockItemsControllerProvider);
    final mode = ref.watch(_stockPageModeProvider);

    switch (mode) {
      case StockPageMode.normal:
        return _getNormalAppBar(context, ref);
      case StockPageMode.select:
        return _getItemSelectAppBar(context, ref, selectedItems);
      case StockPageMode.listing:
        return _getListingsAppbar(context, ref, selectedItems);
    }
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
                title: Text("商品リストを転送"),
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
              value: _StockPageActions.listing,
              child: ListTile(
                leading: Icon(Icons.upload_file),
                title: Text("Amazonへ出品登録"),
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
    BuildContext context,
    WidgetRef ref,
    List<StockItem> selected,
  ) {
    return AppBar(
      title: Text("${selected.length} 件選択"),
      leading: IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          _resetState(ref);
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.upload_file),
          onPressed: () async {
            await _callListings(context, ref, selected);
          },
        ),
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
        ),
      ],
    );
  }

  AppBar _getListingsAppbar(
    BuildContext context,
    WidgetRef ref,
    List<StockItem> selected,
  ) {
    return AppBar(
      title: Text("${selected.length} 件選択"),
      leading: IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          _resetState(ref);
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
            ),
            onPressed: selected.isNotEmpty
                ? () async {
                    await _callListings(context, ref, selected);
                  }
                : null,
            child: const Text("確定"),
          ),
        ),
      ],
    );
  }

  Future<void> _callListings(
    BuildContext context,
    WidgetRef ref,
    List<StockItem> selected,
  ) async {
    final user = await ref.read(authStateChangesProvider.future);

    final isOk = await showOkCancelAlertDialog(
      context: context,
      title: "Amazonへ出品登録",
      message: "${selected.length}件の商品を出品登録します",
    );

    if (isOk != OkCancelResult.ok) {
      return;
    }

    try {
      await EasyLoading.show(status: "出品処理中...");
      final items = selected.map((e) => e.toListingItem()).toList();
      final file = await createListingsFile(items);
      final filename = basename(file.path);
      final gcsPath =
          "Users/${user!.uid}/Listings/$listingsFileVersion/$filename";
      try {
        await FirebaseStorage.instance.ref(gcsPath).putFile(file);
      } on FirebaseException catch (e, stack) {
        await recordError(e, stack, information: const ["UploadListingFile"]);
        await EasyLoading.dismiss();
        await showOkAlertDialog(
          context: context,
          title: "エラー",
          message: "エラーが発生しました\n"
              "${e.message}(${e.code})",
        );
        return;
      }
      final fn = ref.read(cloudFunctionProvider(functionNameListingItems));
      await fn.call<String>(<String, String>{
        "version": listingsFileVersion,
        "filename": filename,
      });

      ref.read(stockItemListControllerProvider.notifier).setListingDate(
            selected,
            currentTimeString(),
          );

      await EasyLoading.dismiss();
      final ret = await showOkCancelAlertDialog(
        context: context,
        title: "出品登録",
        message: "Amazonへ出品登録を行いました。\n"
            "処理状況はセラーセントラルで確認できます。",
        okLabel: "閉じる",
        cancelLabel: "セラーセントラルを開く",
      );
      _resetState(ref);
      if (ret == OkCancelResult.cancel) {
        // セラーセントラルを開く
        const url = "https://sellercentral.amazon.co.jp/listing/status";
        await FlutterWebBrowser.openWebPage(url: url);
      }

      await ref
          .read(analyticsControllerProvider)
          .logSingleEvent(amazonListingEventName);
      // ignore: avoid_catches_without_on_clauses
    } catch (e, st) {
      await recordError(e, st, information: const ["Amazon listings"]);
      await EasyLoading.dismiss();
      await showOkAlertDialog(
        context: context,
        title: "エラー",
        message: "出品に失敗しました\n"
            "${e.toString()}",
      );
    } finally {
      if (EasyLoading.isShow) {
        await EasyLoading.dismiss();
      }
    }
  }

  Future<void> handleAction(
    BuildContext context,
    WidgetRef ref,
    _StockPageActions value,
  ) async {
    final itemList = ref.read(stockItemListControllerProvider);
    final settings = ref.read(generalSettingsControllerProvider);

    final days = ref.watch(_daysProvider);
    final maps = ref.watch(_captureKeyMapProvider);

    switch (value) {
      case _StockPageActions.upload:
        final timestamp = DateTime.now().timestampFormat();
        final file = await createStockItemCsv(
          "StockList_$timestamp",
          itemList,
          settings.csvOrder,
        );
        await Share.shareFiles(
          [file.absolute.path],
          subject: "仕入れ済み商品一覧_$timestamp",
        );
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
      case _StockPageActions.listing:
        ref.read(_stockPageModeProvider.notifier).state = StockPageMode.listing;
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

  Future<void> shareImageAndText(GlobalKey globalKey) async {
    final bytes = await exportToImage(globalKey);
    final widgetImageBytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    final applicationDocumentsFile = await saveFile("stock", widgetImageBytes);

    final path = applicationDocumentsFile.path;
    await Share.shareFiles([path], subject: "仕入実績", text: "#amzn-item-search");
  }
}

class _Body extends HookConsumerWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(stockItemListControllerProvider);
    final mode = ref.watch(_stockPageModeProvider);

    final keyMaps = ref.watch(_captureKeyMapProvider);

    final selectAll = ref.watch(_selectAllProvider);

    final tile = _InkWell(
      child: mode == StockPageMode.normal
          ? const SlidableDeleteTile(child: ItemTile())
          : const ItemTile(),
    );

    return Column(
      children: [
        if (mode == StockPageMode.select || mode == StockPageMode.listing)
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
                  ref.read(_selectAllProvider.notifier).state = true;
                } else {
                  ref
                      .read(selectedStockItemsControllerProvider.notifier)
                      .removeAll();
                  ref.read(_selectAllProvider.notifier).state = false;
                }
              },
            ),
          ),
        if (mode == StockPageMode.normal)
          WithUnderLine(
            RepaintBoundary(
              key: _summaryKey,
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
                final day =
                    DateTime.parse(items[index].purchaseDate).dayFormat();
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
    final mode = ref.watch(_stockPageModeProvider);

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
            ref.read(_stockPageModeProvider.notifier).state =
                StockPageMode.select;
            break;
          case StockPageMode.select:
          case StockPageMode.listing:
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
