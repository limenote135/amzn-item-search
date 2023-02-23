import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/controllers/keep_state_controller.dart';
import 'package:amasearch/controllers/search_settings_controller.dart';
import 'package:amasearch/controllers/stock_item_controller.dart';
import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/models/enums/item_condition.dart';
import 'package:amasearch/models/enums/item_sub_condition.dart';
import 'package:amasearch/models/enums/purchase_item_condition.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/pages/common/purchase_settings/form.dart';
import 'package:amasearch/pages/common/purchase_settings/values.dart';
import 'package:amasearch/util/price_util.dart';
import 'package:amasearch/util/util.dart';
import 'package:amasearch/util/uuid.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

final currentKeepItemKeyProvider =
    Provider<String>((_) => throw UnimplementedError());
final _currentMemoProvider = Provider((_) => "");

class PurchasePage extends HookConsumerWidget {
  const PurchasePage({super.key});
  static const routeName = "/search/purchase";

  static Route<void> route(
    AsinData item, {
    String memo = "",
    String keepItemKey = "",
  }) {
    return MaterialPageRoute(
      settings:
          const RouteSettings(name: routeName, arguments: <String, String>{}),
      builder: (context) => ProviderScope(
        overrides: [
          currentAsinDataProvider.overrideWithValue(item),
          _currentMemoProvider.overrideWithValue(memo),
          currentKeepItemKeyProvider.overrideWithValue(keepItemKey),
        ],
        child: const PurchasePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentAsinDataProvider);
    final initialMemo = ref.watch(_currentMemoProvider);

    final conditionTexts = ref.watch(
      generalSettingsControllerProvider
          .select((value) => value.newConditionTexts),
    );
    final conditionIndex = ref.watch(
      generalSettingsControllerProvider
          .select((value) => value.newConditionTextIndex),
    );

    final useFba = ref.watch(
      searchSettingsControllerProvider.select((value) => value.useFba),
    );

    // 仮で初期値を新品最安値にする
    var lowestPrice = getLowestPrice(
      item.prices,
      condition: ItemSubCondition.newItem,
      priorFba: useFba,
    );
    // 新品最安値が無い場合、中古 VeryGood にする
    lowestPrice ??= getLowestPrice(
      item.prices,
      condition: ItemSubCondition.veryGood,
      priorFba: useFba,
    );
    // 中古 VeryGood も無い場合、中古最安値にする
    lowestPrice ??= item.prices?.usedPrices.firstOrNull?.price;

    final stock = StockItem(
      purchaseDate: currentTimeString(),
      sellPrice: lowestPrice ?? 0,
      useFba: useFba,
      autogenSku: true,
      item: item,
      memo: initialMemo,
      conditionText: conditionTexts[conditionIndex],
      id: ref.read(uuidProvider).v4(), // たぶん空文字でも問題ない
    );
    final form = ref.watch(formValueProvider(stock));
    return ProviderScope(
      overrides: [
        currentStockItemProvider.overrideWithValue(stock),
      ],
      child: ReactiveForm(
        formGroup: form,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("仕入れ設定"),
          ),
          body: const _Body(),
        ),
      ),
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PurchaseSettingsForm(
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
  const _SaveButton({required this.builder});

  final Widget Function(BuildContext context, void Function()? onSave) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentAsinDataProvider);
    final keepItemKey = ref.watch(currentKeepItemKeyProvider);

    return ReactiveFormConsumer(
      builder: (context, form, child) {
        Future<void> onSave() async {
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

          _onSubmit(
            ref,
            form,
            ref.read(uuidProvider).v4(),
            item,
          );
          if (keepItemKey != "") {
            ref
                .read(keepStateControllerProvider.notifier)
                .setAsComplete(keepItemKey);
          }
          Navigator.of(context).popUntil((route) => route.settings.name == "/");
        }

        return builder(context, form.invalid ? null : onSave);
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
  ) {
    final purchase = getInt(form, purchasePriceField);
    final sell = getInt(form, sellPriceField);
    final useFba = getBool(form, useFbaField);
    final otherCost = getInt(form, otherCostField);

    final profit = calcProfit(
      sellPrice: sell,
      purchasePrice: purchase,
      fee: item.prices?.feeInfo,
      useFba: useFba,
      otherCost: otherCost,
    );
    final breakEven = calcBreakEven(
      purchase: purchase,
      useFba: useFba,
      feeInfo: item.prices?.feeInfo,
      otherCost: otherCost,
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
      item: item,
      purchaseDate: getString(form, purchaseDateField),
      retailer: getString(form, retailerField),
      breakEven: breakEven,
      conditionText: getString(form, conditionTextField),
      otherCost: getInt(form, otherCostField),
      images: getImages(form),
    );
    ref.read(stockItemListControllerProvider.notifier).add(stock);
    ref.read(analyticsControllerProvider).logPurchaseEvent(stock);
  }
}
