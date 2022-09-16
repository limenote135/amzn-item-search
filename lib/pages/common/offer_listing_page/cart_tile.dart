import 'package:amasearch/models/offer_listings.dart';
import 'package:amasearch/styles/font.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:amasearch/widgets/async_value_widget.dart';
import 'package:amasearch/widgets/strong_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'offer_chips.dart';
import 'stock_text.dart';

class CartTile extends HookConsumerWidget {
  const CartTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asin = ref.watch(currentAsinProvider);
    final bigSize = bigFontSize(context);
    final cartOfferAsyncValue = ref.watch(cartOfferProvider(asin));
    return AsyncValueListTileWidget<OfferItem?>(
      value: cartOfferAsyncValue,
      errorInfo: [
        "CartTile.cartOfferProvider",
        "ASIN: $asin",
      ],
      data: (value) {
        if (value == null) {
          return const StrongContainer(
            ListTile(
              title: Text("カート無し"),
            ),
          );
        }
        return Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("注：送料は含まれません"),
            ),
            StrongContainer(
              ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("カート情報"),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: bigSize,
                                  children: [
                                    TextSpan(
                                      text: numberFormatter.format(value.price),
                                      style: strongTextStyle,
                                    ),
                                    const TextSpan(
                                      text: "円",
                                      style: blackTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                              ProviderScope(
                                overrides: [
                                  currentSellerIdProvider
                                      .overrideWithValue(value.sellerId),
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
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
