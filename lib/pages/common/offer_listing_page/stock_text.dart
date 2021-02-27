import 'package:amasearch/models/offer_stocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentSellerIdProvider = ScopedProvider<String>(null);
final currentAsinProvider = ScopedProvider<String>(null);

class StockText extends HookWidget {
  const StockText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sellerId = useProvider(currentSellerIdProvider);
    final asin = useProvider(currentAsinProvider);
    final param = OfferStocksParam(asin: asin, sellerId: sellerId);
    final smallSize = Theme.of(context).textTheme.bodyText2;
    return useProvider(offerStocksFutureProvider(param)).when(
      loading: () => Text("在庫: loading", style: smallSize),
      error: (error, stackTrace) => Text("$error"),
      data: (value) {
        return value == 0
            ? Text("在庫: 不明", style: smallSize)
            : Text("在庫: $value", style: smallSize);
      },
    );
  }
}
