import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/controllers/keep_item_controller.dart';
import 'package:amasearch/controllers/keep_state_controller.dart';
import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/models/keep_item.dart';
import 'package:amasearch/pages/keep/detail_page/detail_page.dart';
import 'package:amasearch/pages/search/common/slidable_tile.dart';
import 'package:amasearch/pages/search/purchase_page/purchase_page.dart';
import 'package:amasearch/util/uuid.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'item_tile.dart';

class KeepPage extends StatelessWidget {
  const KeepPage({super.key});
  static const String routeName = "/keep";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("キープ商品"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(keepItemListControllerProvider);
    return ListView.separated(
      separatorBuilder: (context, index) => const ThemeDivider(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ProviderScope(
          overrides: [
            currentAsinDataProvider.overrideWithValue(item.item),
            currentKeepItemProvider.overrideWithValue(item),
          ],
          child: SlidableTile(
            onPurchase: () async {
              final itemKey = ref.read(uuidProvider).v4();
              ref.read(keepStateControllerProvider.notifier).addItem(itemKey);
              await Navigator.push(
                context,
                PurchasePage.route(
                  item.item,
                  memo: item.memo,
                  keepItemKey: itemKey,
                ),
              );

              final isSuccess = ref
                  .read(keepStateControllerProvider.notifier)
                  .getState(itemKey);
              if (isSuccess) {
                final ret = await showOkCancelAlertDialog(
                  context: context,
                  message: "仕入れた商品をキープリストから削除しますか？",
                );
                if (ret == OkCancelResult.ok) {
                  ref
                      .read(keepItemListControllerProvider.notifier)
                      .remove(item.id);
                }
              }
            },
            onDelete: () async {
              final ret = await showOkCancelAlertDialog(
                context: context,
                title: "商品の削除",
                message: "リストからアイテムを削除します",
                isDestructiveAction: true,
              );
              if (ret == OkCancelResult.ok) {
                ref
                    .read(keepItemListControllerProvider.notifier)
                    .remove(item.id);
                return true;
              }
              return false;
            },
            child: InkWell(
              child: const KeepItemTile(),
              onTap: () async {
                final itemKey = ref.read(uuidProvider).v4();
                ref.read(keepStateControllerProvider.notifier).addItem(itemKey);
                await Navigator.push(
                  context,
                  KeepDetailPage.route(item, itemKey),
                );

                final isSuccess = ref
                    .read(keepStateControllerProvider.notifier)
                    .getState(itemKey);
                if (isSuccess) {
                  final ret = await showOkCancelAlertDialog(
                    context: context,
                    message: "仕入れた商品をキープリストから削除しますか？",
                  );
                  if (ret == OkCancelResult.ok) {
                    ref
                        .read(keepItemListControllerProvider.notifier)
                        .remove(item.id);
                  }
                }
              },
            ),
          ),
        );
      },
    );
  }
}
