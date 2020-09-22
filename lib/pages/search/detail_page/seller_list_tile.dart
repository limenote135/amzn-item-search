import 'package:amasearch/models/fulfillment_channel.dart';
import 'package:amasearch/models/item.dart';
import 'package:amasearch/models/item_condition.dart';
import 'package:amasearch/models/item_price.dart';
import 'package:amasearch/models/item_sub_condition.dart';
import 'package:amasearch/styles/font.dart';
import 'package:amasearch/util/util.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

final _currentPriceDetailProvider = ScopedProvider<PriceDetail>(null);

class SellerListTile extends HookWidget {
  const SellerListTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentAsinDataProvider);
    return ExpansionTile(
      title: const Text("出品情報"),
      children: [
        const ThemeDivider(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    const Center(child: Text("新品")),
                    for (final price in item.prices.newPrice.prices)
                      ProviderScope(
                        overrides: [
                          _currentPriceDetailProvider.overrideWithValue(price),
                        ],
                        child: const _OfferItem(ItemCondition.newItem),
                      )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    const Center(child: Text("中古")),
                    for (final price in item.prices.usedPrice.prices)
                      ProviderScope(
                        overrides: [
                          _currentPriceDetailProvider.overrideWithValue(price),
                        ],
                        child: const _OfferItem(ItemCondition.usedItem),
                      )
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class _OfferItem extends HookWidget {
  const _OfferItem(this.cond, {Key key}) : super(key: key);

  final ItemCondition cond;

  @override
  Widget build(BuildContext context) {
    final detail = useProvider(_currentPriceDetailProvider);
    final smallFont = smallFontSize(context);

    final isFbaStr = detail.channel == FulfillmentChannel.amazon ? "(FBA)" : "";
    final priceStr = numberFormatter.format(detail.price);
    final shippingStr = numberFormatter.format(detail.shipping);

    switch (cond) {
      case ItemCondition.newItem:
        return Row(
          children: [
            Text("新品$isFbaStr", style: smallFont),
            const Spacer(),
            Text("$priceStr 円(送 $shippingStr 円)", style: smallFont),
          ],
        );
      case ItemCondition.usedItem:
        return Row(
          children: [
            Text("${detail.subCondition.toDisplayShortString()}$isFbaStr",
                style: smallFont),
            const Spacer(),
            Text("$priceStr 円(送 $shippingStr 円)", style: smallFont),
          ],
        );
    }

    throw Exception("Unknown item condition: $cond");
  }
}
