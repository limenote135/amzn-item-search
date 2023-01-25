import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/enums/csv_columns.dart';
import 'package:amasearch/styles/font.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});
  static const String routeName = "/settings/csv/order";

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const OrderPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("項目の並び順"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(generalSettingsControllerProvider);
    void onReorder(int oldIndex, int newIndexRaw) {
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
      ref.read(generalSettingsControllerProvider.notifier).update(csvOrder: cp);
    }

    return Column(
      children: [
        ListTile(
          title: Text(
            "仕入れ商品リストをPCに送った際の並び順を変更できます。変更したい項目を長押ししてください。",
            style: captionFontSize(context),
          ),
        ),
        const ThemeDivider(),
        Expanded(
          child: ReorderableListView(
            onReorder: onReorder,
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
