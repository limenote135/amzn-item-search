import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/properties.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TargetProfitPage extends StatelessWidget {
  const TargetProfitPage({Key? key}) : super(key: key);
  static const String routeName = "/settings/targetProfit";

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const TargetProfitPage(),
    );
  }

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

class _Body extends HookConsumerWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(generalSettingsControllerProvider);
    return ListView(
      children: [
        SwitchListTile(
          title: const Text("目標利益率を設定する"),
          subtitle: const Text("商品検索時に設定した利益率を達成する仕入れ額を表示します"),
          value: settings.enableTargetProfit,
          onChanged: (value) {
            ref
                .read(generalSettingsControllerProvider.notifier)
                .update(enableTargetProfit: value);
            if (value) {
              ref.read(analyticsControllerProvider).setUserProp(
                  targetProfitPropName, "${settings.targetProfitValue}");
            } else {
              ref
                  .read(analyticsControllerProvider)
                  .setUserProp(targetProfitPropName, "$value");
            }
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
            final ret = await showTextInputDialog(
              context: context,
              title: "目標利益率",
              textFields: [
                DialogTextField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    final n = int.tryParse(value ?? "");
                    return n != null && n >= 0 ? null : "不正な値です";
                  },
                )
              ],
            );
            if (ret != null) {
              ref
                  .read(generalSettingsControllerProvider.notifier)
                  .update(targetProfitValue: int.parse(ret.single));
              if (settings.enableTargetProfit) {
                await ref.read(analyticsControllerProvider).setUserProp(
                    targetProfitPropName, "$ret(min:${settings.minProfit})");
              }
            }
          },
        ),
        ListTile(
          title: Row(
            children: [
              const Text("最低利益額"),
              const Spacer(),
              Text("${settings.minProfit} 円"),
            ],
          ),
          onTap: () async {
            final ret = await showTextInputDialog(
              context: context,
              title: "最低利益額",
              textFields: [
                DialogTextField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    final n = int.tryParse(value ?? "");
                    return n != null && n >= 0 ? null : "不正な値です";
                  },
                )
              ],
            );
            if (ret != null) {
              ref
                  .read(generalSettingsControllerProvider.notifier)
                  .update(minProfit: int.parse(ret.single));
              if (settings.enableTargetProfit) {
                await ref.read(analyticsControllerProvider).setUserProp(
                    targetProfitPropName,
                    "${settings.targetProfitValue}(min:$ret)");
              }
            }
          },
        ),
      ],
    );
  }
}
