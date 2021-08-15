import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/offer_stocks.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentSellerIdProvider =
    Provider<String>((_) => throw UnimplementedError());
final currentAsinProvider = Provider<String>((_) => throw UnimplementedError());

class StockText extends HookConsumerWidget {
  const StockText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(generalSettingsControllerProvider);
    if (!settings.getStocks) {
      return Container();
    }
    final sellerId = ref.watch(currentSellerIdProvider);
    final asin = ref.watch(currentAsinProvider);
    final param = OfferStocksParam(asin: asin, sellerId: sellerId);
    final smallSize = Theme.of(context).textTheme.bodyText2;
    return ref.watch(offerStocksFutureProvider(param)).when(
          loading: () => Text("在庫: loading", style: smallSize),
          error: (error, stackTrace) {
            FirebaseCrashlytics.instance
                .recordError(error, stackTrace, information: [
              DiagnosticsNode.message("StockText.offerStocksFutureProvider"),
              DiagnosticsNode.message("ASIN: $asin, SellerID: $sellerId"),
            ]);
            return Text("$error");
          },
          data: (value) {
            return value == 0
                ? Text("在庫: 不明", style: smallSize)
                : Text("在庫: $value", style: smallSize);
          },
        );
  }
}
