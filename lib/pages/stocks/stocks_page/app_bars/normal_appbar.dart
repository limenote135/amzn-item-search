import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/events.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/controllers/stock_item_controller.dart';
import 'package:amasearch/pages/stocks/common/item_delete_handler.dart';
import 'package:amasearch/pages/stocks/stocks_page/share/keys.dart';
import 'package:amasearch/pages/stocks/stocks_page/share/share.dart';
import 'package:amasearch/util/csv.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import 'page_mode.dart';

enum _StockPageActions {
  upload,
  share,
  clear,
  listing,
}

class NormalAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const NormalAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("仕入れ済み商品"),
      actions: [
        PopupMenuButton<_StockPageActions>(
          padding: EdgeInsets.zero,
          onSelected: (value) => _handleAction(context, ref, value),
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

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);

  Future<void> _handleAction(
    BuildContext context,
    WidgetRef ref,
    _StockPageActions value,
  ) async {
    final itemList = ref.read(stockItemListControllerProvider);
    final settings = ref.read(generalSettingsControllerProvider);

    final days = ref.watch(daysProvider);
    final maps = ref.watch(captureKeyMapProvider);

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
          final key = result == "total" ? summaryKey : maps[result]!;
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
        ref.read(stockPageModeProvider.notifier).state = StockPageMode.listing;
        break;
    }
  }
}
