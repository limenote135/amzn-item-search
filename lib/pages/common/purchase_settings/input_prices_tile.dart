import 'package:amasearch/controllers/purchase_settings_controller.dart';
import 'package:amasearch/models/item.dart';
import 'package:amasearch/models/item_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InputPricesTile extends HookWidget {
  const InputPricesTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final base = useProvider(currentPurchaseSettingsControllerProvider);
    final purchasePrice =
        useProvider(base.state.select((value) => value.purchasePrice));
    final sellPrice =
        useProvider(base.state.select((value) => value.sellPrice));

    final item = useProvider(currentAsinDataProvider);
    // 仮で初期値を新品最安値、無ければ中古最安値にする
    final lowestPrice = _calcLowestPrice(item.prices);

    return ListTile(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                initialValue: purchasePrice > 0 ? "$purchasePrice" : "",
                // TODO: これでいいか確認
                keyboardType: const TextInputType.numberWithOptions(
                    signed: false, decimal: false),
                decoration:
                    const InputDecoration(labelText: "仕入れ値", suffixText: "円"),
                textAlign: TextAlign.end,
                validator: (value) {
                  final val = int.tryParse(value);
                  return val != null ? null : "不正な値です";
                },
                onSaved: (newValue) {
                  final price = int.tryParse(newValue);
                  if (price != null && purchasePrice != price) {
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                initialValue: "${sellPrice != 0 ? sellPrice : lowestPrice}",
                keyboardType: const TextInputType.numberWithOptions(
                    signed: false, decimal: false),
                decoration:
                    const InputDecoration(labelText: "販売価格", suffixText: "円"),
                textAlign: TextAlign.end,
                validator: (value) {
                  final val = int.tryParse(value);
                  return val != null ? null : "不正な値です";
                },
                onSaved: (newValue) {
                  final price = int.tryParse(newValue);
                  if (price != null && sellPrice != price) {
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

  int _calcLowestPrice(ItemPrices prices) {
    if (prices.newPrices != null && prices.newPrices.isNotEmpty) {
      return prices.newPrices.first.price;
    }
    if (prices.usedPrices != null && prices.usedPrices.isNotEmpty) {
      return prices.usedPrices.first.price;
    }
    return 0;
  }
}
