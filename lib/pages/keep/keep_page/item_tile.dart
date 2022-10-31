import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/models/item_price.dart';
import 'package:amasearch/models/keep_item.dart';
import 'package:amasearch/pages/search/common/price_info.dart';
import 'package:amasearch/styles/font.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:amasearch/widgets/image_tile.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class KeepItemTile extends ConsumerWidget {
  const KeepItemTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: const [
        TileImage(),
        Expanded(child: _TileBody()),
      ],
    );
  }
}

class _TileBody extends ConsumerWidget {
  const _TileBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keepItem = ref.watch(currentKeepItemProvider);
    final item = ref.watch(currentAsinDataProvider);
    final cartPrice = getCartPrice(item.prices);

    final smallSize = smallFontSize(context);
    final captionSize = captionFontSize(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.title,
          style: captionSize,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
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
                        const TextSpan(text: "無", style: strongTextStyle)
                    ],
                  ),
                  style: smallSize,
                ),
              ),
          ],
        ),
        const PriceInfo(),
        const _ListingRestrictions(),
        Text(
          "追加日: ${DateTime.parse(keepItem.keepDate).toLocal().format()}",
          style: smallSize,
        ),
        Text(
          "メモ:",
          style: smallSize,
        ),
        Text(
          keepItem.memo,
          style: captionSize,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
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
