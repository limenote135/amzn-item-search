import 'package:amasearch/models/enums/purchase_item_condition.dart';
import 'package:amasearch/pages/common/purchase_settings/values.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ItemConditionTile extends StatelessWidget {
  const ItemConditionTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          const Expanded(child: Text("商品状態")),
          Flexible(
            flex: 2,
            child: ReactiveDropdownField<PurchaseItemCondition>(
              formControlName: conditionField,
              items: const [
                DropdownMenuItem(
                  value: PurchaseItemCondition.newItem,
                  child: Text("新品"),
                ),
                DropdownMenuItem(
                  value: PurchaseItemCondition.usedMint,
                  child: Text("中古(ほぼ新品)"),
                ),
                DropdownMenuItem(
                  value: PurchaseItemCondition.usedVeryGood,
                  child: Text("中古(非常に良い)"),
                ),
                DropdownMenuItem(
                  value: PurchaseItemCondition.usedGood,
                  child: Text("中古(良い)"),
                ),
                DropdownMenuItem(
                  value: PurchaseItemCondition.usedAcceptable,
                  child: Text("中古(可)"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
