import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/pages/common/purchase_settings/values.dart';
import 'package:amasearch/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'form.dart';

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
                form.control(skuField).value = generateSku(
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
}
