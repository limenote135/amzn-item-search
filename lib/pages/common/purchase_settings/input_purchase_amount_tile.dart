import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/controllers/purchase_settings_controller.dart';
import 'package:amasearch/models/item.dart';
import 'package:amasearch/util/sku_replacer.dart';
import 'package:amasearch/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InputPurchaseAmoutTile extends HookWidget {
  const InputPurchaseAmoutTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentAsinDataProvider);
    final base = useProvider(currentPurchaseSettingsControllerProvider);
    final settings = useProvider(base.state);
    final skuFormat = useProvider(generalSettingsControllerProvider.state
        .select((value) => value.skuFormat));

    return ListTile(
      title: Row(
        children: [
          const Text("個数"),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: () {
              unfocus();
              if (settings.amount > 1) {
                final generatedSku = replaceSku(
                  format: skuFormat,
                  item: item,
                  settings: settings,
                  quantity: settings.amount - 1,
                );
                context.read(base).update(
                      amount: settings.amount - 1,
                      sku: generatedSku,
                    );
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text("${settings.amount}"),
          ),
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () {
              unfocus();
              final generatedSku = replaceSku(
                format: skuFormat,
                item: item,
                settings: settings,
                quantity: settings.amount + 1,
              );
              context.read(base).update(
                    amount: settings.amount + 1,
                    sku: generatedSku,
                  );
            },
          )
        ],
      ),
    );
  }
}
