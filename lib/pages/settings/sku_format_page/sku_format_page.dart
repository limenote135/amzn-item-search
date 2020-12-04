import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/properties.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/enums/purchase_item_condition.dart';
import 'package:amasearch/models/fee_info.dart';
import 'package:amasearch/models/item.dart';
import 'package:amasearch/models/item_price.dart';
import 'package:amasearch/models/purchase_settings.dart';
import 'package:amasearch/styles/font.dart';
import 'package:amasearch/util/sku_replacer.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

const _newSampleItem = AsinData(
  jan: "450000000000000",
  asin: "ASIN",
  listPrice: 0,
  imageUrl: "",
  title: "商品名",
  rank: 0,
  quantity: "1",
  prices: ItemPrices(
    feeInfo: FeeInfo(
      fbaFee: 30,
      variableClosingFee: 0,
      referralFeeRate: 15,
    ),
  ),
);

var _samplePurchaseSettings = PurchaseSettings(
  formKey: GlobalKey<FormState>(),
  purchasePrice: 100,
  sellPrice: 250,
  condition: PurchaseItemCondition.newItem,
  profit: 50,
  amount: 2,
  useFba: true,
);

class SkuFormatPage extends StatelessWidget {
  const SkuFormatPage({Key key}) : super(key: key);
  static const String routeName = "/settings/sku";

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

class _Body extends HookWidget {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final skuPattern = useProvider(generalSettingsControllerProvider.state
        .select((value) => value.skuFormat));
    return _PatternEditForm(skuPattern);
  }
}

class _PatternEditForm extends StatefulWidget {
  const _PatternEditForm(this.pattern);
  final String pattern;

  @override
  __PatternEditFormState createState() => __PatternEditFormState(pattern);
}

class __PatternEditFormState extends State<_PatternEditForm> {
  __PatternEditFormState(String pattern)
      : _textEditingController = TextEditingController(text: pattern);

  final TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
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
              Text(replaceSku(
                format: _textEditingController.text,
                item: _newSampleItem,
                settings: _samplePurchaseSettings,
                purchase: 200,
              )),
            ],
          ),
        ),
        const ThemeDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              child: const Text("年"),
              onPressed: () => _addText(yearVar),
            ),
            RaisedButton(
              child: const Text("月"),
              onPressed: () => _addText(monthVar),
            ),
            RaisedButton(
              child: const Text("日"),
              onPressed: () => _addText(dayVar),
            ),
          ],
        ),
        Wrap(
          alignment: WrapAlignment.spaceEvenly,
          spacing: 8,
          direction: Axis.horizontal,
          children: [
            RaisedButton(
              child: const Text("ASIN"),
              onPressed: () => _addText(asinVar),
            ),
            RaisedButton(
              child: const Text("JAN"),
              onPressed: () => _addText(janVar),
            ),
            RaisedButton(
              child: const Text("状態"),
              onPressed: () => _addText(condVar),
            ),
            RaisedButton(
              child: const Text("購入数"),
              onPressed: () => _addText(quantityVar),
            ),
            RaisedButton(
              child: const Text("仕入れ値"),
              onPressed: () => _addText(purchaseVar),
            ),
            RaisedButton(
              child: const Text("販売価格"),
              onPressed: () => _addText(sellVar),
            ),
            RaisedButton(
              child: const Text("粗利益"),
              onPressed: () => _addText(profitVar),
            ),
            RaisedButton(
              child: const Text("損益分岐"),
              onPressed: () => _addText(breakEvenVar),
            ),
          ],
        ),
        const ThemeDivider(),
        RaisedButton(
          child: const Text("保存"),
          onPressed: () {
            context
                .read(generalSettingsControllerProvider)
                .update(skuFormat: _textEditingController.text);
            context
                .read(analyticsControllerProvider)
                .setUserProp(skuFormatPropName, _textEditingController.text);
            Navigator.pop(context);
          },
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
