import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/pages/common/purchase_settings/values.dart';
import 'package:amasearch/util/custom_validator.dart';
import 'package:amasearch/widgets/calculator.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class InputPricesTile extends HookConsumerWidget {
  const InputPricesTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentAsinDataProvider);
    final showCalc = useState(false);

    final purchasePriceFocus = useFocusNode();
    final purchasePriceController = useTextEditingController();
    purchasePriceFocus.addListener(() {
      final text = purchasePriceController.text;
      if (!purchasePriceFocus.hasFocus || text == "") {
        return;
      }
      purchasePriceController.value = purchasePriceController.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: 0, extentOffset: text.length),
      );
    });

    final sellPriceFocus = useFocusNode();
    final sellPriceController = useTextEditingController();
    sellPriceFocus.addListener(() {
      final text = sellPriceController.text;
      if (!sellPriceFocus.hasFocus || text == "") {
        return;
      }
      sellPriceController.value = sellPriceController.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: 0, extentOffset: text.length),
      );
    });

    final form = ReactiveForm.of(context)! as FormGroup;
    return ListTile(
      title: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ReactiveTextField<dynamic>(
                    formControlName: purchasePriceField,
                    controller: purchasePriceController,
                    focusNode: purchasePriceFocus,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "仕入価格",
                      suffixText: "円",
                    ),
                    textAlign: TextAlign.end,
                    validationMessages: {
                      validationMessagePositiveNumberOrEmpty: (_) => "不正な値です",
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ReactiveTextField<dynamic>(
                    formControlName: sellPriceField,
                    controller: sellPriceController,
                    focusNode: sellPriceFocus,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "販売価格",
                      suffixText: "円",
                    ),
                    textAlign: TextAlign.end,
                    validationMessages: {
                      ValidationMessage.required: (_) => "販売価格は必須です",
                      ValidationMessage.number: (_) => "不正な価格です",
                      ValidationMessage.min: (_) => "不正な価格です"
                    },
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.calculate_outlined),
                onPressed: () {
                  showCalc.value = !showCalc.value;
                },
              ),
            ],
          ),
          if (showCalc.value)
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Calculator(
                    asin: item.asin,
                    firstButtonText: "仕入価格へ",
                    secondButtonText: "販売価格へ",
                    onFirstButtonPushed: (val) {
                      form.control(purchasePriceField)
                        ..updateValue("${val.toInt()}")
                        ..markAsTouched();
                    },
                    onSecondButtonPushed: (val) {
                      form.control(sellPriceField)
                        ..updateValue(val.toInt())
                        ..markAsTouched();
                    },
                  ),
                ),
                const ThemeDivider(),
              ],
            ),
        ],
      ),
    );
  }
}
