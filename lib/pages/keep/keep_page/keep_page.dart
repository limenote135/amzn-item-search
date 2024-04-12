import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/controllers/keep_item_controller.dart';
import 'package:amasearch/controllers/keep_state_controller.dart';
import 'package:amasearch/controllers/selected_keep_items_controller.dart';
import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/models/keep_item.dart';
import 'package:amasearch/pages/keep/detail_page/detail_page.dart';
import 'package:amasearch/pages/keep/keep_page/refresh_appbar.dart';
import 'package:amasearch/pages/keep/search_page/provider.dart';
import 'package:amasearch/pages/search/purchase_page/purchase_page.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/uuid.dart';
import 'package:amasearch/widgets/payment.dart';
import 'package:amasearch/widgets/slidable_tile.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:amasearch/widgets/with_underline.dart';
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

    final isPaidUser = ref.watch(isPaidUserProvider);

    if (!isPaidUser) {
      return const Scaffold(
        appBar: NormalAppBar(),
        body: _UnpaidUserBody(),
      );
    }

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
      case KeepPageMode.refresh:
        return const RefreshAppbar();
    }
  }
}

class _UnpaidUserBody extends ConsumerWidget {
  const _UnpaidUserBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LockIcon(width: 32),
          Text(
            "標準プランでは商品を\nキープリストに登録することができます",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

final selectAllProvider = StateProvider((_) => false);

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(filteredKeepListProvider);
    final mode = ref.watch(keepPageModeProvider);
    final selectAll = ref.watch(selectAllProvider);

    return Column(
      children: [
        if (mode == KeepPageMode.refresh)
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
                      .read(selectedKeepItemsControllerProvider.notifier)
                      .setItems(items);
                  ref.read(selectAllProvider.notifier).state = true;
                } else {
                  ref
                      .read(selectedKeepItemsControllerProvider.notifier)
                      .removeAll();
                  ref.read(selectAllProvider.notifier).state = false;
                }
              },
            ),
          ),
        Expanded(
          child: ListView.separated(
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
          ),
        ),
      ],
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

        // 仕入れリストに移動させた場合、true がセットされているはず
        final isSuccess =
            ref.read(keepStateControllerProvider.notifier).isCompleted(itemKey);
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
                .isCompleted(itemKey);
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
          case KeepPageMode.refresh:
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
          case KeepPageMode.select:
          case KeepPageMode.refresh:
        }
        ref.read(selectedKeepItemsControllerProvider.notifier).toggleItem(item);
      },
      child: child,
    );
  }
}
