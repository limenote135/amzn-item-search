import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/enums/csv_columns.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PurchaseListPage extends StatelessWidget {
  const PurchaseListPage({Key? key}) : super(key: key);
  static const String routeName = "/settings/purchase_list";

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const PurchaseListPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CSV設定"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends HookWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = useProvider(generalSettingsControllerProvider);
    void _onReorder(int oldIndex, int newIndexRaw) {
      var newIndex = newIndexRaw;
      if (oldIndex < newIndex) {
        // 移動前のインデックスより移動後のインデックスが大きい場合、アイテムの長さがリストの保有数よりも1大きくなってしまうため、
        // newIndexから1引きます。
        // 例えば、上の画像のように1番目のアイテムを3番目に移動した場合、oldIndex = 0, newIndex = 3となります。
        // newIndexを1引いて2とします。
        newIndex -= 1;
      }
      final item = settings.csvOrder[oldIndex];
      final cp = settings.csvOrder.toList()
        ..removeAt(oldIndex)
        ..insert(newIndex, item);
      context
          .read(generalSettingsControllerProvider.notifier)
          .update(csvOrder: cp);
    }

    return Column(
      children: [
        ListTile(
          title: Text(
            "仕入れ商品リストをPCに送った際の並び順を変更できます。変更したい項目を長押ししてください。",
            style: Theme.of(context).textTheme.caption,
          ),
        ),
        const ThemeDivider(),
        Expanded(
          child: ReorderableListView(
            onReorder: _onReorder,
            children: [
              for (final item in settings.csvOrder)
                ListTile(
                  title: Text(item.toDisplayString()),
                  key: ValueKey(item),
                  trailing: const Icon(Icons.menu),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
