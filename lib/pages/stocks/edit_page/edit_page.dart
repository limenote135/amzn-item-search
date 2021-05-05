import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/controllers/stock_item_controller.dart';
import 'package:amasearch/models/enums/purchase_item_condition.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/pages/common/purchase_settings/form.dart';
import 'package:amasearch/pages/common/purchase_settings/values.dart';
import 'package:amasearch/util/price_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EditPage extends StatelessWidget {
  const EditPage({Key? key}) : super(key: key);
  static const routeName = "/stocks/edit";

  static Route<void> route(StockItem item) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => ProviderScope(
        overrides: [
          currentStockItemProvider.overrideWithValue(item),
        ],
        child: const EditPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("仕入れ内容の変更"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends HookWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentStockItemProvider);

    final isMajorCustomer = useProvider(generalSettingsControllerProvider
        .select((value) => value.isMajorCustomer));

    return ProviderScope(
      overrides: [
        currentAsinDataProvider.overrideWithValue(item.item), // 不要になってるかも？
      ],
      child: PurchaseSettingsForm(
        action: ReactiveFormConsumer(
          builder: (context, form, child) {
            return ElevatedButton(
              onPressed: form.invalid
                  ? null
                  : () => _onSubmit(
                        context,
                        form,
                        item,
                        isMajorCustomer: isMajorCustomer,
                      ),
              child: const Text("更新"),
            );
          },
        ),
      ),
    );
  }

  void _onSubmit(
    BuildContext context,
    FormGroup form,
    StockItem item, {
    required bool isMajorCustomer,
  }) {
    final purchase = getInt(form, purchasePriceField);
    final sell = getInt(form, sellPriceField);
    final useFba = getBool(form, useFbaField);

    final profit = calcProfit(
      sellPrice: sell,
      purchasePrice: purchase,
      fee: item.item.prices?.feeInfo,
      useFba: useFba,
      isMajorCustomer: isMajorCustomer,
    );
    final breakEven = calcBreakEven(
      purchase: purchase,
      useFba: useFba,
      isMajorCustomer: isMajorCustomer,
      feeInfo: item.item.prices?.feeInfo,
    );

    final newItem = item.copyWith(
      purchasePrice: purchase,
      sellPrice: sell,
      useFba: useFba,
      profitPerItem: profit,
      amount: getInt(form, quantityField),
      condition: getCondition(form).toItemCondition(),
      subCondition: getCondition(form).toItemSubCondition(),
      sku: getString(form, skuField),
      retailer: getString(form, retailerField),
      memo: getString(form, memoField),
      purchaseDate: getString(form, purchaseDateField),
      breakEven: breakEven,
    );
    context.read(stockItemListControllerProvider.notifier).update(newItem);
    Navigator.of(context).popUntil((route) => route.settings.name == "/");
  }
}
