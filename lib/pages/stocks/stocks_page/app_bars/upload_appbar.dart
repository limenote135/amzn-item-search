import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/controllers/selected_stock_items_controller.dart';
import 'package:amasearch/util/review.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'common.dart';
import 'upload_csv.dart';

class UploadAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const UploadAppBar({Key? key}) : super(key: key);

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
                    final analytics = ref.read(analyticsControllerProvider);
                    final isSuccess =
                        await uploadCsv(ref, selectedItems, settings.csvOrder);
                    if (isSuccess) {
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
