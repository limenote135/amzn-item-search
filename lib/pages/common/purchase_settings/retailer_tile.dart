import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/pages/common/purchase_settings/values.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class RetailerTile extends HookConsumerWidget {
  const RetailerTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final retailers = ref.watch(
      generalSettingsControllerProvider.select((value) => value.retailers),
    );
    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: ReactiveTextField<dynamic>(
              formControlName: retailerField,
              decoration: const InputDecoration(labelText: "仕入れ先"),
              textAlign: TextAlign.start,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_drop_down),
            onPressed: () async {
              final form = ReactiveForm.of(context)! as FormGroup;
              final ret = await showConfirmationDialog(
                context: context,
                title: "仕入先の選択",
                initialSelectedActionKey: form.control(retailerField).value,
                actions: [
                  for (final retailer in retailers)
                    AlertDialogAction(key: retailer, label: retailer)
                ],
              );
              if (ret != null) {
                form.control(retailerField).value = ret;
              }
            },
          ),
        ],
      ),
    );
  }
}
