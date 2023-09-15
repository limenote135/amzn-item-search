import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/pages/common/stock_item_detail/stock_item_detail.dart';
import 'package:amasearch/pages/stocks/common/item_delete_handler.dart';
import 'package:amasearch/pages/stocks/edit_page/edit_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetailPage extends HookConsumerWidget {
  const DetailPage({super.key});
  static const routeName = "/stocks/detail";

  static Route<void> route(StockItem item) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => ProviderScope(
        overrides: [
          currentStockItemProvider.overrideWithValue(item),
        ],
        child: const DetailPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentStockItemProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("仕入れ商品詳細"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              final deleted = await itemDeleteHandler(
                context: context,
                ref: ref,
                items: [item],
                content: "在庫リストからアイテムを削除します",
              );
              if (deleted) {
                Navigator.of(context)
                    .popUntil((route) => route.settings.name == "/");
              }
            },
          ),
        ],
      ),
      body: const _Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push<void>(
            context,
            EditPage.route(item),
          );
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StockItemDetail();
  }
}
