import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/properties.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/widgets/input_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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

class _Body extends HookWidget {
  const _Body({Key? key}) : super(key: key);

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
            if (value) {
              context.read(analyticsControllerProvider).setUserProp(
                  targetProfitPropName, "${settings.targetProfitValue}");
            } else {
              context
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
            final ret = await showDialog<int>(
              context: context,
              builder: (context) => InputDialog<int?>(
                title: const Text("目標利益率"),
                keyboardType: TextInputType.number,
                validate: (value) {
                  final n = int.tryParse(value);
                  return n != null && n >= 0 ? n : null;
                },
              ),
            );
            if (ret != null) {
              context
                  .read(generalSettingsControllerProvider)
                  .update(targetProfitValue: ret);
              if (settings.enableTargetProfit) {
                await context.read(analyticsControllerProvider).setUserProp(
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
            final ret = await showDialog<int>(
              context: context,
              builder: (context) => InputDialog<int?>(
                title: const Text("最低利益額"),
                keyboardType: TextInputType.number,
                validate: (value) {
                  final n = int.tryParse(value);
                  return n != null && n >= 0 ? n : null;
                },
              ),
            );
            if (ret != null) {
              context
                  .read(generalSettingsControllerProvider)
                  .update(minProfit: ret);
              if (settings.enableTargetProfit) {
                await context.read(analyticsControllerProvider).setUserProp(
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
