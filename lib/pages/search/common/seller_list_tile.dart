import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/models/enums/fulfillment_channel.dart';
import 'package:amasearch/models/enums/item_condition.dart';
import 'package:amasearch/models/enums/item_sub_condition.dart';
import 'package:amasearch/models/enums/seller_type.dart';
import 'package:amasearch/models/item_price.dart';
import 'package:amasearch/styles/font.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _currentPriceDetailProvider =
    Provider<PriceDetail>((_) => throw UnimplementedError());

final initiallyExpandedOffersProvider = Provider<bool>((_) => false);

class SellerListTile extends HookConsumerWidget {
  const SellerListTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentAsinDataProvider);
    final initiallyExpanded = ref.watch(initiallyExpandedOffersProvider);
    return ExpansionTile(
      title: const Text("出品価格情報"),
      initiallyExpanded: initiallyExpanded,
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
                    Center(
                      child: Text(
                        "新品(${calcOfferCount(item.prices?.newPrices)}人)",
                      ),
                    ),
                    for (final price
                        in item.prices?.newPrices ?? <PriceDetail>[])
                      ProviderScope(
                        overrides: [
                          _currentPriceDetailProvider.overrideWithValue(price),
                        ],
                        child: const _OfferItem(ItemCondition.newItem),
                      ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "中古(${calcOfferCount(item.prices?.usedPrices)}人)",
                      ),
                    ),
                    for (final price
                        in item.prices?.usedPrices ?? <PriceDetail>[])
                      ProviderScope(
                        overrides: [
                          _currentPriceDetailProvider.overrideWithValue(price),
                        ],
                        child: const _OfferItem(ItemCondition.usedItem),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  String calcOfferCount(List<PriceDetail>? prices) {
    if (prices == null) {
      return "0";
    }
    if (prices.length >= 20) {
      return "20+";
    }
    return "${prices.length}";
  }
}

class _OfferItem extends HookConsumerWidget {
  const _OfferItem(this.cond);

  final ItemCondition cond;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detail = ref.watch(_currentPriceDetailProvider);
    final smallFont = smallFontSize(context);
    final smallRedFont = smallFontSizeRedText(context);

    final isSelf = detail.isSelf || detail.sellerType == SellerType.me;
    final isAmazon = detail.sellerType == SellerType.amazon;

    final isFbaStr =
        detail.channel == FulfillmentChannel.amazon && !isAmazon ? "(FBA)" : "";
    final priceStr = numberFormatter.format(detail.price);
    final shippingStr = numberFormatter.format(detail.shipping);

    switch (cond) {
      case ItemCondition.newItem:
        return Row(
          children: [
            Text(
              "新品$isFbaStr",
              style: isSelf || isAmazon ? smallRedFont : smallFont,
            ),
            if (isSelf) Text("(自分)", style: smallRedFont),
            if (isAmazon) Text("(Amazon)", style: smallRedFont),
            const Spacer(),
            Text(
              "$priceStr 円(送 $shippingStr 円)",
              style: isSelf || isAmazon ? smallRedFont : smallFont,
            ),
          ],
        );
      case ItemCondition.usedItem:
        return Row(
          children: [
            Text(
              "${detail.subCondition.toDisplayShortString()}$isFbaStr",
              style: detail.isSelf ? smallRedFont : smallFont,
            ),
            if (detail.isSelf) Text("(自分)", style: smallRedFont),
            const Spacer(),
            Text(
              "$priceStr 円(送 $shippingStr 円)",
              style: detail.isSelf ? smallRedFont : smallFont,
            ),
          ],
        );
    }
  }
}
