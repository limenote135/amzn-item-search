import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/controllers/search_settings_controller.dart';
import 'package:amasearch/controllers/stock_item_controller.dart';
import 'package:amasearch/models/alert_condition.dart';
import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/models/enums/hazmat_type.dart';
import 'package:amasearch/models/enums/item_condition.dart';
import 'package:amasearch/models/general_settings.dart';
import 'package:amasearch/models/item_price.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/pages/common/listing_history_page/listing_history_page.dart';
import 'package:amasearch/pages/search/common/seller_list_tile.dart';
import 'package:amasearch/styles/font.dart';
import 'package:amasearch/util/alert.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:amasearch/widgets/floating_action_margin.dart';
import 'package:amasearch/widgets/hazmat_info.dart';
import 'package:amasearch/widgets/item_image.dart';
import 'package:amasearch/widgets/search_buttons.dart';
import 'package:amasearch/widgets/strong_container.dart';
import 'package:amasearch/widgets/text_line_tile.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import 'price_detail_tile.dart';

class SearchItemDetail extends ConsumerWidget {
  const SearchItemDetail({super.key, this.additionalWidget});

  final Widget? additionalWidget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentAsinDataProvider);
    final isRestricted = item.restrictions.newItem | item.restrictions.used;
    final isPaid = ref.watch(isPaidUserProvider);

    final isStocked = ref.watch(
      stockItemForAsinProvider(item.asin).select((value) => value.isNotEmpty),
    );
    final containsMyOffer = _isContainsMyOffer(item.prices);

    final search = ref.watch(searchSettingsControllerProvider);
    final settings = ref.watch(generalSettingsControllerProvider);
    final alerts = settings.alerts.where((e) => e.match(item, search)).toList();

    return ListView(
      children: ListTile.divideTiles(
        context: context,
        tiles: [
          if (isRestricted) const _Restricted(),
          if (isRestricted && settings.enableAlert && alerts.isNotEmpty)
            const ThemeDivider(), // 出品可否とアラートは背景色が同じなのでボーダーを入れる
          if (isPaid && item.hazmatType != HazmatType.nonHazmat)
            const HazmatInfo(),
          if (isPaid && settings.enableAlert && alerts.isNotEmpty)
            _AlertDetail(alerts),
          if (isPaid && (isStocked || containsMyOffer)) const _StockInfo(),
          InkWell(
            onLongPress: () {
              Clipboard.setData(ClipboardData(text: item.title)).then((_) {
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("商品名をコピーしました"),
                  ),
                );
              });
            },
            child: ListTile(
              leading: ItemImage(
                url: item.imageUrl,
              ),
              title: Text(item.title),
            ),
          ),
          InkWell(
            onLongPress: () {
              Clipboard.setData(ClipboardData(text: item.jan)).then((_) {
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("JAN コードをコピーしました"),
                  ),
                );
              });
            },
            child: TextListTile(
              leading: const Text("JAN"),
              main: Text(item.jan),
            ),
          ),
          InkWell(
            onLongPress: () {
              Clipboard.setData(ClipboardData(text: item.asin)).then((_) {
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("ASIN をコピーしました"),
                  ),
                );
              });
            },
            child: TextListTile(
              leading: const Text("ASIN"),
              main: Text(item.asin),
            ),
          ),
          TextListTile(
            leading: const Text("順位"),
            main: Text("${numberFormatter.format(item.rank)} 位"),
          ),
          const PriceDetailTile(ItemCondition.newItem),
          const PriceDetailTile(ItemCondition.usedItem),
          const SellerListTile(initiallyExpanded: true),
          ProviderScope(
            overrides: [
              currentItemProvider.overrideWithValue(item),
            ],
            child: const SearchButtons(),
          ),
          if (additionalWidget != null) additionalWidget!,
          floatingActionMargin,
        ],
      ).toList(),
    );
  }
}

class _Restricted extends ConsumerWidget {
  const _Restricted();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentAsinDataProvider);

    final target = _createRestrictedText(item.restrictions);
    return StrongContainer(
      ListTile(
        title: Column(
          children: [
            Text("出品不可商品です$target", style: strongTextStyle),
            Text.rich(
              TextSpan(
                text: "出品許可申請はこちら",
                style: const TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    await launchUrl(
                      Uri.parse(
                        "https://sellercentral.amazon.co.jp/hz/approvalrequest/restrictions/approve?asin=${item.asin}",
                      ),
                      mode: LaunchMode.inAppBrowserView,
                    );
                  },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _createRestrictedText(ListingRestrictions restrictions) {
    if (restrictions.newItem && !restrictions.used) {
      return "(新品)";
    }
    if (!restrictions.newItem && restrictions.used) {
      return "(中古)";
    }
    return "(新/古)";
  }
}

class _StockInfo extends ConsumerWidget {
  const _StockInfo();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentAsinDataProvider);
    final stockItems = ref.watch(stockItemForAsinProvider(item.asin));

    if (stockItems.isNotEmpty) {
      // 在庫リストに同じ商品がある場合、現在出品中かを問わず情報表示
      return Strong2Container(
        ListTile(
          title: Column(
            children: [
              Text(
                createText(
                  stockItems.length,
                  stockItems.where((e) => e.purchasePrice != 0).toList(),
                  isContainsMyOffer: _isContainsMyOffer(item.prices),
                ),
              ),
              Text.rich(
                TextSpan(
                  text: "詳細はこちら",
                  style: const TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        ListingHistoryPage.route(stockItems),
                      );
                    },
                ),
              ),
            ],
          ),
        ),
      );
    }

    // 在庫リストにない場合は出品していることだけ表示
    return const Strong2Container(
      ListTile(
        title: Center(child: Text("現在出品中です")),
      ),
    );
  }

  String createText(
    int total,
    List<StockItem> items, {
    required bool isContainsMyOffer,
  }) {
    if (items.isEmpty) {
      if (isContainsMyOffer) {
        return "過去に $total 回仕入れて、現在出品中です";
      }
      return "過去に $total 回仕入れています";
    }
    final average = items.averageBy((e) => e.purchasePrice).round();
    if (isContainsMyOffer) {
      return "過去に平均 $average 円で $total 回仕入れて、現在出品中です";
    }
    return "過去に平均 $average 円で $total 回仕入れています";
  }
}

bool _isContainsMyOffer(ItemPrices? prices) {
  if (prices == null) {
    return false;
  }
  return prices.newPrices.any((e) => e.isSelf) ||
      prices.usedPrices.any((e) => e.isSelf);
}

class _AlertDetail extends ConsumerWidget {
  const _AlertDetail(this.alerts);

  final List<AlertConditionSet> alerts;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StrongContainer(
      ListTile(
        title: Column(
          children: [
            const Text("以下のアラート条件に一致しています"),
            Text.rich(
              TextSpan(
                children: [
                  for (final alert in alerts)
                    TextSpan(
                      children: [
                        TextSpan(
                          text: alert.title,
                          style: const TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              final summaries = alert.conditions
                                  .map((e) => "・${e.toSummary()}")
                                  .toList();
                              await showOkAlertDialog(
                                context: context,
                                title: alert.title,
                                message: "設定内容:\n${summaries.join("\n")}",
                              );
                            },
                        ),
                        const TextSpan(text: ", "),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
