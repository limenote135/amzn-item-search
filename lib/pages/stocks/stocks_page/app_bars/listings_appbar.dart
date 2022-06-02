import 'package:amasearch/controllers/selected_stock_items_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'common.dart';
import 'listings.dart';

class ListingsAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const ListingsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItems = ref.watch(selectedStockItemsControllerProvider);
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
                    await callListings(context, ref, selectedItems);
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
