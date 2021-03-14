import 'package:amasearch/models/general_settings.dart';
import 'package:amasearch/styles/button.dart';
import 'package:amasearch/util/url_replacer.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentButtonProvider = ScopedProvider<CustomButtonDetail>(null);

const rankVariable = "{rank}";
const titleVariable = "{title}";
const usedProfitVariable = "{usedProfit}";
const newProfitVariable = "{newProfit}";

class UrlSettingsPage extends StatelessWidget {
  const UrlSettingsPage({Key? key}) : super(key: key);
  static const String routeName = "/settings/custom_button/url";

  static Route<CustomButtonDetail> route(CustomButtonDetail button) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => ProviderScope(
        overrides: [
          currentButtonProvider.overrideWithValue(button),
        ],
        child: const UrlSettingsPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("URL 設定"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends HookWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final button = useProvider(currentButtonProvider);
    return _UrlEditForm(button);
  }
}

class _UrlEditForm extends StatefulWidget {
  const _UrlEditForm(this.button);

  final CustomButtonDetail button;
  @override
  __UrlEditFormState createState() => __UrlEditFormState(button);
}

class __UrlEditFormState extends State<_UrlEditForm> {
  __UrlEditFormState(CustomButtonDetail button)
      : _patternEditingController = TextEditingController(text: button.pattern),
        _titleEditingController = TextEditingController(text: button.title);

  final TextEditingController _patternEditingController;
  final TextEditingController _titleEditingController;

  @override
  void initState() {
    super.initState();
    _patternEditingController.addListener(() {
      setState(() {});
    });
    _titleEditingController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _patternEditingController.dispose();
    _titleEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: TextField(
            autofocus: true,
            controller: _titleEditingController,
            decoration: const InputDecoration(labelText: "タイトル"),
          ),
        ),
        ListTile(
          title: TextField(
            controller: _patternEditingController,
            decoration: const InputDecoration(labelText: "URLパターン"),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: raisedButtonStyle(context),
              onPressed: () {
                _addText(janVariable);
              },
              child: const Text("JAN"),
            ),
            ElevatedButton(
              style: raisedButtonStyle(context),
              onPressed: () {
                _addText(asinVariable);
              },
              child: const Text("ASIN"),
            ),
            ElevatedButton(
              style: raisedButtonStyle(context),
              onPressed: () {
                _addText(titleVariable);
              },
              child: const Text("商品名"),
            ),
          ],
        ),
        const ThemeDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: raisedButtonStyle(context),
              onPressed: () {
                Navigator.of(context).pop(CustomButtonDetail(
                  enable: widget.button.enable,
                  title: _titleEditingController.text,
                  pattern: _patternEditingController.text,
                ));
              },
              child: const Text("保存"),
            ),
          ],
        )
      ],
    );
  }

  void _addText(String text) {
    var curPos = _patternEditingController.selection.base.offset;
    if (curPos < 0) {
      // フォームにフォーカスがあたってない場合は末尾に追加する
      curPos = _patternEditingController.text.length;
    }
    final pattern = _patternEditingController.text;

    if (curPos == pattern.length) {
      final newText = "$pattern$text";
      setState(() {
        _patternEditingController
          ..text = newText
          ..selection =
              TextSelection.fromPosition(TextPosition(offset: newText.length));
      });
    } else {
      final before = "${pattern.substring(0, curPos)}$text";
      final after = pattern.substring(curPos, pattern.length);
      setState(() {
        _patternEditingController
          ..text = "$before$after"
          ..selection =
              TextSelection.fromPosition(TextPosition(offset: before.length));
      });
    }
  }
}
