import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/models/keep_item.dart';
import 'package:amasearch/pages/common/seaech_item_detail/item_detail.dart';
import 'package:amasearch/pages/search/purchase_page/purchase_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class KeepDetailPage extends ConsumerWidget {
  const KeepDetailPage({super.key});
  static const String routeName = "/keep/detail";

  static Route<void> route(KeepItem item, String itemKey) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => ProviderScope(
        overrides: [
          currentAsinDataProvider.overrideWithValue(item.item),
          currentKeepItemProvider.overrideWithValue(item),
          currentKeepItemKeyProvider.overrideWithValue(itemKey),
        ],
        child: const KeepDetailPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keepItem = ref.watch(currentKeepItemProvider);
    final keepItemKey = ref.watch(currentKeepItemKeyProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("商品詳細"),
      ),
      body: const _Body(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          PurchasePage.route(
            keepItem.item,
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
    final item = ref.watch(currentKeepItemProvider);
    return SearchItemDetail(
      additionalWidget: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("メモ"),
            Text(item.memo),
          ],
        ),
      ),
    );
  }
}
