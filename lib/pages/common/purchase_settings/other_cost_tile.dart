import 'package:amasearch/pages/common/purchase_settings/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class OtherCostTile extends HookConsumerWidget {
  const OtherCostTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final focus = useFocusNode();
    focus.addListener(() {
      final text = controller.text;
      if (!focus.hasFocus || text == "") {
        return;
      }
      controller.value = controller.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: 0, extentOffset: text.length),
      );
    });
    return ListTile(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("その他費用"),
          const Spacer(),
          Expanded(
            child: ReactiveTextField<void>(
              formControlName: otherCostField,
              controller: controller,
              focusNode: focus,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(suffixText: "円"),
              textAlign: TextAlign.end,
              validationMessages: {
                ValidationMessage.required: (_) => "その他費用は必須です",
                ValidationMessage.number: (_) => "不正な価格です",
                ValidationMessage.min: (_) => "不正な価格です"
              },
            ),
          ),
        ],
      ),
    );
  }
}
