import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/properties.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/enums/purchase_item_condition.dart';
import 'package:amasearch/models/fee_info.dart';
import 'package:amasearch/models/item_price.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/styles/font.dart';
import 'package:amasearch/util/sku_replacer.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const _newSampleItem = AsinData(
  jan: "450000000000000",
  asin: "ASIN",
  listPrice: 0,
  imageUrl: "",
  title: "商品名",
  rank: 0,
  quantity: "1",
  prices: ItemPrices(
    newPrices: [],
    usedPrices: [],
    feeInfo: FeeInfo(
      fbaFee: 30,
      variableClosingFee: 0,
      referralFeeRate: 15,
    ),
  ),
  category: "カテゴリー",
);

class SkuFormatPage extends StatelessWidget {
  const SkuFormatPage({Key? key}) : super(key: key);
  static const String routeName = "/settings/sku";

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const SkuFormatPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SKU フォーマット設定"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skuPattern = ref.watch(
      generalSettingsControllerProvider.select((value) => value.skuFormat),
    );
    return _PatternEditForm(skuPattern);
  }
}

class _PatternEditForm extends ConsumerStatefulWidget {
  const _PatternEditForm(this.pattern);
  final String pattern;

  @override
  __PatternEditFormState createState() => __PatternEditFormState();
}

class __PatternEditFormState extends ConsumerState<_PatternEditForm> {
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.pattern);
    _textEditingController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final smallSize = smallFontSize(context);
    return Column(
      children: [
        ListTile(
          title: TextField(
            autofocus: true,
            controller: _textEditingController,
            decoration: const InputDecoration(labelText: "SKU パターン"),
          ),
        ),
        ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("プレビュー", style: smallSize),
              Text(
                replaceSku(
                  format: _textEditingController.text,
                  item: _newSampleItem,
                  purchase: 200,
                  sell: 300,
                  cond: PurchaseItemCondition.newItem,
                  profit: 5,
                  quantity: 2,
                  useFba: true,
                  date: DateTime.now(),
                  breakEven: 271,
                ),
              ),
            ],
          ),
        ),
        const ThemeDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => _addText(yearVar),
              child: const Text("年"),
            ),
            ElevatedButton(
              onPressed: () => _addText(monthVar),
              child: const Text("月"),
            ),
            ElevatedButton(
              onPressed: () => _addText(dayVar),
              child: const Text("日"),
            ),
          ],
        ),
        Wrap(
          alignment: WrapAlignment.spaceEvenly,
          spacing: 8,
          children: [
            ElevatedButton(
              onPressed: () => _addText(asinVar),
              child: const Text("ASIN"),
            ),
            ElevatedButton(
              onPressed: () => _addText(janVar),
              child: const Text("JAN"),
            ),
            ElevatedButton(
              onPressed: () => _addText(condVar),
              child: const Text("状態"),
            ),
            ElevatedButton(
              onPressed: () => _addText(quantityVar),
              child: const Text("購入数"),
            ),
            ElevatedButton(
              onPressed: () => _addText(purchaseVar),
              child: const Text("仕入れ値"),
            ),
            ElevatedButton(
              onPressed: () => _addText(sellVar),
              child: const Text("販売価格"),
            ),
            ElevatedButton(
              onPressed: () => _addText(profitVar),
              child: const Text("粗利益"),
            ),
            ElevatedButton(
              onPressed: () => _addText(breakEvenVar),
              child: const Text("損益分岐"),
            ),
          ],
        ),
        const ThemeDivider(),
        ElevatedButton(
          onPressed: () {
            ref
                .read(generalSettingsControllerProvider.notifier)
                .update(skuFormat: _textEditingController.text);
            ref
                .read(analyticsControllerProvider)
                .setUserProp(skuFormatPropName, _textEditingController.text);
            Navigator.pop(context);
          },
          child: const Text("保存"),
        ),
      ],
    );
  }

  void _addText(String text) {
    var curPos = _textEditingController.selection.base.offset;
    if (curPos < 0) {
      // フォームにフォーカスがあたってない場合は末尾に追加する
      curPos = _textEditingController.text.length;
    }
    final pattern = _textEditingController.text;

    if (curPos == pattern.length) {
      final newText = "$pattern$text";
      setState(() {
        _textEditingController
          ..text = newText
          ..selection =
              TextSelection.fromPosition(TextPosition(offset: newText.length));
      });
    } else {
      final before = "${pattern.substring(0, curPos)}$text";
      final after = pattern.substring(curPos, pattern.length);
      setState(() {
        _textEditingController
          ..text = "$before$after"
          ..selection =
              TextSelection.fromPosition(TextPosition(offset: before.length));
      });
    }
  }
}
