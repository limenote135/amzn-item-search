import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/controllers/purchase_settings_controller.dart';
import 'package:amasearch/models/item.dart';
import 'package:amasearch/util/sku_replacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SkuTile extends HookWidget {
  const SkuTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentAsinDataProvider);
    final base = useProvider(currentPurchaseSettingsControllerProvider);
    final settings = useProvider(base.state);

    final skuFormat = useProvider(generalSettingsControllerProvider.state
        .select((value) => value.skuFormat));

    return Column(
      children: [
        CheckboxListTile(
          value: settings.enableAutogenSku,
          title: const Text("SKU を自動生成"),
          controlAffinity: ListTileControlAffinity.leading,
          onChanged: (value) {
            if (value) {
              final generatedSku =
                  replaceSku(format: skuFormat, item: item, settings: settings);
              context.read(base).update(
                    enableAutogenSku: value,
                    sku: settings.sku != generatedSku
                        ? generatedSku
                        : settings.sku,
                  );
            } else {
              context.read(base).update(enableAutogenSku: value);
            }
          },
        ),
        ListTile(
          title: settings.enableAutogenSku
              ? _autogenSkuText(
                  context,
                  settings.sku != ""
                      ? settings.sku
                      : replaceSku(
                          format: skuFormat, item: item, settings: settings))
              : _manualSkuWidget(context, settings.sku),
        ),
      ],
    );
  }

  Widget _autogenSkuText(BuildContext context, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("SKU", style: Theme.of(context).textTheme.caption),
        Text(text),
      ],
    );
  }

  Widget _manualSkuWidget(BuildContext context, String text) {
    return TextFormField(
      initialValue: text,
      keyboardType: TextInputType.url,
      decoration: const InputDecoration(labelText: "SKU"),
      textAlign: TextAlign.start,
      onSaved: (newValue) {
        // if (newValue != settings.sku) {
        //   //context.read(base).update(sku: newValue);
        // }
      },
    );
  }
}
