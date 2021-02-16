import 'package:amasearch/pages/common/purchase_settings/values.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'custom_validator.dart';

class InputPricesTile extends StatelessWidget {
  const InputPricesTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ReactiveTextField(
                formControlName: purchasePriceField,
                keyboardType: const TextInputType.numberWithOptions(
                    signed: false, decimal: false),
                decoration:
                    const InputDecoration(labelText: "仕入れ値", suffixText: "円"),
                textAlign: TextAlign.end,
                validationMessages: (control) => {
                  validationMessagePositiveNumberOrEmpty: "不正な値です",
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ReactiveTextField(
                formControlName: sellPriceField,
                keyboardType: const TextInputType.numberWithOptions(
                    signed: false, decimal: false),
                decoration:
                    const InputDecoration(labelText: "販売価格", suffixText: "円"),
                textAlign: TextAlign.end,
                validationMessages: (control) => {
                  ValidationMessage.required: "販売価格は必須です",
                  ValidationMessage.number: "不正な価格です",
                  ValidationMessage.min: "不正な価格です"
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
