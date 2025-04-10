import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/events.dart';
import 'package:amasearch/pages/stocks/search_page/search_page.dart';
import 'package:amasearch/pages/stocks/stocks_page/provider.dart';
import 'package:amasearch/pages/stocks/stocks_page/share/keys.dart';
import 'package:amasearch/pages/stocks/stocks_page/share/share.dart';
import 'package:amasearch/util/util.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'page_mode.dart';

enum _StockPageActions {
  upload,
  share,
  clear,
  listing,
}

class NormalAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const NormalAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterCount = ref.watch(filterCountProvider);
    return AppBar(
      title: const Text("仕入れ済み商品"),
      actions: [
        IconButton(
          icon: Badge.count(
            count: filterCount,
            isLabelVisible: filterCount > 0,
            backgroundColor: Colors.orange,
            textColor: !isDark(context) ? Colors.black : Colors.white,
            child: const Icon(Icons.search),
          ),
          onPressed: () {
            Navigator.of(context).push(SearchPage.route());
          },
        ),
        PopupMenuButton<_StockPageActions>(
          padding: EdgeInsets.zero,
          onSelected: (value) => _handleAction(context, ref, value),
          itemBuilder: (context) => const [
            PopupMenuItem(
              value: _StockPageActions.upload,
              child: ListTile(
                leading: Icon(Icons.file_upload_outlined),
                title: Text("商品リストをCSVで転送"),
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
                title: Text("商品を削除"),
              ),
            ),
          ],
        ),
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
    final days = ref.watch(daysProvider);
    final maps = ref.watch(captureKeyMapProvider);

    switch (value) {
      case _StockPageActions.upload:
        ref.read(stockPageModeProvider.notifier).state = StockPageMode.upload;
      case _StockPageActions.share:
        final result = await showConfirmationDialog(
          context: context,
          title: "シェアする日を決めてください",
          message: "どの日の実績をシェアしますか？",
          actions: [
            const AlertDialogAction(key: "total", label: "トータル実績"),
            ...days.map((e) => AlertDialogAction(key: e, label: e)),
          ],
        );
        if (result != null) {
          final key = result == "total" ? summaryKey : maps[result]!;
          await shareImageAndText(key);
          await ref
              .read(analyticsControllerProvider)
              .logSingleEvent(shareSnsEventName);
        }
      case _StockPageActions.clear:
        ref.read(stockPageModeProvider.notifier).state = StockPageMode.delete;
      case _StockPageActions.listing:
        ref.read(stockPageModeProvider.notifier).state = StockPageMode.listing;
    }
  }
}
