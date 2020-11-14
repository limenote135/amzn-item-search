import 'dart:typed_data';

import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/controllers/purchase_settings_controller.dart';
import 'package:amasearch/models/item.dart';
import 'package:amasearch/pages/common/purchase_settings/image_tile.dart';
import 'package:amasearch/pages/common/purchase_settings/retailer_tile.dart';
import 'package:amasearch/pages/common/purchase_settings/sku_tile.dart';
import 'package:amasearch/pages/common/purchase_settings/target_price_tile.dart';
import 'package:amasearch/pages/search/common/seller_list_tile.dart';
import 'package:amasearch/util/price_util.dart';
import 'package:amasearch/util/sku_replacer.dart';
import 'package:amasearch/util/util.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:amasearch/widgets/with_underline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'fee_tile.dart';
import 'input_prices_tile.dart';
import 'input_purchase_amount_tile.dart';
import 'item_condition_tile.dart';
import 'profit_tile.dart';

class PurchaseSettingsForm extends HookWidget {
  const PurchaseSettingsForm({Key key, this.action, this.onComplete})
      : super(key: key);

  final Widget action;
  final void Function(ByteData bytes) onComplete;

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentAsinDataProvider);
    final base = useProvider(currentPurchaseSettingsControllerProvider);
    final settings = useProvider(base.state);

    final skuFormat = useProvider(generalSettingsControllerProvider.state
        .select((value) => value.skuFormat));

    final memo = useProvider(base.state.select((value) => value.memo));

    return Form(
      key: settings.formKey,
      onChanged: () {
        final form = Form.of(primaryFocus.context); //TODO: これでよいのか？
        // 仕入れ先をプルダウンで選択した際に、primaryFocus.context が選択ダイアログになるため null になりうる？
        if (form?.validate() ?? false) {
          form.save();
        }
      },
      child: ListView(
        children: [
          WithUnderLine(
            ImageTile(
              onComplete: onComplete,
            ),
          ),
          const SellerListTile(),
          const ThemeDivider(),
          const InputPricesTile(),
          SwitchListTile(
            value: settings.useFba,
            title: const Text("FBA を利用する"),
            onChanged: (value) {
              unfocus();
              final profit = calcProfit(
                  sellPrice: settings.sellPrice,
                  purchasePrice: settings.purchasePrice,
                  fee: item.prices.feeInfo,
                  useFba: value);
              final generatedSku = replaceSku(
                format: skuFormat,
                item: item,
                settings: settings,
                profit: profit,
              );
              context.read(base).update(
                    useFba: value,
                    profit: profit,
                    sku: generatedSku,
                  );
            },
          ),
          const InputPurchaseAmoutTile(),
          const ProfitTile(),
          const FeeTile(),
          const TargetPriceTile(),
          const ItemConditionTile(),
          const RetailerTile(),
          const ThemeDivider(),
          const SkuTile(),
          const ThemeDivider(),
          ListTile(
            title: TextFormField(
              maxLines: null,
              initialValue: memo, // TODO: 初期値検討
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(labelText: "メモ"),
              textAlign: TextAlign.start,
              onSaved: (newValue) {
                if (newValue != memo) {
                  context.read(base).update(memo: newValue);
                }
              },
            ),
          ),
          if (action != null) action,
        ],
      ),
    );
  }
}
