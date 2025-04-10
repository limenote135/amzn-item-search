import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/controllers/stock_item_controller.dart';
import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/models/enums/purchase_item_condition.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/pages/common/purchase_settings/form.dart';
import 'package:amasearch/pages/common/purchase_settings/values.dart';
import 'package:amasearch/util/price_util.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EditPage extends HookConsumerWidget {
  const EditPage({super.key});

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
        ),
        body: const _Body(),
      ),
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body();

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
            return ListTile(
              title: ElevatedButton(
                onPressed: onSave,
                child: const Text("更新"),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _SaveButton extends HookConsumerWidget {
  const _SaveButton({required this.builder});

  final Widget Function(BuildContext context, void Function()? onSave) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentStockItemProvider);

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
                    );
            return builder(context, onSave);
          },
        );
      },
    );
  }

  Future<void> _onSubmit(
    BuildContext context,
    WidgetRef ref,
    FormGroup form,
    StockItem item,
  ) async {
    final purchase = getInt(form, purchasePriceField);
    final sell = getInt(form, sellPriceField);
    final useFba = getBool(form, useFbaField);
    final otherCost = getInt(form, otherCostField);
    final skuFormat = ref.read(
      generalSettingsControllerProvider.select(
        (v) => v.skuFormat,
      ),
    );

    final isAutogenSku = getBool(form, autogenSkuField);
    var sku = getString(form, skuField);
    if (isAutogenSku) {
      sku = generateSku(
        skuFormat,
        item.item,
        form,
      );
    }

    final hasSameSku = ref.read(
      stockItemListControllerProvider
          .select((value) => value.any((e) => e.sku == sku && e.id != item.id)),
    );
    if (hasSameSku) {
      final ret = await showOkCancelAlertDialog(
        context: context,
        title: "SKUの重複",
        message: "SKU: $sku は既に存在するため出品できませんがよろしいですか？",
      );
      if (ret != OkCancelResult.ok) {
        return;
      }
    }

    if (sku.isEmpty) {
      final ret = await showOkCancelAlertDialog(
        context: context,
        title: "SKU未入力",
        message: "SKUが未入力ですがよろしいですか？",
      );
      if (ret != OkCancelResult.ok) {
        return;
      }
    }

    final feeInfo = item.item.prices?.feeInfo;
    final profit = calcProfit(
      sellPrice: sell,
      purchasePrice: purchase,
      fee: feeInfo,
      useFba: useFba,
      otherCost: otherCost,
    );
    final breakEven = calcBreakEven(
      purchase: purchase,
      useFba: useFba,
      feeInfo: feeInfo,
      otherCost: item.otherCost,
      category: item.item.category,
    );

    final newItem = item.copyWith(
      purchasePrice: purchase,
      sellPrice: sell,
      useFba: useFba,
      profitPerItem: profit,
      amount: getInt(form, quantityField),
      condition: getCondition(form).toItemCondition(),
      subCondition: getCondition(form).toItemSubCondition(),
      sku: sku,
      retailer: getString(form, retailerField),
      memo: getString(form, memoField),
      purchaseDate: getString(form, purchaseDateField),
      breakEven: breakEven,
      conditionText: getString(form, conditionTextField),
      otherCost: getInt(form, otherCostField),
      images: getImages(form),
      listingDate: getListingDateString(form),
    );
    await ref.read(stockItemListControllerProvider.notifier).update(newItem);
    Navigator.of(context).popUntil((route) => route.settings.name == "/");
  }
}
