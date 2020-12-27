import 'dart:typed_data';

import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/controllers/purchase_settings_controller.dart';
import 'package:amasearch/controllers/stock_item_controller.dart';
import 'package:amasearch/models/enums/purchase_item_condition.dart';
import 'package:amasearch/models/item.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/pages/common/purchase_settings/form.dart';
import 'package:amasearch/util/price_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

class PurchasePage extends StatelessWidget {
  const PurchasePage({Key key}) : super(key: key);
  static const routeName = "/search/purchase";

  static Route<void> route(AsinData item) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => ProviderScope(
        overrides: [
          currentAsinDataProvider.overrideWithValue(item),
        ],
        child: const PurchasePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("仕入れ設定"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends HookWidget {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentAsinDataProvider);
    final base = purchaseSettingsControllerProvider(item.asin);
    final formKey = useProvider(base.state.select((value) => value.formKey));

    final image = useState<Uint8List>(null);

    return ProviderScope(
      overrides: [
        currentPurchaseSettingsControllerProvider.overrideWithValue(base),
      ],
      child: PurchaseSettingsForm(
        onComplete: (bytes) {
          if (item.imageData == null) {
            // 仕入れリストに入れるときのために画像のバイナリデータを保持しておく
            image.value = bytes.buffer.asUint8List();
          }
        },
        action: RaisedButton(
          child: const Text("仕入れる"),
          onPressed: () {
            if (formKey.currentState.validate()) {
              final data = context.read(base.state);

              final stock = StockItem(
                purchasePrice: data.purchasePrice,
                sellPrice: data.sellPrice,
                useFba: data.useFba,
                profitPerItem: calcProfit(
                    sellPrice: data.sellPrice,
                    purchasePrice: data.purchasePrice,
                    fee: item.prices.feeInfo,
                    useFba: data.useFba),
                amount: data.amount,
                condition: data.condition.toItemCondition(),
                subCondition: data.condition.toItemSubCondition(),
                sku: data.sku,
                memo: data.memo,
                item: item.imageData != null
                    ? item
                    : item.copyWith(imageData: image.value),
                purchaseDate: DateTime.now().toUtc().toIso8601String(),
                retailer: data.retailer,
              );

              context.read(stockItemListControllerProvider).add(stock);
              context.read(analyticsControllerProvider).logPurchaseEvent(stock);

              Navigator.of(context)
                  .popUntil((route) => route.settings.name == "/");
            }
          },
        ),
      ),
    );
  }
}
