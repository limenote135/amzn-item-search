import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/styles/font.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RetailersPage extends StatelessWidget {
  const RetailersPage({super.key});
  static const String routeName = "/settings/retailer";

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const RetailersPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("仕入れ先設定"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final retailers = ref.watch(
      generalSettingsControllerProvider.select((value) => value.retailers),
    );
    void onReorder(int oldIndex, int newIndexRaw) {
      var newIndex = newIndexRaw;
      if (oldIndex < newIndex) {
        // 移動前のインデックスより移動後のインデックスが大きい場合、アイテムの長さがリストの保有数よりも1大きくなってしまうため、
        // newIndexから1引きます。
        // 例えば、上の画像のように1番目のアイテムを3番目に移動した場合、oldIndex = 0, newIndex = 3となります。
        // newIndexを1引いて2とします。
        newIndex -= 1;
      }
      final item = retailers[oldIndex];
      final cp = retailers.toList() // retailers はイミュータブルなのでコピーを作る
        ..removeAt(oldIndex)
        ..insert(newIndex, item);
      ref
          .read(generalSettingsControllerProvider.notifier)
          .update(retailers: cp);
    }

    return Column(
      children: [
        ListTile(
          title: Text(
            "商品仕入れ時に選択可能な仕入れ先を設定できます。\n"
            "長押しで並べ替えを行うことができます。",
            style: captionFontSize(context),
          ),
        ),
        const ThemeDivider(),
        Flexible(
          child: ReorderableListView(
            shrinkWrap: true,
            onReorder: onReorder,
            children: [
              for (var i = 0; i < retailers.length; i++)
                ListTile(
                  key: ValueKey(retailers[i]),
                  title: Text(retailers[i]),
                  leading: const Icon(Icons.menu),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async {
                      final ret = await showOkCancelAlertDialog(
                        context: context,
                        title: "削除の確認",
                        message: "仕入れ先を削除してもよろしいですか？",
                        isDestructiveAction: true,
                      );
                      if (ret == OkCancelResult.ok) {
                        final newData = <String>[
                          for (var index = 0; index < retailers.length; index++)
                            if (index != i) retailers[index],
                        ];
                        ref
                            .read(generalSettingsControllerProvider.notifier)
                            .update(retailers: newData);
                      }
                    },
                  ),
                ),
            ],
          ),
        ),
        const ThemeDivider(),
        ListTile(
          leading: const Icon(Icons.add),
          title: const Text("追加"),
          onTap: () async {
            final text = await showTextInputDialog(
              context: context,
              textFields: [
                DialogTextField(
                  validator: (value) => value!.isEmpty ? "仕入先を入力してください" : null,
                ),
              ],
              title: "仕入先の追加",
            );

            if (text != null) {
              if (retailers.contains(text.single)) {
                await showOkAlertDialog(
                  context: context,
                  title: "エラー",
                  message: "既に登録済みの仕入れ先です。",
                );
              } else {
                ref
                    .read(generalSettingsControllerProvider.notifier)
                    .update(retailers: [...retailers, text.single]);
              }
            }
          },
        ),
      ],
    );
  }
}
