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
    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      actionExtentRatio: 0.2,
      actions: [
        for (final act in left)
          if (needShow(from, act.type))
            _getAction(context, ref, act.type, act.param, buttons, items)
      ],
      secondaryActions: [
        for (final act in right)
          if (needShow(from, act.type))
            _getAction(context, ref, act.type, act.param, buttons, items)
      ],
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
        return _purchaseAction(context, ref, item);
      case ShortcutType.delete:
        return _deleteAction(context, ref, item);
      case ShortcutType.web:
        final button = buttons.firstWhere((element) => element.id == param);
        return _webAction(ref, button, item);
      case ShortcutType.navigation:
        return _navigationAction(context, ref, param, item);
      case ShortcutType.none:
        throw Exception("Invalid type");
    }
  }

  IconSlideAction _purchaseAction(
      BuildContext context, WidgetRef ref, SearchItem item) {
    return IconSlideAction(
      caption: "仕入れ",
      color: Colors.blue,
      icon: Icons.add_shopping_cart,
      onTap: () {
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

  IconSlideAction _deleteAction(
      BuildContext context, WidgetRef ref, SearchItem item) {
    return IconSlideAction(
      caption: "削除",
      color: Colors.red,
      icon: Icons.delete,
      onTap: () async {
        unfocus();
        final ret = await showOkCancelAlertDialog(
          context: context,
          title: "商品の削除",
          message: "在庫リストからアイテムを削除します",
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

  IconSlideAction _webAction(
      WidgetRef ref, CustomButtonDetail button, SearchItem item) {
    final url = replaceUrl(template: button.pattern, item: item.asins.first);
    final eventName = customButtonEventMap.containsKey(button.pattern)
        ? customButtonEventMap[button.pattern]!
        : button.pattern;

    return IconSlideAction(
      caption: button.title,
      color: Colors.indigo,
      icon: Icons.search,
      onTap: () async {
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

  IconSlideAction _navigationAction(
      BuildContext context, WidgetRef ref, String target, SearchItem item) {
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
    return IconSlideAction(
      caption: title,
      color: Colors.deepPurpleAccent,
      icon: Icons.search,
      onTap: () async {
        unfocus();
        await ref
            .read(analyticsControllerProvider)
            .logPushSearchButtonEvent(event);
        await Navigator.of(context).push(navigation);
      },
    );
  }
}
