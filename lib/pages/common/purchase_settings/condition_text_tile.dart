import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/enums/purchase_item_condition.dart';
import 'package:amasearch/pages/common/purchase_settings/values.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ConditionTextTile extends ConsumerWidget {
  const ConditionTextTile({Key? key}) : super(key: key);

  static const _textMaxHeight = 160.0;
  static const _maxTextLengthInDialog = 128;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(generalSettingsControllerProvider);
    final smallText = Theme.of(context).textTheme.bodyText2;

    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: _textMaxHeight),
              child: ReactiveTextField<dynamic>(
                formControlName: conditionTextField,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(labelText: "コンディション説明"),
                style: smallText,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_drop_down),
            onPressed: () async {
              final form = ReactiveForm.of(context)! as FormGroup;
              final condition = getCondition(form);
              final texts = condition == PurchaseItemCondition.newItem
                  ? settings.newConditionTexts
                  : settings.usedConditionTexts;
              final ret = await showConfirmationDialog(
                context: context,
                title: "コンディション説明",
                initialSelectedActionKey:
                    form.control(conditionTextField).value,
                actions: [
                  for (final text in texts)
                    AlertDialogAction(
                      key: text,
                      label: text.length > _maxTextLengthInDialog
                          ? "${text.substring(0, _maxTextLengthInDialog)}..."
                          : text,
                    )
                ],
              );
              if (ret != null) {
                form.control(conditionTextField).value = ret;
              }
            },
          ),
        ],
      ),
    );
  }
}
