import 'package:amasearch/controllers/search_item_controller.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/pages/search/camera_page/camera_page.dart';
import 'package:amasearch/pages/search/common/constants.dart';
import 'package:amasearch/pages/search/search_page/search_bar.dart';
import 'package:amasearch/util/util.dart';
import 'package:amasearch/widgets/floating_action_margin.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'item_tile.dart';
import 'search_settings.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);
  static const routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: CustomScrollView(
          slivers: [
            _AppBar(),
            _Body(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: onStartCameraHeroTag,
        onPressed: () {
          unfocus();
          Navigator.of(context).push(CameraPage.route());
        },
        child: AnimatedTheme(
          data: ThemeData.light(),
          child: const Icon(Icons.camera_alt),
        ),
      ),
    );
  }
}

GlobalKey _appBarKey = GlobalKey();

class _AppBar extends HookWidget {
  const _AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = useState<double>(0);
    WidgetsBinding.instance?.addPostFrameCallback((cb) {
      // build が完了した後に AppBar の高さを計算して設定、再描画する
      final obj = _appBarKey.currentContext?.findRenderObject();
      if (obj != null) {
        // ValueNotifier 内で値が同じなら set がスキップされるので、事前にチェックはしないでよい
        height.value = obj.paintBounds.height;
      }
    });
    return SliverAppBar(
      title: Column(
        key: _appBarKey,
        children: const [
          SearchBar(),
          SearchSetting(),
        ],
      ),
      centerTitle: true,
      toolbarHeight: height.value,
      floating: true,
    );
  }
}

class _Body extends HookWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = useProvider(searchItemControllerProvider);
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          if (index == items.length * 2 + 1) {
            // FloatingActionButton 用のマージン
            return floatingActionMargin;
          }
          if (index.isEven || index == items.length * 2) {
            return const ThemeDivider();
          }
          return ProviderScope(
            overrides: [
              currentFutureSearchItemProvider
                  .overrideWithValue(items[index ~/ 2]),
            ],
            child: const ItemTile(),
          );
        },
        childCount: items.length * 2 + 2,
      ),
    );
  }
}
