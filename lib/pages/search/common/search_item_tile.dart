import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/controllers/search_settings_controller.dart';
import 'package:amasearch/models/item_price.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/styles/font.dart';
import 'package:amasearch/util/alert.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:amasearch/widgets/image_tile.dart';
import 'package:amasearch/widgets/strong_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'price_info.dart';

final currentSearchDateProvider = ScopedProvider<String?>(null);
final isEllipsisProvider = ScopedProvider<bool>((_) => false);

class SearchItemTile extends HookWidget {
  const SearchItemTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentAsinDataProvider);
    final search = useProvider(searchSettingsControllerProvider);
    final settings = useProvider(generalSettingsControllerProvider);
    final tile = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        TileImage(),
        Expanded(
          child: _ItemTileBody(),
        )
      ],
    );
    if (settings.enableAlert &&
        settings.alerts.any((element) => element.match(
              item,
              search,
              isMajorCustomer: settings.isMajorCustomer,
            ))) {
      return StrongContainer(tile);
    }
    return tile;
  }
}

class _ItemTileBody extends HookWidget {
  const _ItemTileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentAsinDataProvider);
    final date = useProvider(currentSearchDateProvider);
    final isEllipsis = useProvider(isEllipsisProvider);

    final cartPrice = getCartPrice(item.prices);

    final smallSize = smallFontSize(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isEllipsis
            ? Text(
                item.title,
                style: captionSize(context),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              )
            : Text(
                item.title,
                style: captionSize(context),
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
            )
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
        if (date != null)
          Text(
            "検索日: ${DateTime.parse(date).toLocal().format()}",
            style: smallSize,
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
