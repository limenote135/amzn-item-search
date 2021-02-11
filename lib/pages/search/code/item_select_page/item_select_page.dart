import 'package:amasearch/models/item.dart';
import 'package:amasearch/pages/search/code/camera_page/camera_page.dart';
import 'package:amasearch/pages/search/common/constants.dart';
import 'package:amasearch/pages/search/common/route_from.dart';
import 'package:amasearch/widgets/floating_action_margin.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'item_tile.dart';

class ItemSelectPage extends HookWidget {
  const ItemSelectPage({Key key}) : super(key: key);
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
  Widget build(BuildContext context) {
    final fromRoute = useProvider(fromRouteProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("商品選択"),
      ),
      body: const _Body(),
      floatingActionButton: FloatingActionButton(
        child: AnimatedTheme(
          data: ThemeData.light(),
          child: const Icon(Icons.camera_alt),
        ),
        heroTag: onStartCameraHeroTag,
        onPressed: () {
          if (fromRoute == CameraPage.routeName) {
            Navigator.of(context)
                .popUntil(ModalRoute.withName(CameraPage.routeName));
          } else {
            Navigator.of(context).pushNamedAndRemoveUntil(
                CameraPage.routeName, ModalRoute.withName("/"));
          }
        },
      ),
    );
  }
}

class _Body extends HookWidget {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = useProvider(currentAsinListProvider);
    return ListView(
      children: [
        ...ListTile.divideTiles(
          context: context,
          tiles: [
            for (final item in items)
              ProviderScope(
                overrides: [
                  currentAsinDataProvider.overrideWithValue(item),
                ],
                child: const ItemTile(),
              )
          ],
        ).toList(),
        const ThemeDivider(),
        floatingActionMargin,
      ],
    );
  }
}
