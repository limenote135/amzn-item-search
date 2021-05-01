import 'package:amasearch/controllers/search_item_controller.dart';
import 'package:amasearch/controllers/search_settings_controller.dart';
import 'package:amasearch/models/enums/search_type.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/pages/search/camera_page/camera_page.dart';
import 'package:amasearch/pages/search/common/constants.dart';
import 'package:amasearch/pages/search/search_page/search_bar.dart';
import 'package:amasearch/util/util.dart';
import 'package:amasearch/widgets/floating_action_margin.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:amasearch/widgets/with_underline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import 'item_tile.dart';
import 'search_settings.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);
  static const routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchBar(),
      body: const _Body(),
      floatingActionButton: FloatingActionButton(
        heroTag: onStartCameraHeroTag,
        onPressed: () {
          unfocus();
          Navigator.of(context).pushNamed(CameraPage.routeName);
        },
        child: AnimatedTheme(
          data: ThemeData.light(),
          child: const Icon(Icons.camera_alt),
        ),
      ),
    );
  }
}

class _Body extends HookWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = useProvider(searchItemControllerProvider);

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
                  currentFutureSearchItemProvider
                      .overrideWithValue(items[index]),
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
