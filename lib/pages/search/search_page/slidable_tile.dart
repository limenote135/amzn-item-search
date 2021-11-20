import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/events.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/controllers/search_item_controller.dart';
import 'package:amasearch/models/enums/shortcut_type.dart';
import 'package:amasearch/models/general_settings.dart';
import 'package:amasearch/models/offer_listings.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/pages/common/keepa_page/keepa_page.dart';
import 'package:amasearch/pages/common/offer_listing_page/offer_listing_page.dart';
import 'package:amasearch/pages/search/camera_page/camera_page.dart';
import 'package:amasearch/pages/search/common/route_from.dart';
import 'package:amasearch/pages/search/purchase_page/purchase_page.dart';
import 'package:amasearch/util/url_replacer.dart';
import 'package:amasearch/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SlidableTile extends HookConsumerWidget {
  const SlidableTile({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final from = ref.watch(fromRouteProvider);
    final left = ref.watch(generalSettingsControllerProvider
        .select((value) => value.leftSlideShortcut));
    final right = ref.watch(generalSettingsControllerProvider
        .select((value) => value.rightSlideShortcut));
    final baseButtons = ref.watch(generalSettingsControllerProvider
        .select((value) => value.customButtons));

    final items = ref.watch(currentSearchItemProvider);

    final buttons = [...baseButtons, amazonListingsButton];

    final leftActive = left.fold<int>(
        0, (prev, e) => e.type != ShortcutType.none ? prev + 1 : prev);
    final rightActive = right.fold<int>(
        0, (prev, e) => e.type != ShortcutType.none ? prev + 1 : prev);
    return Slidable(
      startActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: leftActive > 0 ? 0.2 * leftActive : 0.2,
        children: [
          for (final act in left)
            if (needShow(from, act.type))
              _getAction(context, ref, act.type, act.param, buttons, items)
        ],
      ),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: rightActive > 0 ? 0.2 * rightActive : 0.2,
        children: [
          for (final act in right)
            if (needShow(from, act.type))
              _getAction(context, ref, act.type, act.param, buttons, items)
        ],
      ),
      child: child,
    );
  }

  bool needShow(String from, ShortcutType type) {
    if (from == CameraPage.routeName && type == ShortcutType.delete) {
      // カメラページの場合は delete 不可
      return false;
    }
    if (type == ShortcutType.none) {
      // none の場合は非表示
      return false;
    }
    return true;
  }

  Widget _getAction(BuildContext context, WidgetRef ref, ShortcutType type,
      String param, List<CustomButtonDetail> buttons, SearchItem item) {
    switch (type) {
      case ShortcutType.purchase:
        return _purchaseAction(ref, item);
      case ShortcutType.delete:
        return _deleteAction(context, ref, item);
      case ShortcutType.web:
        final button = buttons.firstWhere((element) => element.id == param);
        return _webAction(ref, button, item);
      case ShortcutType.navigation:
        return _navigationAction(ref, param, item);
      case ShortcutType.none:
        throw Exception("Invalid type");
    }
  }

  SlidableAction _purchaseAction(WidgetRef ref, SearchItem item) {
    return SlidableAction(
      label: "仕入れ",
      backgroundColor: Colors.blue,
      icon: Icons.add_shopping_cart,
      onPressed: (context) {
        unfocus();
        ref
            .read(analyticsControllerProvider)
            .logSingleEvent(directPurchaseEventName);
        Navigator.push(
          context,
          PurchasePage.route(item.asins.first),
        );
      },
    );
  }

  SlidableAction _deleteAction(
      BuildContext context, WidgetRef ref, SearchItem item) {
    return SlidableAction(
      label: "削除",
      backgroundColor: Colors.red,
      icon: Icons.delete,
      onPressed: (_) async {
        unfocus();
        // onPressed から渡される context だとダイアログが表示できないので Widget の context を使う
        final ret = await showOkCancelAlertDialog(
          context: context,
          title: "商品の削sl除",
          message: "リストからアイテムを削除します",
          isDestructiveAction: true,
        );
        final ok = ret == OkCancelResult.ok;
        if (ok) {
          ref.read(searchItemControllerProvider.notifier).remove([item]);
          await ref
              .read(analyticsControllerProvider)
              .logSingleEvent(deleteSearchHistoryEventName);
        }
      },
    );
  }

  SlidableAction _webAction(
      WidgetRef ref, CustomButtonDetail button, SearchItem item) {
    final url = replaceUrl(template: button.pattern, item: item.asins.first);
    final eventName = customButtonEventMap.containsKey(button.pattern)
        ? customButtonEventMap[button.pattern]!
        : button.pattern;

    return SlidableAction(
      label: button.title,
      backgroundColor: Colors.indigo,
      icon: Icons.search,
      onPressed: (_) async {
        unfocus();
        if (url.startsWith("http")) {
          await ref
              .read(analyticsControllerProvider)
              .logPushSearchButtonEvent(eventName);
          await FlutterWebBrowser.openWebPage(url: url);
        }
      },
    );
  }

  SlidableAction _navigationAction(
      WidgetRef ref, String target, SearchItem item) {
    var title = "";
    var event = "";
    Route<void> navigation;
    switch (target) {
      case navigationTargetKeepa:
        title = "Keepa";
        event = pushSearchButtonKeepaName;
        navigation = KeepaPage.route(item.asins.first.asin);
        break;
      case navigationTargetNewOffers:
        title = "新品一覧";
        event = pushSearchButtonAmazonNewOffersName;
        navigation = OfferListingPage.route(OfferListingsParams(
          asin: item.asins.first.asin,
          newItem: true,
        ));
        break;
      case navigationTargetUsedOffers:
        title = "中古一覧";
        event = pushSearchButtonAmazonUsedOffersName;
        navigation = OfferListingPage.route(OfferListingsParams(
          asin: item.asins.first.asin,
          usedLikeNew: true,
          usedVeryGood: true,
          usedGood: true,
          usedAcceptable: true,
        ));
        break;
      default:
        throw Exception("Unknown navigation target: $target");
    }
    return SlidableAction(
      label: title,
      backgroundColor: Colors.deepPurpleAccent,
      icon: Icons.search,
      onPressed: (context) async {
        unfocus();
        await ref
            .read(analyticsControllerProvider)
            .logPushSearchButtonEvent(event);
        await Navigator.of(context).push(navigation);
      },
    );
  }
}
