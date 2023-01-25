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
    return ListView(
      children: [
        ListTile(
          title: Text(
            "商品仕入れ時に選択可能な仕入れ先を設定できます。",
            style: captionFontSize(context),
          ),
        ),
        const ThemeDivider(),
        for (var i = 0; i < retailers.length; i++)
          ListTile(
            title: Text(retailers[i]),
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
                  ref
                      .read(generalSettingsControllerProvider.notifier)
                      .removeRetailer(i);
                }
              },
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
                )
              ],
              title: "仕入先の追加",
            );

            if (text != null) {
              ref
                  .read(generalSettingsControllerProvider.notifier)
                  .addRetailer(text.single);
            }
          },
        )
      ],
    );
  }
}
