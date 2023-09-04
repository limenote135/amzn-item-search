import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/controllers/search_settings_controller.dart';
import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/models/item_price.dart';
import 'package:amasearch/styles/font.dart';
import 'package:amasearch/util/alert.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:amasearch/widgets/image_tile.dart';
import 'package:amasearch/widgets/strong_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'price_info.dart';

final currentSearchDateProvider =
    Provider<String?>((_) => throw UnimplementedError());
final isEllipsisProvider = Provider<bool>((_) => false);

class SearchItemTile extends HookConsumerWidget {
  const SearchItemTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentAsinDataProvider);
    final search = ref.watch(searchSettingsControllerProvider);
    final settings = ref.watch(generalSettingsControllerProvider);
    final isPaidUser = ref.watch(isPaidUserProvider);
    var alerts = settings.alerts;
    if (!isPaidUser) {
      alerts = alerts.take(2).toList();
    }
    const tile = Row(
      children: [
        TileImage(),
        Expanded(
          child: _ItemTileBody(),
        ),
      ],
    );
    if (settings.enableAlert &&
        alerts.any(
          (element) => element.match(
            item,
            search,
          ),
        )) {
      return const StrongContainer(tile);
    }
    return tile;
  }
}

class _ItemTileBody extends HookConsumerWidget {
  const _ItemTileBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentAsinDataProvider);
    final date = ref.watch(currentSearchDateProvider);
    final isEllipsis = ref.watch(isEllipsisProvider);
    final isPaidUser = ref.watch(isPaidUserProvider);

    final cartPrice = getCartPrice(item.prices);

    final smallSize = smallFontSize(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isEllipsis
            ? Text(
                item.title,
                style: captionFontSize(context),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              )
            : Text(
                item.title,
                style: captionFontSize(context),
              ),
        Row(
          children: [
            Expanded(child: Text("JAN ${item.jan}", style: smallSize)),
            Expanded(child: Text("ASIN: ${item.asin}", style: smallSize)),
          ],
        ),
        Row(
          children: [
            Expanded(child: Text(item.category, style: smallSize)),
            Expanded(child: Text("セット数: ${item.quantity} 個", style: smallSize)),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Text.rich(
                TextSpan(
                  text: "順位: ",
                  children: [
                    TextSpan(
                      text: numberFormatter.format(item.rank),
                      style: strongTextStyle,
                    ),
                    const TextSpan(
                      text: " 位",
                    ),
                  ],
                ),
                style: smallSize,
              ),
            ),
            Expanded(
              child: Text(
                "参考: ${numberFormatter.format(item.listPrice)} 円",
                style: smallSize,
              ),
            ),
          ],
        ),
        if (isPaidUser)
          Row(
            children: [
              Expanded(
                child: Text.rich(
                  TextSpan(
                    text: "カート: ",
                    children: [
                      if (cartPrice == -1)
                        const TextSpan(text: " - ")
                      else
                        TextSpan(
                          text: numberFormatter.format(cartPrice),
                          style: strongTextStyle,
                        ),
                      const TextSpan(text: " 円"),
                    ],
                    style: smallSize,
                  ),
                ),
              ),
              if (item.sellByAmazon != null)
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: "Amazon販売: ",
                      children: [
                        if (item.sellByAmazon == true)
                          const TextSpan(text: "有")
                        else
                          const TextSpan(text: "無", style: strongTextStyle),
                      ],
                    ),
                    style: smallSize,
                  ),
                ),
            ],
          ),
        const PriceInfo(),
        if (isPaidUser) const _ListingRestrictions(),
        Row(
          children: [
            Expanded(
              child: (date != null)
                  ? Text(
                      "検索日: ${DateTime.parse(date).toLocal().format()}",
                      style: smallSize,
                    )
                  : Container(),
            ),
            if (item.variationRoot.isNotEmpty && isPaidUser)
              Expanded(
                child: Text.rich(
                  const TextSpan(
                    text: "バリエーション",
                    children: [TextSpan(text: "有", style: strongTextStyle)],
                  ),
                  style: smallSize,
                ),
              ),
          ],
        ),
      ],
    );
  }

  int getCartPrice(ItemPrices? prices) {
    if (prices == null) {
      return -1;
    }
    // 中古がカートを取っている場合には情報が取れないようなので新品のみ見る
    final price = prices.newPrices.where((element) => element.isCart).toList();
    if (price.isEmpty) {
      return -1;
    }
    return price[0].price;
  }
}

class _ListingRestrictions extends ConsumerWidget {
  const _ListingRestrictions();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentAsinDataProvider);

    final smallStrongText = smallFontSize(context)!.merge(strongTextStyle);

    if (!item.restrictions.newItem && !item.restrictions.used) {
      return Container();
    }
    final listingNew = item.restrictions.newItem
        ? Expanded(child: Text("新品出品不可", style: smallStrongText))
        : const Spacer();
    final listingUsed = item.restrictions.used
        ? Expanded(child: Text("中古出品不可", style: smallStrongText))
        : const Spacer();
    return Row(
      children: [
        listingNew,
        listingUsed,
      ],
    );
  }
}
