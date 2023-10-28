import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:amasearch/util/price_util.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'values.dart';

class BreakEvenTile extends ConsumerWidget {
  const BreakEvenTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentAsinDataProvider);

    final form = ReactiveForm.of(context)!;
    final useFba = getBool(form, useFbaField);
    final purchasePrice = getInt(form, purchasePriceField);
    final otherCost = getInt(form, otherCostField);

    final breakEven = calcBreakEven(
      purchase: purchasePrice,
      useFba: useFba,
      feeInfo: item.prices?.feeInfo,
      otherCost: otherCost,
      category: item.category,
    );

    return ListTile(
      title: Row(
        children: [
          const Text("損益分岐販売価格"),
          const Spacer(),
          Text("${numberFormatter.format(breakEven)} 円"),
        ],
      ),
    );
  }
}
