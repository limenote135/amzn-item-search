import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/controllers/purchase_settings_controller.dart';
import 'package:amasearch/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RetailerTile extends HookWidget {
  const RetailerTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final base = useProvider(currentPurchaseSettingsControllerProvider);
    final retailer = useProvider(base.state.select((value) => value.retailer));

    final controller = useTextEditingController(text: retailer);
    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: const InputDecoration(labelText: "仕入れ先"),
              textAlign: TextAlign.start,
              onSaved: (newValue) {
                print(newValue);
              },
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
                controller.text = ret;
                context.read(base).update(retailer: ret);
                unfocus();
              }
            },
          )
        ],
      ),
    );
  }
}

class _RetailerSelectDialog extends HookWidget {
  const _RetailerSelectDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final retailers = useProvider(generalSettingsControllerProvider.state
        .select((value) => value.retailers));
    return SimpleDialog(
      title: const Text("仕入れ先の選択"),
      children: [
        for (final retailer in retailers)
          SimpleDialogOption(
            child: Text(retailer),
            onPressed: () => Navigator.pop(context, retailer),
          ),
      ],
    );
  }
}
