import 'package:amasearch/pages/common/purchase_settings/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:reactive_forms/reactive_forms.dart';

class QuantityTile extends HookWidget {
  const QuantityTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final form = ReactiveForm.of(context)! as FormGroup;
    final current = getInt(form, quantityField);

    final quantityFocusNode = useFocusNode();
    final quantityController = useTextEditingController();
    quantityFocusNode.addListener(() {
      final text = quantityController.text;
      if (!quantityFocusNode.hasFocus || text == "") {
        return;
      }
      quantityController.value = quantityController.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: 0, extentOffset: text.length),
      );
    });

    return ListTile(
      title: Row(
        children: [
          const Expanded(child: Text("個数")),
          Expanded(
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: current <= 1
                      ? null
                      : () {
                          form.control(quantityField)
                            ..updateValue(getInt(form, quantityField) - 1)
                            ..markAllAsTouched();
                        },
                ),
                Flexible(
                  child: ReactiveTextField<dynamic>(
                    formControlName: quantityField,
                    controller: quantityController,
                    focusNode: quantityFocusNode,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    validationMessages: {
                      ValidationMessage.required: (_) => "不正な値",
                      ValidationMessage.number: (_) => "不正な値",
                      ValidationMessage.min: (_) => "不正な値"
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    form.control(quantityField)
                      ..updateValue(getInt(form, quantityField) + 1)
                      ..markAllAsTouched();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
