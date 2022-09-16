import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/pages/search/camera_page/camera_page.dart';
import 'package:amasearch/pages/search/common/constants.dart';
import 'package:amasearch/pages/search/common/route_from.dart';
import 'package:amasearch/widgets/floating_action_margin.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'item_tile.dart';

class ItemSelectPage extends ConsumerWidget {
  const ItemSelectPage({super.key});
  static const routeName = "/search/item_select";

  static Route<void> route(List<AsinData> asins, String fromRoute) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => ProviderScope(
        overrides: [
          currentAsinListProvider.overrideWithValue(asins),
          fromRouteProvider.overrideWithValue(fromRoute),
        ],
        child: const ItemSelectPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fromRoute = ref.watch(fromRouteProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("商品選択"),
      ),
      body: const _Body(),
      floatingActionButton: FloatingActionButton(
        heroTag: onStartCameraHeroTag,
        onPressed: () async {
          if (fromRoute == CameraPage.routeName) {
            Navigator.of(context)
                .popUntil(ModalRoute.withName(CameraPage.routeName));
          } else {
            final route = await CameraPage.route(context);
            if (route != null) {
              await Navigator.of(context)
                  .pushAndRemoveUntil(route, ModalRoute.withName("/"));
            }
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

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(currentAsinListProvider);
    return ListView.separated(
      separatorBuilder: (context, index) => const ThemeDivider(),
      itemCount: items.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == items.length) {
          // FloatingActionButton 用のマージン
          return floatingActionMargin;
        }
        final searchItem =
            SearchItem(searchDate: "", jan: "", asins: [items[index]]);
        return ProviderScope(
          overrides: [
            currentAsinDataProvider.overrideWithValue(items[index]),
            currentSearchItemProvider.overrideWithValue(searchItem),
          ],
          child: index == 0 ? const ItemTile() : const ItemTileWithRequest(),
        );
      },
    );
  }
}
