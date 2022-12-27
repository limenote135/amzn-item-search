import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/controllers/keep_item_controller.dart';
import 'package:amasearch/controllers/keep_state_controller.dart';
import 'package:amasearch/controllers/selected_keep_items_controller.dart';
import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/models/keep_item.dart';
import 'package:amasearch/pages/keep/detail_page/detail_page.dart';
import 'package:amasearch/pages/search/purchase_page/purchase_page.dart';
import 'package:amasearch/util/uuid.dart';
import 'package:amasearch/widgets/slidable_tile.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'item_select_appbar.dart';
import 'item_tile.dart';
import 'normal_appbar.dart';
import 'providers.dart';

final _selectedItemCount = Provider((ref) {
  final items = ref.watch(selectedKeepItemsControllerProvider);
  return items.length;
});

class KeepPage extends ConsumerWidget {
  const KeepPage({super.key});
  static const String routeName = "/keep";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(keepPageModeProvider);
    // 選択モードで選択アイテム数が 0 になったらノーマルモードに戻る
    ref.listen<int>(_selectedItemCount, (previous, next) {
      if (next == 0 && mode == KeepPageMode.select) {
        ref.read(keepPageModeProvider.notifier).state = KeepPageMode.normal;
        ref.read(selectAllProvider.notifier).state = false;
      }
    });

    return Scaffold(
      appBar: _appBarSelector(mode),
      body: const _Body(),
    );
  }

  PreferredSizeWidget _appBarSelector(KeepPageMode mode) {
    switch (mode) {
      case KeepPageMode.normal:
        return const NormalAppBar();
      case KeepPageMode.select:
        return const ItemSelectAppBar();
    }
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
          child: const _SlidableTile(
            child: _InkWell(
              child: KeepItemTile(),
            ),
          ),
        );
      },
    );
  }
}

class _SlidableTile extends ConsumerWidget {
  const _SlidableTile({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentKeepItemProvider);
    return SlidableTile(
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

        final isSuccess =
            ref.read(keepStateControllerProvider.notifier).getState(itemKey);
        if (isSuccess) {
          final ret = await showOkCancelAlertDialog(
            context: context,
            message: "仕入れた商品をキープリストから削除しますか？",
          );
          if (ret == OkCancelResult.ok) {
            ref.read(keepItemListControllerProvider.notifier).remove([item.id]);
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
          ref.read(keepItemListControllerProvider.notifier).remove([item.id]);
          return true;
        }
        return false;
      },
      child: child,
    );
  }
}

class _InkWell extends ConsumerWidget {
  const _InkWell({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentKeepItemProvider);
    final mode = ref.watch(keepPageModeProvider);
    return InkWell(
      onTap: () async {
        switch (mode) {
          case KeepPageMode.normal:
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
                    .remove([item.id]);
              }
            }
            return;
          case KeepPageMode.select:
            // 選択モードでタップ時は選択アイテムに追加
            ref
                .read(selectedKeepItemsControllerProvider.notifier)
                .toggleItem(item);
            return;
        }
      },
      onLongPress: () {
        switch (mode) {
          case KeepPageMode.normal:
            ref.read(keepPageModeProvider.notifier).state = KeepPageMode.select;
            break;
          case KeepPageMode.select:
            break;
        }
        ref.read(selectedKeepItemsControllerProvider.notifier).toggleItem(item);
      },
      child: child,
    );
  }
}
