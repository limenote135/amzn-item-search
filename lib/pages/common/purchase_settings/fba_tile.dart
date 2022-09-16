import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/models/enums/purchase_item_condition.dart';
import 'package:amasearch/pages/common/purchase_settings/reactive_switch_list_tile.dart';
import 'package:amasearch/util/price_util.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'values.dart';

class FbaTile extends ConsumerWidget {
  const FbaTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentAsinDataProvider);
    final form = ReactiveForm.of(context)!;
    // build 時に現在の値を束縛しておく
    final current = getBool(form, useFbaField);

    return MyReactiveSwitchListTile(
      formControlName: useFbaField,
      title: const Text("FBA を利用"),
      onChanged: (value) {
        // onChanged が呼ばれたタイミングではリビルド前なので、
        // current は変更前の値が束縛されたままになっている

        final sellPrice = getInt(form, sellPriceField);
        final condition = getCondition(form);
        final currentLowestPrice = getLowestPrice(
          item.prices,
          condition: condition.toItemSubCondition(),
          priorFba: current,
        );
        if (sellPrice == currentLowestPrice) {
          // 販売価格が手動で変更されていないので、FBA利用に合わせて新しい値に変更する
          final newPrice = getLowestPrice(
            item.prices,
            condition: condition.toItemSubCondition(),
            priorFba: value,
          );
          if (newPrice != null) {
            (form as FormGroup).control(sellPriceField).value = newPrice;
          }
        }
      },
    );
  }
}
