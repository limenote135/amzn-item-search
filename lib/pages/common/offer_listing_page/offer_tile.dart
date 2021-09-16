import 'package:amasearch/models/offer_listings.dart';
import 'package:amasearch/styles/font.dart';
import 'package:amasearch/util/error_report.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'offer_chips.dart';
import 'offer_listing_page.dart';
import 'stock_text.dart';

class OfferTile extends HookConsumerWidget {
  const OfferTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(currentIndex);
    final param = ref.watch(currentOfferListingParamProvider);
    final offerItem = ref.watch(
      offerAtIndexProvider(OfferAtIndexParam(
        params: param,
        index: index,
      )),
    );
    final bigSize = bigFontSize(context);
    return offerItem.when(
      loading: () => const ListTile(
        title: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stackTrace) {
        recordError(error, stackTrace, information: [
          "OfferTile.offerItem",
          "index: $index, param: ${param.toString()}",
        ]);
        return Text("$error");
      },
      data: (value) {
        return ListTile(
          title: Row(children: [
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
          ]),
        );
      },
    );
  }
}
