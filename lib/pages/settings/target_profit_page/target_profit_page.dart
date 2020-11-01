import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/pages/settings/target_profit_page/target_profit_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TargetProfitPage extends StatelessWidget {
  const TargetProfitPage({Key key}) : super(key: key);
  static const String routeName = "/settings/targetProfit";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("目標利益率設定"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends HookWidget {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = useProvider(generalSettingsControllerProvider.state);
    return ListView(
      children: [
        SwitchListTile(
          title: const Text("目標利益率を設定する"),
          subtitle: const Text("商品検索時に設定した利益率を達成する仕入れ額を表示します"),
          value: settings.enableTargetProfit,
          onChanged: (value) {
            context
                .read(generalSettingsControllerProvider)
                .update(enableTargetProfit: value);
          },
        ),
        ListTile(
          title: Row(
            children: [
              const Text("設定"),
              const Spacer(),
              Text("${settings.targetProfitValue} %"),
            ],
          ),
          onTap: () async {
            final ret = await showDialog<int>(
              context: context,
              builder: (context) => const TargetProfitDialog(),
            );
            if (ret != null) {
              context
                  .read(generalSettingsControllerProvider)
                  .update(targetProfitValue: ret);
            }
          },
        )
      ],
    );
  }
}
