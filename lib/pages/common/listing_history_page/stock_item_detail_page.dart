import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/pages/common/stock_item_detail/stock_item_detail.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StockItemDetailPage extends StatelessWidget {
  const StockItemDetailPage({super.key});
  static const String routeName = "/search/detail/history/detail";

  static Route<void> route(StockItem item) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => ProviderScope(
        overrides: [
          currentStockItemProvider.overrideWithValue(item),
        ],
        child: const StockItemDetailPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("仕入れ商品詳細")),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const StockItemDetail();
  }
}
