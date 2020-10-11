import 'package:amasearch/styles/font.dart';
import 'package:amasearch/util/text_to_speech.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

final currentPatternProvider = ScopedProvider<String>(null);

class PatternSettingsPage extends StatelessWidget {
  const PatternSettingsPage({Key key}) : super(key: key);
  static const String routeName = "/settings/read_aloud/pattern";

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

class _Body extends HookWidget {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pattern = useProvider(currentPatternProvider);
    return _PatternEditForm(pattern);
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

  final _rankVariable = "{rank}";
  final _titleVariable = "{title}";
  final _usedProfitVariable = "{usedProfit}";
  final _newProfitVariable = "{newProfit}";

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
            RaisedButton(
              onPressed: () {
                _addText(_rankVariable);
              },
              child: const Text("商品順位"),
            ),
            RaisedButton(
              onPressed: () {
                _addText(_titleVariable);
              },
              child: const Text("商品名"),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              onPressed: () {
                _addText(_newProfitVariable);
              },
              child: const Text("新品粗利益"),
            ),
            RaisedButton(
              onPressed: () {
                _addText(_usedProfitVariable);
              },
              child: const Text("中古粗利益"),
            ),
          ],
        ),
        const ThemeDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Consumer(
              builder: (context, watch, child) {
                final tts = watch(ttsProvider);
                return RaisedButton(
                  onPressed: () {
                    final text =
                        _createPreviewText(_textEditingController.text);
                    tts.speak(text);
                  },
                  child: const Text("読み上げテスト"),
                );
              },
            ),
            RaisedButton(
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
    return base
        .replaceAll(_rankVariable, "12345")
        .replaceAll(_titleVariable, "商品タイトル")
        .replaceAll(_usedProfitVariable, "1234")
        .replaceAll(_newProfitVariable, "5678");
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
