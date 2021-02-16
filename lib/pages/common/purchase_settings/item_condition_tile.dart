import 'package:amasearch/models/enums/purchase_item_condition.dart';
import 'package:amasearch/pages/common/purchase_settings/values.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ItemConditionTile extends StatelessWidget {
  const ItemConditionTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          const Expanded(child: Text("商品状態")),
          Flexible(
            child: ReactiveDropdownField<PurchaseItemCondition>(
                formControlName: conditionField,
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
                ]),
          ),
        ],
      ),
    );
  }
}
