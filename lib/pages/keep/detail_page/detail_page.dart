import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/controllers/keep_item_controller.dart';
import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/models/keep_item.dart';
import 'package:amasearch/pages/common/seaech_item_detail/item_detail.dart';
import 'package:amasearch/pages/search/purchase_page/purchase_page.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _currentKeepItemIdProvider =
    Provider<String>((_) => throw UnimplementedError());

final _currentKeepItemByIdProvider =
    Provider.family<KeepItem?, String>((ref, id) {
  final items = ref.watch(keepItemListControllerProvider);
  return items.firstWhereOrNull((element) => element.id == id);
});

class KeepDetailPage extends ConsumerWidget {
  const KeepDetailPage({super.key});
  static const String routeName = "/keep/detail";

  static Route<void> route(KeepItem item, String itemKey) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => ProviderScope(
        overrides: [
          currentAsinDataProvider.overrideWithValue(item.item),
          currentKeepItemKeyProvider.overrideWithValue(itemKey),
          // ページ内でダイアログでメモを更新して、更新後のメモを表示に反映させるため、
          // ID を受け取って ID から KeepListController 内のアイテムを直接引くようにする
          _currentKeepItemIdProvider.overrideWithValue(item.id),
        ],
        child: const KeepDetailPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keepItemId = ref.watch(_currentKeepItemIdProvider);
    final keepItem = ref.watch(_currentKeepItemByIdProvider(keepItemId));
    final keepItemKey = ref.watch(currentKeepItemKeyProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("商品詳細"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              final ret = await showOkCancelAlertDialog(
                context: context,
                title: "商品の削除",
                message: "キープリストから商品を削除します",
                isDestructiveAction: true,
              );
              if (ret == OkCancelResult.ok && keepItem != null) {
                ref
                    .read(keepItemListControllerProvider.notifier)
                    .remove([keepItem.id]);
                Navigator.of(context)
                    .popUntil((route) => route.settings.name == "/");
              }
            },
          ),
        ],
      ),
      body: const _Body(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          PurchasePage.route(
            keepItem!.item,
            memo: keepItem.memo,
            keepItemKey: keepItemKey,
          ),
        ),
        child: AnimatedTheme(
          data: ThemeData.light(),
          child: const Icon(Icons.add_shopping_cart),
        ),
      ),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keepItemId = ref.watch(_currentKeepItemIdProvider);
    final item = ref.watch(_currentKeepItemByIdProvider(keepItemId));
    if (item == null) {
      // キープアイテムの削除を選択した場合、item が一瞬 null になるため、
      // その時に例外が飛ばないようにするための対応
      return Container();
    }
    return SearchItemDetail(
      additionalWidget: ListTile(
        title: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("メモ"),
                  Text(item.memo),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () async {
                final result = await showTextInputDialog(
                  context: context,
                  title: "メモの更新",
                  textFields: [
                    DialogTextField(
                      maxLines: 3,
                      initialText: item.memo,
                    )
                  ],
                );
                if (result == null) {
                  return;
                }
                ref
                    .read(keepItemListControllerProvider.notifier)
                    .updateMemo(item, result[0]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
