import 'package:amasearch/controllers/purchase_settings_controller.dart';
import 'package:amasearch/models/enums/purchase_item_condition.dart';
import 'package:amasearch/models/item.dart';
import 'package:amasearch/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ItemConditionTile extends HookWidget {
  const ItemConditionTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentAsinDataProvider);
    final base = purchaseSettingsControllerProvider(item.asin);
    final itemCondition =
        useProvider(base.state.select((value) => value.condition));

    return ListTile(
      title: Row(
        children: [
          const Text("商品状態"),
          const Spacer(),
          DropdownButton<PurchaseItemCondition>(
            value: itemCondition,
            items: const [
              DropdownMenuItem(
                child: Text("新品"),
                value: PurchaseItemCondition.newItem,
              ),
              DropdownMenuItem(
                child: Text("中古(ほぼ新品)"),
                value: PurchaseItemCondition.usedMint,
              ),
              DropdownMenuItem(
                child: Text("中古(非常に良い)"),
                value: PurchaseItemCondition.usedVeryGood,
              ),
              DropdownMenuItem(
                child: Text("中古(良い)"),
                value: PurchaseItemCondition.usedGood,
              ),
              DropdownMenuItem(
                child: Text("中古(可)"),
                value: PurchaseItemCondition.usedAcceptable,
              ),
            ],
            onChanged: (value) {
              unfocus();
              if (itemCondition != value) {
                context.read(base).update(condition: value);
              }
            },
          ),
        ],
      ),
    );
  }
}
