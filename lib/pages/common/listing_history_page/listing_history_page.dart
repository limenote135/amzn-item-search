import 'package:amasearch/models/enums/item_condition.dart';
import 'package:amasearch/models/enums/item_sub_condition.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/pages/common/listing_history_page/stock_item_detail_page.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _currentStockItemsProvider =
    Provider<List<StockItem>>((_) => throw UnimplementedError());

class ListingHistoryPage extends StatelessWidget {
  const ListingHistoryPage({super.key});
  static const String routeName = "/search/detail/history";

  static Route<void> route(List<StockItem> items) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => ProviderScope(
        overrides: [
          _currentStockItemsProvider.overrideWithValue(items),
        ],
        child: const ListingHistoryPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("仕入れ履歴"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(_currentStockItemsProvider);

    return ListView.separated(
      itemCount: items.length + 1,
      separatorBuilder: (context, index) => const ThemeDivider(),
      itemBuilder: (context, index) {
        if (index == 0) {
          return ListTile(
            title: Column(
              children: [
                ...createSummaryText(items),
              ],
            ),
          );
        }
        final item = items[index - 1];
        return ListTile(
          title: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(DateTime.parse(item.purchaseDate).toLocal().dayFormat()),
                  Text(createConditionText(item)),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("仕入 ${numberFormatter.format(item.purchasePrice)} 円"
                      " (${item.amount} 個)"),
                  Text("販売 ${numberFormatter.format(item.sellPrice)} 円"),
                ],
              ),
            ],
          ),
          onTap: () {
            Navigator.push(context, StockItemDetailPage.route(item));
          },
        );
      },
    );
  }

  String createConditionText(StockItem item) {
    if (item.condition == ItemCondition.newItem) {
      return "新品";
    }
    return "中古(${item.subCondition.toDisplayString()})";
  }

  List<Widget> createSummaryText(List<StockItem> items) {
    final newCount = items
        .where((e) => e.condition == ItemCondition.newItem)
        .toList()
        .length;
    final usedCount = items
        .where((e) => e.condition == ItemCondition.usedItem)
        .toList()
        .length;
    final validItems = items.where((e) => e.purchasePrice != 0).toList();
    var text = "";
    if (newCount > 0) {
      text += " 新品 $newCount 回 ";
    }
    if (usedCount > 0) {
      text += " 中古 $usedCount 回 ";
    }
    if (validItems.isEmpty) {
      return <Widget>[
        Text(text),
      ];
    }
    final average = validItems.averageBy((e) => e.purchasePrice).round();
    final max = validItems.maxBy((e) => e.purchasePrice)?.purchasePrice ?? 0;
    final min = validItems.minBy((e) => e.purchasePrice)?.purchasePrice ?? 0;

    return <Widget>[
      Text(text),
      Text("平均 $average 円、最高 $max 円、最安 $min 円"),
    ];
  }
}
