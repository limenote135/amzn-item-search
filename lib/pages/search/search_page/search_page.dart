import 'package:amasearch/controllers/item_list_controller.dart';
import 'package:amasearch/models/item.dart';
import 'package:amasearch/pages/search/camera_page/camera_page.dart';
import 'package:amasearch/pages/search/search_page/item_tile.dart';
import 'package:amasearch/pages/search/search_settings_page/search_settings_page.dart';
import 'package:amasearch/util/util.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
              unfocus();
              Navigator.of(context).pushNamed(CameraPage.routeName);
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
                Navigator.of(context).pushNamed(SearchSettingsPage.routeName);
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
        useTextEditingController(text: "4987241127030"); // 4987241120888

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
              // TODO: JAN 以外の対応
              context.read(itemListControllerProvider).add(value);
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
    final items = useProvider(itemListControllerProvider.state);

    return ListView(
      children: [
        ...ListTile.divideTiles(
          context: context,
          tiles: [
            for (final item in items)
              ProviderScope(
                overrides: [
                  currentItemFutureProvider.overrideWithValue(item),
                ],
                child: const ItemTile(),
              )
          ],
        ).toList(),
        const ThemeDivider(),
      ],
    );
  }
}
