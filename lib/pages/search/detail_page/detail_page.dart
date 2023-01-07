import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/controllers/keep_item_controller.dart';
import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/pages/common/seaech_item_detail/item_detail.dart';
import 'package:amasearch/pages/search/camera_page/camera_page.dart';
import 'package:amasearch/pages/search/common/constants.dart';
import 'package:amasearch/pages/search/common/route_from.dart';
import 'package:amasearch/pages/search/purchase_page/purchase_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetailPage extends HookConsumerWidget {
  const DetailPage({super.key});
  static const routeName = "/search/detail";

  static Route<void> route(AsinData item, String fromRoute) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => ProviderScope(
        overrides: [
          currentAsinDataProvider.overrideWithValue(item),
          fromRouteProvider.overrideWithValue(fromRoute),
        ],
        child: const DetailPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentAsinDataProvider);
    final fromRoute = ref.watch(fromRouteProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("商品詳細"),
      ),
      body: const _Body(),
      floatingActionButton: Row(
        children: [
          const Padding(padding: EdgeInsets.only(left: 30)),
          SpeedDial(
            icon: Icons.add_shopping_cart,
            activeIcon: Icons.close,
            switchLabelPosition: true,
            spacing: 3,
            animationCurve: Curves.elasticInOut,
            foregroundColor: Colors.black,
            children: [
              SpeedDialChild(
                child: const Icon(Icons.add_shopping_cart),
                label: "仕入れ",
                onTap: () => Navigator.push(
                  context,
                  PurchasePage.route(item),
                ),
              ),
              SpeedDialChild(
                child: const Icon(Icons.bookmark_add),
                label: "キープ",
                onTap: () async {
                  final result = await showTextInputDialog(
                    context: context,
                    title: "メモ",
                    textFields: [
                      const DialogTextField(
                        maxLines: 3,
                      )
                    ],
                  );
                  if (result == null) {
                    return;
                  }
                  ref
                      .read(keepItemListControllerProvider.notifier)
                      .add(item, result[0]);
                  await ref
                      .read(analyticsControllerProvider)
                      .logKeepEvent(item.asin);
                },
              ),
            ],
          ),
          const Spacer(),
          FloatingActionButton(
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
        ],
      ),
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SearchItemDetail();
  }
}
