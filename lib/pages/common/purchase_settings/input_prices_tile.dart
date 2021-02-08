import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/controllers/purchase_settings_controller.dart';
import 'package:amasearch/models/item.dart';
import 'package:amasearch/models/item_price.dart';
import 'package:amasearch/util/price_util.dart';
import 'package:amasearch/util/sku_replacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InputPricesTile extends HookWidget {
  const InputPricesTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final base = useProvider(currentPurchaseSettingsControllerProvider);
    final settings = useProvider(base.state);
    final skuFormat = useProvider(generalSettingsControllerProvider.state
        .select((value) => value.skuFormat));

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
                initialValue: settings.purchasePrice > 0
                    ? "${settings.purchasePrice}"
                    : "",
                // TODO: これでいいか確認
                keyboardType: const TextInputType.numberWithOptions(
                    signed: false, decimal: false),
                decoration:
                    const InputDecoration(labelText: "仕入れ値", suffixText: "円"),
                textAlign: TextAlign.end,
                validator: (value) {
                  if (value == "") {
                    return null;
                  }
                  final val = int.tryParse(value);
                  return val != null ? null : "不正な値です";
                },
                onSaved: (newValue) {
                  final price = int.tryParse(newValue);
                  if (price != null && settings.purchasePrice != price) {
                    final profit = calcProfit(
                        sellPrice: settings.sellPrice,
                        purchasePrice: price,
                        fee: item.prices.feeInfo,
                        useFba: settings.useFba);
                    final generatedSku = replaceSku(
                      format: skuFormat,
                      item: item,
                      settings: settings,
                      purchase: price,
                      profit: profit,
                    );
                    context.read(base).update(
                          purchasePrice: price,
                          profit: profit,
                          sku: generatedSku,
                        );
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
                initialValue: settings.sellPrice != 0
                    ? "${settings.sellPrice}"
                    : "$lowestPrice",
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
                  if (price != null && settings.sellPrice != price) {
                    final profit = calcProfit(
                        sellPrice: price,
                        purchasePrice: settings.purchasePrice,
                        fee: item.prices.feeInfo,
                        useFba: settings.useFba);
                    final generatedSku = replaceSku(
                      format: skuFormat,
                      item: item,
                      settings: settings,
                      sell: price,
                      profit: profit,
                    );
                    context.read(base).update(
                          sellPrice: price,
                          profit: profit,
                          sku: generatedSku,
                        );
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
