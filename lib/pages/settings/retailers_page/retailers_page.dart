import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/widgets/input_dialog.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RetailersPage extends StatelessWidget {
  const RetailersPage({Key? key}) : super(key: key);
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

class _Body extends HookWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final retailers = useProvider(generalSettingsControllerProvider.state
        .select((value) => value.retailers));
    return ListView(
      children: [
        ListTile(
          title: Text(
            "商品仕入れ時に選択可能な仕入れ先を設定できます。",
            style: Theme.of(context).textTheme.caption,
          ),
        ),
        const ThemeDivider(),
        for (var i = 0; i < retailers.length; i++)
          ListTile(
            title: Text(retailers[i]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                final ok = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("削除の確認"),
                    content: const Text("仕入れ先を削除してもよろしいですか？"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text("キャンセル"),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: const Text("OK"),
                      ),
                    ],
                  ),
                );
                if (ok!) {
                  context
                      .read(generalSettingsControllerProvider)
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
            final ret = await showDialog<String>(
              context: context,
              builder: (context) => InputDialog<String?>(
                title: const Text("仕入れ先の追加"),
                validate: (value) => value != "" ? value : null,
              ),
            );
            if (ret != null) {
              context.read(generalSettingsControllerProvider).addRetailer(ret);
            }
          },
        )
      ],
    );
  }
}
