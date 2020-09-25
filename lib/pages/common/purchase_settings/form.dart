import 'package:amasearch/controllers/purchase_settings_controller.dart';
import 'package:amasearch/pages/common/purchase_settings/image_tile.dart';
import 'package:amasearch/util/util.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'fee_tile.dart';
import 'input_prices_tile.dart';
import 'input_purchase_amount_tile.dart';
import 'item_condition_tile.dart';
import 'profit_tile.dart';

class PurchaseSettingsForm extends HookWidget {
  const PurchaseSettingsForm({Key key, this.action}) : super(key: key);

  final Widget action;

  @override
  Widget build(BuildContext context) {
    final base = useProvider(currentPurchaseSettingsControllerProvider);
    final formKey = useProvider(base.state.select((value) => value.formKey));
    final useFba = useProvider(base.state.select((value) => value.useFba));
    final sku = useProvider(base.state.select((value) => value.sku));
    final memo = useProvider(base.state.select((value) => value.memo));

    return Form(
      key: formKey,
      onChanged: () {
        final form = Form.of(primaryFocus.context); //TODO: これでよいのか？
        if (form.validate()) {
          form.save();
        }
      },
      child: ListView(
        children: [
          const ImageTile(),
          const ThemeDivider(),
          const InputPricesTile(),
          SwitchListTile(
            value: useFba,
            title: const Text("FBA を利用する"),
            onChanged: (value) {
              unfocus();
              context.read(base).update(useFba: value);
            },
          ),
          const InputPurchaseAmoutTile(),
          const ProfitTile(),
          const FeeTile(),
          const ThemeDivider(),
          const ItemConditionTile(),
          ListTile(
            title: TextFormField(
              initialValue: sku, // TODO: 初期値検討
              keyboardType: TextInputType.url,
              decoration: const InputDecoration(labelText: "SKU"),
              textAlign: TextAlign.start,
              onSaved: (newValue) {
                if (newValue != sku) {
                  context.read(base).update(sku: newValue);
                }
              },
            ),
          ),
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
