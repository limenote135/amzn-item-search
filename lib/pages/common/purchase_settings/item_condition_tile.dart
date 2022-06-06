import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/enums/item_sub_condition.dart';
import 'package:amasearch/models/enums/purchase_item_condition.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/pages/common/purchase_settings/values.dart';
import 'package:amasearch/util/price_util.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ItemConditionTile extends HookConsumerWidget {
  const ItemConditionTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentAsinDataProvider);
    final settings = ref.watch(generalSettingsControllerProvider);
    final form = ReactiveForm.of(context)!;
    // build 時に現在の値を束縛しておく
    final current = getCondition(form);

    return ListTile(
      title: Row(
        children: [
          const Expanded(child: Text("商品状態")),
          Flexible(
            flex: 2,
            child: ReactiveDropdownField<PurchaseItemCondition>(
              onChanged: (value) {
                if (value == null) {
                  return;
                }
                // onChanged が呼ばれたタイミングではリビルド前なので、
                // current は変更前の値が束縛されたままになっている

                // 販売価格の変更
                final sellPrice = getInt(form, sellPriceField);
                final useFba = getBool(form, useFbaField);

                var condition = current.toItemSubCondition();
                if (current == PurchaseItemCondition.newItem &&
                    (item.prices?.newPrices.isEmpty ?? true)) {
                  // 新品出品無しで、新品から中古の変える場合
                  // 新品出品が無い場合は初期では中古の最安値になっているはず
                  condition = ItemSubCondition.acceptable;
                } else if (value == PurchaseItemCondition.newItem &&
                    (item.prices?.usedPrices.isEmpty ?? true)) {
                  // 中古出品が無しで、新品にコンディションを買える場合
                  condition = ItemSubCondition.newItem;
                }
                final currentLowestPrice = getLowestPrice(
                  item.prices,
                  condition: condition,
                  priorFba: useFba,
                );

                if (sellPrice == currentLowestPrice) {
                  // 販売価格が手動で変更されていないので、コンディションに合わせて新しい値に変更する
                  final newPrice = getLowestPrice(
                    item.prices,
                    condition: value.toItemSubCondition(),
                    priorFba: useFba,
                  );
                  if (newPrice != null) {
                    (form as FormGroup).control(sellPriceField).value =
                        newPrice;
                  }
                }

                // コンディション説明の変更
                if (current == PurchaseItemCondition.newItem) {
                  // 新品からそれ以外に変更した場合
                  (form as FormGroup).control(conditionTextField).value =
                      settings
                          .usedConditionTexts[settings.usedConditionTextIndex];
                } else if (value == PurchaseItemCondition.newItem) {
                  // 中古から新品に変更した場合
                  (form as FormGroup).control(conditionTextField).value =
                      settings
                          .newConditionTexts[settings.newConditionTextIndex];
                }
              },
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
