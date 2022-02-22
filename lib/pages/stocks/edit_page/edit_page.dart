import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/controllers/stock_item_controller.dart';
import 'package:amasearch/models/enums/purchase_item_condition.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/pages/common/purchase_settings/form.dart';
import 'package:amasearch/pages/common/purchase_settings/values.dart';
import 'package:amasearch/util/price_util.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EditPage extends HookConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentStockItemProvider);
    final form = ref.watch(formValueProvider(item));

    return ReactiveForm(
      formGroup: form,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("仕入れ内容の変更"),
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
                    child: const Text("更新"),
                  );
                },
              ),
            ),
          ],
        ),
        body: const _Body(),
      ),
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentStockItemProvider);

    return ProviderScope(
      overrides: [
        currentAsinDataProvider.overrideWithValue(item.item),
      ],
      child: PurchaseSettingsForm(
        action: _SaveButton(
          builder: (context, onSave) {
            return ElevatedButton(
              onPressed: onSave,
              child: const Text("更新"),
            );
          },
        ),
      ),
    );
  }
}

class _SaveButton extends HookConsumerWidget {
  const _SaveButton({Key? key, required this.builder}) : super(key: key);

  final Widget Function(BuildContext context, void Function()? onSave) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentStockItemProvider);
    final isMajorCustomer = ref.watch(
      generalSettingsControllerProvider
          .select((value) => value.isMajorCustomer),
    );

    return ReactiveFormConsumer(
      builder: (context, form, child) {
        return Consumer(
          builder: (context, watch, child) {
            final onSave = form.invalid
                ? null
                : () => _onSubmit(
                      context,
                      ref,
                      form,
                      item,
                      isMajorCustomer: isMajorCustomer,
                    );
            return builder(context, onSave);
          },
        );
      },
    );
  }

  void _onSubmit(
    BuildContext context,
    WidgetRef ref,
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
    ref.read(stockItemListControllerProvider.notifier).update(newItem);
    Navigator.of(context).popUntil((route) => route.settings.name == "/");
  }
}
