import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/events.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/models/enums/shortcut_type.dart';
import 'package:amasearch/models/general_settings.dart';
import 'package:amasearch/models/general_settings_default.dart';
import 'package:amasearch/models/offer_listings.dart';
import 'package:amasearch/pages/common/keepa_page/keepa_page.dart';
import 'package:amasearch/pages/common/offer_listing_page/offer_listing_page.dart';
import 'package:amasearch/pages/common/variation_page/variation_page.dart';
import 'package:amasearch/util/url_replacer.dart';
import 'package:amasearch/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SlidableTile extends HookConsumerWidget {
  const SlidableTile({
    super.key,
    required this.child,
    this.onPurchase,
    this.onDelete,
  });

  final Widget child;
  final void Function()? onPurchase;
  final Future<bool> Function()? onDelete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final left = ref.watch(
      generalSettingsControllerProvider
          .select((value) => value.leftSlideShortcut),
    );
    final right = ref.watch(
      generalSettingsControllerProvider
          .select((value) => value.rightSlideShortcut),
    );
    final baseButtons = ref.watch(
      generalSettingsControllerProvider.select((value) => value.customButtons),
    );

    final item = ref.watch(currentAsinDataProvider);
    final hasVariation = item.variationRoot != "";

    final buttons = [...baseButtons, amazonListingsButton];

    final leftActive = left.fold<int>(
      0,
      (prev, e) {
        if (e.type != ShortcutType.none) {
          if ((e.type == ShortcutType.delete && onDelete == null) ||
              (e.param == navigationTargetVariation && !hasVariation)) {
            return prev;
          }
          return prev + 1;
        }
        return prev;
      },
    );
    final rightActive = right.fold<int>(
      0,
      (prev, e) {
        if (e.type != ShortcutType.none) {
          if ((e.type == ShortcutType.delete && onDelete == null) ||
              (e.param == navigationTargetVariation && !hasVariation)) {
            return prev;
          }
          return prev + 1;
        }
        return prev;
      },
    );
    return Slidable(
      startActionPane: leftActive > 0
          ? ActionPane(
              motion: const DrawerMotion(),
              extentRatio: 0.2 * leftActive,
              children: [
                for (final act in left)
                  if (needShow(act.type, disableDelete: onDelete == null) &&
                      (act.param != navigationTargetVariation ||
                          hasVariation)) // Variation を表示する場合のはバリエーションがあるときのみにする
                    _getAction(context, ref, act.type, act.param, buttons, item)
              ],
            )
          : null,
      endActionPane: rightActive > 0
          ? ActionPane(
              motion: const DrawerMotion(),
              extentRatio: 0.2 * rightActive,
              children: [
                for (final act in right)
                  if (needShow(act.type, disableDelete: onDelete == null) &&
                      (act.param != navigationTargetVariation ||
                          hasVariation)) // Variation を表示する場合のはバリエーションがあるときのみにする
                    _getAction(context, ref, act.type, act.param, buttons, item)
              ],
            )
          : null,
      child: child,
    );
  }

  bool needShow(ShortcutType type, {required bool disableDelete}) {
    if (type == ShortcutType.delete && disableDelete) {
      // カメラページや複数商品選択画面の場合は delete 不可
      return false;
    }
    if (type == ShortcutType.none) {
      // none の場合は非表示
      return false;
    }
    return true;
  }

  Widget _getAction(
    BuildContext context,
    WidgetRef ref,
    ShortcutType type,
    String param,
    List<CustomButtonDetail> buttons,
    AsinData item,
  ) {
    switch (type) {
      case ShortcutType.purchase:
        return _purchaseAction(ref, item);
      case ShortcutType.delete:
        return _deleteAction(ref);
      case ShortcutType.web:
        final button = buttons.firstWhere((element) => element.id == param);
        return _webAction(ref, button, item);
      case ShortcutType.navigation:
        return _navigationAction(ref, param, item);
      case ShortcutType.none:
        throw Exception("Invalid type");
    }
  }

  SlidableAction _purchaseAction(WidgetRef ref, AsinData item) {
    return SlidableAction(
      label: "仕入れ",
      backgroundColor: Colors.blue,
      icon: Icons.add_shopping_cart,
      padding: EdgeInsets.zero,
      onPressed: (context) {
        unfocus();
        ref
            .read(analyticsControllerProvider)
            .logSingleEvent(directPurchaseEventName);
        onPurchase?.call();
      },
    );
  }

  SlidableAction _deleteAction(WidgetRef ref) {
    return SlidableAction(
      label: "削除",
      backgroundColor: Colors.red,
      icon: Icons.delete,
      padding: EdgeInsets.zero,
      onPressed: (_) async {
        unfocus();
        final result = await onDelete?.call();
        if (result == true) {
          await ref
              .read(analyticsControllerProvider)
              .logSingleEvent(deleteSearchHistoryEventName);
        }
      },
    );
  }

  SlidableAction _webAction(
    WidgetRef ref,
    CustomButtonDetail button,
    AsinData item,
  ) {
    final url = replaceUrl(template: button.pattern, item: item);
    final eventName = customButtonEventMap.containsKey(button.pattern)
        ? customButtonEventMap[button.pattern]!
        : button.pattern;

    return SlidableAction(
      label: button.title,
      backgroundColor: Colors.indigo,
      icon: Icons.search,
      padding: EdgeInsets.zero,
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
    WidgetRef ref,
    String target,
    AsinData item,
  ) {
    var title = "";
    var event = "";
    // Route そのままではなく、Route を返す関数にしないと
    // 遷移 -> 戻る -> 遷移とした際にエラーになる
    Route<void> Function() navigation;
    switch (target) {
      case navigationTargetKeepa:
        title = "Keepa";
        event = pushSearchButtonKeepaName;
        navigation = () => KeepaPage.route(item.asin);
        break;
      case navigationTargetNewOffers:
        title = "新品一覧";
        event = pushSearchButtonAmazonNewOffersName;
        navigation = () => OfferListingPage.route(
              OfferListingsParams(
                asin: item.asin,
                newItem: true,
              ),
            );
        break;
      case navigationTargetUsedOffers:
        title = "中古一覧";
        event = pushSearchButtonAmazonUsedOffersName;
        navigation = () => OfferListingPage.route(
              OfferListingsParams(
                asin: item.asin,
                usedLikeNew: true,
                usedVeryGood: true,
                usedGood: true,
                usedAcceptable: true,
              ),
            );
        break;
      case navigationTargetVariation:
        title = "ﾊﾞﾘｴｰｼｮﾝ";
        event = pushSearchButtonVariationName;
        navigation = () => VariationPage.route(item.variationRoot);
        break;
      default:
        throw Exception("Unknown navigation target: $target");
    }
    return SlidableAction(
      label: title,
      backgroundColor: Colors.deepPurpleAccent,
      icon: Icons.search,
      padding: EdgeInsets.zero,
      onPressed: (context) async {
        unfocus();
        await ref
            .read(analyticsControllerProvider)
            .logPushSearchButtonEvent(event);
        await Navigator.of(context).push(navigation());
      },
    );
  }
}
