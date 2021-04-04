import 'dart:typed_data';

import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/controllers/search_settings_controller.dart';
import 'package:amasearch/controllers/stock_item_controller.dart';
import 'package:amasearch/models/enums/purchase_item_condition.dart';
import 'package:amasearch/models/item_price.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/pages/common/purchase_settings/form.dart';
import 'package:amasearch/pages/common/purchase_settings/values.dart';
import 'package:amasearch/styles/button.dart';
import 'package:amasearch/util/price_util.dart';
import 'package:amasearch/util/util.dart';
import 'package:amasearch/util/uuid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PurchasePage extends StatelessWidget {
  const PurchasePage({Key? key}) : super(key: key);
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

final _itemImageProvider = StateProvider.autoDispose<Uint8List?>((_) => null);

class _Body extends HookWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentAsinDataProvider);
    final uuid = context.read(uuidProvider);

    // 仮で初期値を新品最安値、無ければ中古最安値にする
    final lowestPrice = _calcLowestPrice(item.prices);
    final useFba = useProvider(searchSettingsControllerProvider.state).useFba;

    final stock = StockItem(
      purchaseDate: currentTimeString(),
      sellPrice: lowestPrice,
      useFba: useFba,
      autogenSku: true,
      item: item,
      id: uuid.v4(),
    );

    return ProviderScope(
      overrides: [
        currentStockItemProvider.overrideWithValue(stock),
      ],
      child: PurchaseSettingsForm(
        onComplete: (bytes) {
          // 仕入れリストに入れるときのために画像のバイナリデータを保持しておく
          context.read(_itemImageProvider).state = bytes.buffer.asUint8List();
        },
        action: ReactiveFormConsumer(
          builder: (context, form, child) {
            return Consumer(
              builder: (context, watch, child) {
                final image = watch(_itemImageProvider);
                return ElevatedButton(
                  style: raisedButtonStyle(context),
                  onPressed: form.invalid
                      ? null
                      : () => _onSubmit(
                          context, form, uuid.v4(), item, image.state),
                  child: const Text("仕入れる"),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _onSubmit(
    BuildContext context,
    FormGroup form,
    String id,
    AsinData item,
    Uint8List? image,
  ) {
    final purchase = getInt(form, purchasePriceField);
    final sell = getInt(form, sellPriceField);
    final useFba = getBool(form, useFbaField);

    final profit = calcProfit(
      sellPrice: sell,
      purchasePrice: purchase,
      fee: item.prices?.feeInfo,
      useFba: useFba,
    );
    final breakEven = calcBreakEven(
      purchase: purchase,
      useFba: useFba,
      feeInfo: item.prices?.feeInfo,
    );

    final stock = StockItem(
      id: id,
      purchasePrice: purchase,
      sellPrice: getInt(form, sellPriceField),
      useFba: getBool(form, useFbaField),
      profitPerItem: profit,
      amount: getInt(form, quantityField),
      condition: getCondition(form).toItemCondition(),
      subCondition: getCondition(form).toItemSubCondition(),
      sku: getString(form, skuField),
      memo: getString(form, memoField),
      item: image == null ? item : item.copyWith(imageData: image),
      purchaseDate: getString(form, purchaseDateField),
      retailer: getString(form, retailerField),
      breakEven: breakEven,
    );
    context.read(stockItemListControllerProvider).add(stock);
    context.read(analyticsControllerProvider).logPurchaseEvent(stock);

    Navigator.of(context).popUntil((route) => route.settings.name == "/");
  }

  int _calcLowestPrice(ItemPrices? prices) {
    if (prices == null) {
      return 0;
    }
    if (prices.newPrices.isNotEmpty) {
      return prices.newPrices.first.price;
    }
    if (prices.usedPrices.isNotEmpty) {
      return prices.usedPrices.first.price;
    }
    return 0;
  }
}
