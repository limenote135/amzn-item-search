import 'package:amasearch/models/offer_listings.dart';
import 'package:amasearch/styles/font.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:amasearch/widgets/async_value_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'offer_chips.dart';
import 'providers.dart';
import 'stock_text.dart';

class OfferTile extends HookConsumerWidget {
  const OfferTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(currentItemIndexProvider);
    final param = ref.watch(currentOfferListingParamProvider);
    final offerItem = ref.watch(
      offerAtIndexProvider(
        OfferAtIndexParam(
          params: param,
          index: index,
        ),
      ),
    );
    final headlineSize = headlineFontSize(context);
    return AsyncValueListTileWidget<OfferItem>(
      value: offerItem,
      errorInfo: [
        "OfferTile.offerItem",
        "index: $index, param: $param",
      ],
      data: (value) => ListTile(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(
                      style: headlineSize,
                      children: [
                        TextSpan(
                          text: numberFormatter.format(value.price),
                          style: strongTextStyle,
                        ),
                        const TextSpan(text: "円"),
                      ],
                    ),
                  ),
                  ProviderScope(
                    overrides: [
                      currentSellerIdProvider.overrideWithValue(value.sellerId),
                    ],
                    child: const StockText(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ProviderScope(
                overrides: [
                  currentOfferItemProvider.overrideWithValue(value),
                ],
                child: const OfferChips(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
