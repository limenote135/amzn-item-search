import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/offer_stocks.dart';
import 'package:amasearch/styles/font.dart';
import 'package:amasearch/util/error_report.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentSellerIdProvider =
    Provider<String>((_) => throw UnimplementedError());
final currentAsinProvider = Provider<String>((_) => throw UnimplementedError());

class StockText extends HookConsumerWidget {
  const StockText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(generalSettingsControllerProvider);
    if (!settings.getStocks) {
      return Container();
    }
    final sellerId = ref.watch(currentSellerIdProvider);
    final asin = ref.watch(currentAsinProvider);
    final param = OfferStocksParam(asin: asin, sellerId: sellerId);
    final middleSize = middleFontSize(context);
    return ref.watch(offerStocksFutureProvider(param)).when(
          loading: () => Text("在庫: loading", style: middleSize),
          error: (error, stackTrace) {
            recordError(
              error,
              stackTrace,
              information: [
                "StockText.offerStocksFutureProvider",
                "ASIN: $asin, SellerID: $sellerId",
              ],
            );
            return Text("$error");
          },
          data: (value) {
            return value == 0
                ? Text("在庫: 不明", style: middleSize)
                : Text("在庫: $value", style: middleSize);
          },
        );
  }
}
