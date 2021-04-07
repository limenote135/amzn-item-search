import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/pages/common/purchase_settings/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class RetailerTile extends StatelessWidget {
  const RetailerTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              final ret = await showDialog<String>(
                context: context,
                builder: (context) => const _RetailerSelectDialog(),
              );
              if (ret != null) {
                final form = ReactiveForm.of(context)! as FormGroup;
                form.control(retailerField).value = ret;
              }
            },
          ),
        ],
      ),
    );
  }
}

class _RetailerSelectDialog extends HookWidget {
  const _RetailerSelectDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final retailers = useProvider(generalSettingsControllerProvider
        .select((value) => value.retailers));
    return SimpleDialog(
      title: const Text("仕入れ先の選択"),
      children: [
        for (final retailer in retailers)
          SimpleDialogOption(
            onPressed: () => Navigator.pop(context, retailer),
            child: Text(retailer),
          ),
      ],
    );
  }
}
