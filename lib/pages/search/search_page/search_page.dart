import 'package:amasearch/controllers/search_item_controller.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/pages/search/camera_page/camera_page.dart';
import 'package:amasearch/pages/search/common/constants.dart';
import 'package:amasearch/pages/search/search_page/search_bar.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/util.dart';
import 'package:amasearch/widgets/async_value_widget.dart';
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
        onPressed: () async {
          unfocus();
          final route = await CameraPage.route(context);
          if (route != null) {
            await Navigator.of(context).push(route);
          }
        },
        child: AnimatedTheme(
          data: ThemeData.light(),
          child: const Icon(Icons.camera_alt),
        ),
      ),
    );
  }
}

class _AppBar extends HookConsumerWidget {
  const _AppBar({Key? key}) : super(key: key);

  static final _appBarKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

class _Body extends HookConsumerWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(searchItemControllerProvider);

    if (items.isEmpty) {
      final isLwaAsyncValue = ref.watch(linkedWithAmazonProvider);
      return SliverList(
        delegate: SliverChildListDelegate([
          AsyncValueListTileWidget(
            value: isLwaAsyncValue,
            errorInfo: const [
              "SearchPage.Body.linkedWithAmazonProvider",
            ],
            data: (isLinked) {
              if (isLinked == true) {
                return Container();
              }
              return const ListTile(
                title: Text("設定メニューからAmazonと連携してください"),
              );
            },
          ),
        ]),
      );
    }

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
