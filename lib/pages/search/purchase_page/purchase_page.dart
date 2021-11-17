import 'dart:typed_data';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/controllers/search_settings_controller.dart';
import 'package:amasearch/controllers/stock_item_controller.dart';
import 'package:amasearch/models/enums/item_condition.dart';
import 'package:amasearch/models/enums/purchase_item_condition.dart';
import 'package:amasearch/models/item_price.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/pages/common/purchase_settings/form.dart';
import 'package:amasearch/pages/common/purchase_settings/values.dart';
import 'package:amasearch/util/price_util.dart';
import 'package:amasearch/util/util.dart';
import 'package:amasearch/util/uuid.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PurchasePage extends HookConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentAsinDataProvider);

    // 仮で初期値を新品最安値、無ければ中古最安値にする
    final lowestPrice = _calcLowestPrice(item.prices);
    final useFba = ref.watch(searchSettingsControllerProvider).useFba;

    final stock = StockItem(
      purchaseDate: currentTimeString(),
      sellPrice: lowestPrice,
      useFba: useFba,
      autogenSku: true,
      item: item,
      id: ref.read(uuidProvider).v4(), // たぶん空文字でも問題ない
    );
    final form = ref.watch(formValueProvider(stock));
    return ProviderScope(
      overrides: [
        currentStockItemProvider.overrideWithValue(stock),
      ],
      child: ReactiveForm(
        formGroup: form.state,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("仕入れ設定"),
            actions: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: _SaveButton(
                  builder: (context, onSave) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                      ),
                      onPressed: onSave,
                      child: const Text("仕入れ"),
                    );
                  },
                ),
              ),
            ],
          ),
          body: const _Body(),
        ),
      ),
    );
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

final _itemImageProvider = StateProvider.autoDispose<Uint8List?>((_) => null);

class _Body extends HookConsumerWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PurchaseSettingsForm(
      onComplete: (bytes) {
        // 仕入れリストに入れるときのために画像のバイナリデータを保持しておく
        ref.read(_itemImageProvider).state = bytes.buffer.asUint8List();
      },
      action: _SaveButton(
        builder: (context, onSave) {
          return ListTile(
            title: ElevatedButton(
              onPressed: onSave,
              child: const Text("仕入れる"),
            ),
          );
        },
      ),
    );
  }
}

class _SaveButton extends HookConsumerWidget {
  const _SaveButton({Key? key, required this.builder}) : super(key: key);

  final Widget Function(BuildContext context, void Function()? onSave) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentAsinDataProvider);
    final isMajorCustomer = ref.watch(generalSettingsControllerProvider
        .select((value) => value.isMajorCustomer));

    return ReactiveFormConsumer(
      builder: (context, form, child) {
        final image = ref.watch(_itemImageProvider);

        Future<void> _onSave() async {
          final cond = getCondition(form).toItemCondition();
          if (_isRestricted(cond, item.restrictions)) {
            final ret = await showOkCancelAlertDialog(
              context: context,
              title: "出品不可商品",
              message: "${cond.toDisplayString()}では出品できませんがよろしいですか？",
            );
            if (ret != OkCancelResult.ok) {
              return;
            }
          }

          _onSubmit(ref, form, ref.read(uuidProvider).v4(), item, image.state,
              isMajorCustomer);
          Navigator.of(context).popUntil((route) => route.settings.name == "/");
        }

        return builder(context, form.invalid ? null : _onSave);
      },
    );
  }

  bool _isRestricted(ItemCondition cond, ListingRestrictions restrictions) {
    if (cond == ItemCondition.newItem) {
      return restrictions.newItem;
    } else {
      return restrictions.used;
    }
  }

  void _onSubmit(
    WidgetRef ref,
    FormGroup form,
    String id,
    AsinData item,
    Uint8List? image,
    bool isMajorCustomer,
  ) {
    final purchase = getInt(form, purchasePriceField);
    final sell = getInt(form, sellPriceField);
    final useFba = getBool(form, useFbaField);

    final profit = calcProfit(
      sellPrice: sell,
      purchasePrice: purchase,
      fee: item.prices?.feeInfo,
      useFba: useFba,
      isMajorCustomer: isMajorCustomer,
    );
    final breakEven = calcBreakEven(
      purchase: purchase,
      useFba: useFba,
      isMajorCustomer: isMajorCustomer,
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
    ref.read(stockItemListControllerProvider.notifier).add(stock);
    ref.read(analyticsControllerProvider).logPurchaseEvent(stock);
  }
}
