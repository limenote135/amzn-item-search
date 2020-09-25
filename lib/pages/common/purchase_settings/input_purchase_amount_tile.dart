import 'package:amasearch/controllers/purchase_settings_controller.dart';
import 'package:amasearch/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

class InputPurchaseAmoutTile extends HookWidget {
  const InputPurchaseAmoutTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final base = useProvider(currentPurchaseSettingsControllerProvider);
    final amount = useProvider(base.state.select((value) => value.amount));

    return ListTile(
      title: Row(
        children: [
          const Text("個数"),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: () {
              unfocus();
              if (amount > 1) {
                context.read(base).update(amount: amount - 1);
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text("$amount"),
          ),
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () {
              unfocus();
              context.read(base).update(amount: amount + 1);
            },
          )
        ],
      ),
    );
  }
}
