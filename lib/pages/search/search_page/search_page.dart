import 'package:amasearch/controllers/item_list_controller.dart';
import 'package:amasearch/controllers/search_settings_controller.dart';
import 'package:amasearch/models/enums/search_type.dart';
import 'package:amasearch/models/item.dart';
import 'package:amasearch/pages/search/camera_page/camera_page.dart';
import 'package:amasearch/pages/search/search_page/item_tile.dart';
import 'package:amasearch/pages/search/search_page/search_settings.dart';
import 'package:amasearch/pages/search/search_settings_page/search_settings_page.dart';
import 'package:amasearch/util/util.dart';
import 'package:amasearch/util/with_underline.dart';
import 'package:amasearch/widgets/floating_action_margin.dart';
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
      floatingActionButton: FloatingActionButton(
        child: AnimatedTheme(
          data: ThemeData.light(),
          child: const Icon(Icons.camera_alt),
        ),
        onPressed: () {
          unfocus();
          Navigator.of(context).pushNamed(CameraPage.routeName);
        },
      ),
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

    final settings = useProvider(searchSettingsControllerProvider.state);

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
          decoration: _createHintText(settings.type),
          onSubmitted: (value) {
            if (value != "") {
              _addItem(context, settings.type, value);
              textEditingController.clear();
            }
          },
        ),
      ),
    );
  }

  InputDecoration _createHintText(SearchType type) {
    switch (type) {
      case SearchType.jan:
        return const InputDecoration(hintText: "JANコード");
      case SearchType.bookoff:
        return const InputDecoration(hintText: "BookOff");
      case SearchType.geo:
        return const InputDecoration(hintText: "Geo");
      case SearchType.tsutaya:
        return const InputDecoration(hintText: "TSUTAYA");
    }
    throw Exception("Unknown SearchType: $type");
  }

  void _addItem(BuildContext context, SearchType type, String code) {
    switch (type) {
      case SearchType.jan:
        context.read(itemListControllerProvider).add(code);
        return;
      case SearchType.bookoff:
        context.read(itemListControllerProvider).addBookoff(code);
        return;
      case SearchType.geo:
        context.read(itemListControllerProvider).addGeo(code);
        return;
      case SearchType.tsutaya:
        context.read(itemListControllerProvider).addTsutaya(code);
        return;
    }
    throw Exception("Unknown type: $type");
  }
}

class _Body extends HookWidget {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = useProvider(itemListControllerProvider.state);

    return Column(
      children: [
        const WithUnderLine(SearchSetting()),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const ThemeDivider(),
            itemCount: items.length + 1,
            itemBuilder: (context, index) {
              if (index == items.length) {
                // FloatingActionButton 用のマージン
                return floatingActionMargin;
              }
              return ProviderScope(
                overrides: [
                  currentItemFutureProvider.overrideWithValue(items[index]),
                ],
                child: const ItemTile(),
              );
            },
          ),
        ),
      ],
    );
  }
}
