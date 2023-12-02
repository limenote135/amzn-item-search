import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/pages/common/purchase_settings/values.dart';
import 'package:amasearch/util/price_util.dart';
import 'package:amasearch/util/sku_replacer.dart';
import 'package:amasearch/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SkuTile extends HookConsumerWidget {
  const SkuTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentAsinDataProvider);
    final skuFormat = ref.watch(
      generalSettingsControllerProvider.select((value) => value.skuFormat),
    );
    return Column(
      children: [
        ReactiveCheckboxListTile(
          formControlName: autogenSkuField,
          controlAffinity: ListTileControlAffinity.leading,
          title: const Text("SKU を自動生成"),
        ),
        ListTile(
          title: ReactiveValueListenableBuilder<bool>(
            formControlName: autogenSkuField,
            builder: (context, control, child) {
              if (control.value!) {
                final form = ReactiveForm.of(context)! as FormGroup;
                form.control(skuField).value = _generateSku(
                  skuFormat,
                  item,
                  form,
                );
              }
              return ReactiveTextField<dynamic>(
                readOnly: control.value!,
                formControlName: skuField,
                keyboardType: TextInputType.url,
                decoration: const InputDecoration(labelText: "SKU"),
                validationMessages: {
                  ValidationMessage.maxLength: (_) => "最大文字数を超えています",
                },
                onTapOutside: onTapOutside,
              );
            },
          ),
        ),
      ],
    );
  }

  String _generateSku(
    String format,
    AsinData item,
    FormGroup form,
  ) {
    final purchase = getInt(form, purchasePriceField);
    final sell = getInt(form, sellPriceField);
    final cond = getCondition(form);
    final quantity = getInt(form, quantityField);
    final useFba = getBool(form, useFbaField);
    final purchaseDate = getPurchaseDate(form);
    final otherCost = getInt(form, otherCostField);
    final smallProgram = getBool(form, smallProgramField);
    final smallFee = item.smallFee;

    var feeInfo = item.prices?.feeInfo;
    if (smallProgram && feeInfo != null) {
      feeInfo = feeInfo.copyWith(fbaFee: smallFee);
    }

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
      otherCost: otherCost,
      category: item.category,
    );

    return replaceSku(
      format: format,
      item: item,
      purchase: purchase,
      sell: sell,
      cond: cond,
      profit: profit,
      quantity: quantity,
      useFba: useFba,
      date: purchaseDate,
      breakEven: breakEven,
    );
  }
}
