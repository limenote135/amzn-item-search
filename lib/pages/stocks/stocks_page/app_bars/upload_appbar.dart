import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/controllers/selected_stock_items_controller.dart';
import 'package:amasearch/controllers/stock_item_controller.dart';
import 'package:amasearch/pages/stocks/stocks_page/app_bars/upload_csv.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/csv.dart';
import 'package:amasearch/util/review.dart';
import 'package:amasearch/util/util.dart';
import 'package:amasearch/widgets/payment.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'common.dart';

class UploadAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const UploadAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItems = ref.watch(selectedStockItemsControllerProvider);
    final settings = ref.read(generalSettingsControllerProvider);
    final isPaidUser = ref.watch(isPaidUserProvider);
    return AppBar(
      title: Text("${selectedItems.length} 件選択"),
      leading: IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          resetState(ref);
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
            ),
            onPressed: selectedItems.isNotEmpty
                ? () async {
                    final type = await showConfirmationDialog(
                      context: context,
                      title: "書式の選択",
                      initialSelectedActionKey: CsvFormat.standard,
                      actions: [
                        for (final f in CsvFormat.values)
                          AlertDialogAction(
                            key: f,
                            label: _withLockEmojiIfRequired(
                              f.displayName,
                              isPaidUser: isPaidUser,
                            ),
                          )
                      ],
                    );
                    if (type == null) {
                      return;
                    }
                    if (type != CsvFormat.standard && !isPaidUser) {
                      await showUnpaidDialog(
                        context,
                        message: "標準形式以外はフリープランではご利用いただけません。",
                      );
                      return;
                    }
                    final analytics = ref.read(analyticsControllerProvider);
                    final isSuccess =
                        await uploadCsv(selectedItems, settings, type);
                    if (isSuccess) {
                      await ref
                          .read(analyticsControllerProvider)
                          .logUploadListEvent(type);
                      if (type != CsvFormat.standard) {
                        // 標準以外の場合は価格改定ツール用フォーマットなので、転送したら出品済みにできるようにする
                        final result = await showOkCancelAlertDialog(
                          context: context,
                          message: "リストに含まれる商品を出品済みにマークしますか？",
                        );
                        if (result == OkCancelResult.ok) {
                          ref
                              .read(stockItemListControllerProvider.notifier)
                              .setListingDate(
                                selectedItems,
                                currentTimeString(),
                              );
                        }
                      }
                      await requestReview(analytics);
                    }
                    resetState(ref);
                  }
                : null,
            child: const Text("確定"),
          ),
        ),
      ],
    );
  }

  String _withLockEmojiIfRequired(String label, {required bool isPaidUser}) {
    if (label == CsvFormat.standard.displayName || isPaidUser) {
      return label;
    }
    return "$label🔒";
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
