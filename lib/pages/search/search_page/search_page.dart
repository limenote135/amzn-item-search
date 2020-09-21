import 'package:ama_search/widgets/theme_divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const _AppBarTitle(),
        leading: AnimatedTheme(
          data: ThemeData.light(),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            icon: const Icon(Icons.camera_alt),
            tooltip: "バーコード読み取り",
            onPressed: () {
              // TODO: goto camera page
              print("go to camera page");
            },
          ),
        ),
        actions: [
          AnimatedTheme(
            data: ThemeData.light(),
            child: IconButton(
              icon: const Icon(Icons.settings),
              tooltip: "検索設定",
              onPressed: () {
                // TODO: go to search settings page
                print("go to search settings page");
              },
            ),
          )
        ],
      ),
      body: const _Body(),
    );
  }
}

class _AppBarTitle extends HookWidget {
  const _AppBarTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: 仮で値をデフォルトでセットしておく
    final textEditingController =
        useTextEditingController(text: "4987241120888");

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          style: const TextStyle(fontSize: 18),
          controller: textEditingController,
          keyboardType: TextInputType.number,
          // TODO: 設定によって変える
          decoration: const InputDecoration(hintText: "JANコード"),
          onSubmitted: (value) {
            if (value != "") {
              // TODO: 検索処理を開始する
              textEditingController.clear();
            }
          },
        ),
      ),
    );
  }
}

class _Body extends HookWidget {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...ListTile.divideTiles(
          context: context,
          tiles: const [
            ListTile(
              title: Text("hoge"),
            ),
            ListTile(
              title: Text("hoge"),
            )
          ],
        ).toList(),
        const ThemeDivider(),
      ],
    );
  }
}
