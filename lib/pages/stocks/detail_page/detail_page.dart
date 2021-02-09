import 'package:amasearch/controllers/purchase_settings_controller.dart';
import 'package:amasearch/models/enums/item_condition.dart';
import 'package:amasearch/models/enums/item_sub_condition.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/pages/stocks/common/item_delete_handler.dart';
import 'package:amasearch/pages/stocks/edit_page/edit_page.dart';
import 'package:amasearch/styles/font.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:amasearch/widgets/floating_action_margin.dart';
import 'package:amasearch/widgets/item_image.dart';
import 'package:amasearch/widgets/search_buttons.dart';
import 'package:amasearch/widgets/text_line_tile.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

class DetailPage extends HookWidget {
  const DetailPage({Key key}) : super(key: key);
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
  Widget build(BuildContext context) {
    final item = useProvider(currentStockItemProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("仕入れ商品詳細"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              final deleted = await itemDeleteHandler(
                context: context,
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
        child: const Icon(Icons.edit),
        onPressed: () {
          final ctrl =
              initPurchaseSettingsControllerProvider(item.toPurchaseSettings());
          Navigator.push<void>(
            context,
            EditPage.route(item, ctrl),
          );
        },
      ),
    );
  }
}

class _Body extends HookWidget {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentStockItemProvider);

    final profitRate = item.sellPrice > 0
        ? (item.profitPerItem / item.sellPrice * 100).round()
        : 0;
    final roi = item.purchasePrice > 0
        ? (item.profitPerItem / item.purchasePrice * 100).round()
        : 0;

    final referralFeeRate =
        (item.item.prices.feeInfo.referralFeeRate * 100).toInt();
    final referralFee =
        (item.sellPrice * item.item.prices.feeInfo.referralFeeRate).round();
    final categoryFee = item.item.prices.feeInfo.variableClosingFee;
    final fbaFee = item.useFba ? item.item.prices.feeInfo.fbaFee : 0;
    final totalFeePerItem = referralFee + categoryFee + fbaFee;

    return ListView(
      children: [
        ListTile(
          leading: ItemImage(
            url: item.item.imageUrl,
            data: item.item.imageData,
          ),
          title: Text(item.item.title),
        ),
        const _ItemInfoTile(),
        const ThemeDivider(),
        TextListTile(
          leading: const Text("販売価格"),
          main: Text("${numberFormatter.format(item.sellPrice)} 円"),
        ),
        TextListTile(
          leading: const Text("仕入れ価格"),
          main: Text("${numberFormatter.format(item.purchasePrice)} 円"),
        ),
        TextListTile(
          leading: const Text("出品状態"),
          main: Text(_conditionText(item)),
        ),
        TextListTile(
          leading: const Text("出品個数"),
          main: Text("${item.amount} 個"),
        ),
        TextListTile(
          leading: const Text("粗利益"),
          main: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(_getProfitText(item)),
              Text("利益率: ${numberFormatter.format(profitRate)} %"),
              Text("ROI: ${numberFormatter.format(roi)} %"),
            ],
          ),
        ),
        ExpansionTile(
          title: TextLine(
            leading: const Text("手数料"),
            main: Text(_getFeeText(totalFeePerItem, item.amount)),
          ),
          children: [
            const ThemeDivider(),
            TextListTile(
              leading: Text("販売手数料($referralFeeRate%)"),
              main: Text("$referralFee 円"),
            ),
            TextListTile(
              leading: const Text("カテゴリ成約料"),
              main: Text("$categoryFee 円"),
            ),
            TextListTile(
              leading: const Text("FBA手数料"),
              main: Text("$fbaFee 円"),
            ),
          ],
        ),
        TextListTile(
          leading: const Text("SKU"),
          main: Text(item.sku),
        ),
        TextListTile(
          leading: const Text("仕入れ先"),
          main: Text(item.retailer),
        ),
        TextListTile(
          leading: const Text("仕入れ日"),
          main: Text(DateTime.parse(item.purchaseDate).toLocal().dayFormat()),
        ),
        ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("メモ"),
              Text(item.memo),
            ],
          ),
        ),
        const ThemeDivider(),
        ProviderScope(
          overrides: [
            currentItemProvider.overrideWithValue(item.item),
          ],
          child: const SearchButtons(),
        ),
        floatingActionMargin,
      ],
    );
  }

  String _getFeeText(int fee, int amount) {
    final feePerItem = numberFormatter.format(fee);
    final total = numberFormatter.format(fee * amount);
    return "$feePerItem 円 * $amount 個 = $total 円";
  }

  String _getProfitText(StockItem item) {
    final profit = numberFormatter.format(item.profitPerItem);
    final total = numberFormatter.format(item.profitPerItem * item.amount);

    return "$profit 円 * ${item.amount} 個 = $total 円";
  }

  String _conditionText(StockItem item) {
    final condition = item.condition.toDisplayString();
    final subCond = item.subCondition.toDisplayString();
    final condText = item.condition == ItemCondition.newItem
        ? condition
        : "$condition($subCond)";
    final fba = item.useFba ? "FBA 利用" : "自己発送";
    return "$condText $fba";
  }
}

class _ItemInfoTile extends HookWidget {
  const _ItemInfoTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentStockItemProvider);
    final smallSize = smallFontSize(context);
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("JAN コード", style: smallSize),
              InkWell(
                child: ListTile(title: Text(item.item.jan)),
                onLongPress: () {
                  Clipboard.setData(ClipboardData(text: item.item.jan))
                      .then((_) {
                    Scaffold.of(context).removeCurrentSnackBar();
                    Scaffold.of(context).showSnackBar(const SnackBar(
                      content: Text("JAN コードをコピーしました"),
                    ));
                  });
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("ASIN", style: smallSize),
              InkWell(
                child: ListTile(title: Text(item.item.asin)),
                onLongPress: () {
                  Clipboard.setData(ClipboardData(text: item.item.asin))
                      .then((_) {
                    Scaffold.of(context).removeCurrentSnackBar();
                    Scaffold.of(context).showSnackBar(const SnackBar(
                      content: Text("ASIN をコピーしました"),
                    ));
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
