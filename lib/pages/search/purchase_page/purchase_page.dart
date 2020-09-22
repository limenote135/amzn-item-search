import 'package:amasearch/controllers/purchase_settings_controller.dart';
import 'package:amasearch/models/item.dart';
import 'package:amasearch/pages/search/purchase_page/fee_tile.dart';
import 'package:amasearch/pages/search/purchase_page/input_prices_tile.dart';
import 'package:amasearch/pages/search/purchase_page/input_purchase_amount_tile.dart';
import 'package:amasearch/pages/search/purchase_page/item_condition_tile.dart';
import 'package:amasearch/pages/search/purchase_page/profit_tile.dart';
import 'package:amasearch/util/util.dart';
import 'package:amasearch/widgets/item_image.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

class PurchasePage extends StatelessWidget {
  const PurchasePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("仕入れ設定"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends HookWidget {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentAsinDataProvider);
    final base = purchaseSettingsControllerProvider(item.asin);
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
          const _TitleTile(),
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
              initialValue: "", // TODO: 初期値検討
              keyboardType: TextInputType.url,
              decoration: const InputDecoration(labelText: "SKU"),
              textAlign: TextAlign.start,
              onSaved: (newValue) {
                if (newValue != sku) {
                  context.read(base).update(sku: sku);
                }
              },
            ),
          ),
          ListTile(
            title: TextFormField(
              maxLines: null,
              initialValue: "", // TODO: 初期値検討
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
          RaisedButton(
            child: const Text("仕入れる"),
            onPressed: () {
              if (formKey.currentState.validate()) {
                // TODO: 仕入れ処理
                print("purchase");
              }
            },
          )
        ],
      ),
    );
  }
}

class _TitleTile extends HookWidget {
  const _TitleTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentAsinDataProvider);
    return ListTile(
      leading: ItemImage(
        url: item.imageUrl,
        data: item.imageData,
      ),
      title: Text(item.title),
    );
  }
}
