import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/controllers/selected_stock_items_controller.dart';
import 'package:amasearch/util/csv.dart';
import 'package:amasearch/util/review.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'common.dart';
import 'upload_csv.dart';

class UploadAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const UploadAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItems = ref.watch(selectedStockItemsControllerProvider);
    final settings = ref.read(generalSettingsControllerProvider);
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
                          AlertDialogAction(key: f, label: f.displayName)
                      ],
                    );
                    if (type == null) {
                      return;
                    }
                    final analytics = ref.read(analyticsControllerProvider);
                    final isSuccess =
                        await uploadCsv(selectedItems, settings, type);
                    resetState(ref);
                    if (isSuccess) {
                      await ref
                          .read(analyticsControllerProvider)
                          .logUploadListEvent(type);
                      await requestReview(analytics);
                    }
                  }
                : null,
            child: const Text("確定"),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
