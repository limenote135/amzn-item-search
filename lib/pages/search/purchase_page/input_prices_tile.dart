import 'package:ama_search/controllers/purchase_settings_controller.dart';
import 'package:ama_search/models/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InputPricesTile extends HookWidget {
  const InputPricesTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentAsinDataProvider);
    final base = purchaseSettingsControllerProvider(item.asin);
    final purchasePrice =
        useProvider(base.state.select((value) => value.purchasePrice));
    final sellPrice =
        useProvider(base.state.select((value) => value.sellPrice));

    return ListTile(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextFormField(
                autovalidate: true,
                initialValue: purchasePrice > 0 ? "$purchasePrice" : "",
                // TODO: これでいいか確認
                keyboardType: const TextInputType.numberWithOptions(
                    signed: false, decimal: false),
                decoration:
                    const InputDecoration(labelText: "仕入れ値", suffixText: "円"),
                textAlign: TextAlign.end,
                validator: (value) {
                  try {
                    int.parse(value);
                    return null;
                  } on Exception catch (_) {
                    return "不正な値です";
                  }
                },
                onSaved: (newValue) {
                  final price = int.parse(newValue);
                  if (purchasePrice != price) {
                    context.read(base).update(purchasePrice: price);
                  }
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextFormField(
                autovalidate: true,
                initialValue: "$sellPrice", // TODO: 適切な初期値
                keyboardType: const TextInputType.numberWithOptions(
                    signed: false, decimal: false),
                decoration:
                    const InputDecoration(labelText: "販売価格", suffixText: "円"),
                textAlign: TextAlign.end,
                validator: (value) {
                  try {
                    int.parse(value);
                    return null;
                  } on Exception catch (_) {
                    return "不正な値です";
                  }
                },
                onSaved: (newValue) {
                  final price = int.parse(newValue);
                  if (sellPrice != price) {
                    context.read(base).update(sellPrice: price);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
