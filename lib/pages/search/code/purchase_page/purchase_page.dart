import 'dart:typed_data';

import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/controllers/stock_item_controller.dart';
import 'package:amasearch/models/enums/purchase_item_condition.dart';
import 'package:amasearch/models/item.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/pages/common/purchase_settings/form.dart';
import 'package:amasearch/pages/common/purchase_settings/values.dart';
import 'package:amasearch/util/price_util.dart';
import 'package:amasearch/util/uuid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

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
      body: _Body(),
    );
  }
}

// TODO: statefulWidget にする？
class _Body extends HookWidget {
  _Body({Key key}) : super(key: key);

  Uint8List imageData;

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentAsinDataProvider);
    final uuid = context.read(uuidProvider);

    return PurchaseSettingsForm(
      onComplete: (bytes) {
        if (item.imageData == null) {
          // 仕入れリストに入れるときのために画像のバイナリデータを保持しておく
          imageData = bytes.buffer.asUint8List();
        }
      },
      action: ReactiveFormConsumer(
        builder: (context, form, child) {
          return RaisedButton(
            child: const Text("仕入れる"),
            onPressed: form.invalid
                ? null
                : () => _onSubmit(context, form, uuid.v4(), item),
          );
        },
      ),
    );
  }

  void _onSubmit(
      BuildContext context, FormGroup form, String id, AsinData item) {
    final purchase = getInt(form, purchasePriceField);
    final sell = getInt(form, sellPriceField);
    final useFba = getBool(form, useFbaField);

    final profit = calcProfit(
      sellPrice: sell,
      purchasePrice: purchase,
      fee: item.prices.feeInfo,
      useFba: useFba,
    );

    final stock = StockItem(
      id: id,
      purchasePrice: getInt(form, purchasePriceField),
      sellPrice: getInt(form, sellPriceField),
      useFba: getBool(form, useFbaField),
      profitPerItem: profit,
      amount: getInt(form, quantityField),
      condition: getCondition(form).toItemCondition(),
      subCondition: getCondition(form).toItemSubCondition(),
      sku: getString(form, skuField),
      memo: getString(form, memoField),
      item: item.imageData != null ? item : item.copyWith(imageData: imageData),
      purchaseDate: getString(form, purchaseDateField),
      retailer: getString(form, retailerField),
    );
    context.read(stockItemListControllerProvider).add(stock);
    context.read(analyticsControllerProvider).logPurchaseEvent(stock);

    Navigator.of(context).popUntil((route) => route.settings.name == "/");
  }
}
