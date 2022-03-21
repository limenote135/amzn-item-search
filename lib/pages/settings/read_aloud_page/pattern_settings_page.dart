import 'package:amasearch/models/enums/item_condition.dart';
import 'package:amasearch/models/enums/item_sub_condition.dart';
import 'package:amasearch/models/enums/used_sub_condition.dart';
import 'package:amasearch/models/fee_info.dart';
import 'package:amasearch/models/item_price.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/styles/font.dart';
import 'package:amasearch/util/read_aloud_util.dart';
import 'package:amasearch/util/text_to_speech.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentPatternProvider =
    Provider<String>((_) => throw UnimplementedError());

class PatternSettingsPage extends StatelessWidget {
  const PatternSettingsPage({Key? key}) : super(key: key);
  static const String routeName = "/settings/read_aloud/pattern";

  static Route<String> route(String pattern) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => ProviderScope(
        overrides: [
          currentPatternProvider.overrideWithValue(pattern),
        ],
        child: const PatternSettingsPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("読み上げパターン設定"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pattern = ref.watch(currentPatternProvider);
    return _PatternEditForm(pattern);
  }
}

class _PatternEditForm extends ConsumerStatefulWidget {
  const _PatternEditForm(this.pattern);

  final String pattern;
  @override
  __PatternEditFormState createState() => __PatternEditFormState();
}

const _sampleItem = AsinData(
  jan: "",
  asin: "",
  listPrice: 0,
  imageUrl: "",
  quantity: "",
  category: "",
  title: "商品タイトル",
  rank: 12345,
  prices: ItemPrices(
    feeInfo: FeeInfo(
      fbaFee: 0,
      referralFeeRate: 0,
      variableClosingFee: 0,
    ),
    newPrices: <PriceDetail>[
      PriceDetail(
        itemCondition: ItemCondition.newItem,
        price: 5678,
      ),
    ],
    usedPrices: <PriceDetail>[
      PriceDetail(
        itemCondition: ItemCondition.usedItem,
        subCondition: ItemSubCondition.veryGood,
        price: 1234,
      ),
    ],
  ),
);

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
            decoration: const InputDecoration(labelText: "読み上げパターン"),
          ),
        ),
        ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("プレビュー", style: smallSize),
              Text(_createPreviewText(_textEditingController.text)),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                _addText(rankVariable);
              },
              child: const Text("商品順位"),
            ),
            ElevatedButton(
              onPressed: () {
                _addText(titleVariable);
              },
              child: const Text("商品名"),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                _addText(newProfitVariable);
              },
              child: const Text("新品粗利益"),
            ),
            ElevatedButton(
              onPressed: () {
                _addText(usedProfitVariable);
              },
              child: const Text("中古粗利益"),
            ),
          ],
        ),
        const ThemeDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                final tts = ref.read(ttsProvider);
                final text = _createPreviewText(_textEditingController.text);
                tts.speak(text);
              },
              child: const Text("読み上げテスト"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(_textEditingController.text);
              },
              child: const Text("保存"),
            ),
          ],
        )
      ],
    );
  }

  String _createPreviewText(String base) {
    return createSpeakText(
      template: base,
      item: _sampleItem,
      priorFba: false,
      useFba: true,
      usedSubCondition: UsedSubCondition.all,
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
