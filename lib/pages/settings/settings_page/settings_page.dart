import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/properties.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/pages/settings/sku_format_page/sku_format_page.dart';
import 'package:amasearch/pages/settings/target_profit_page/target_profit_page.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:package_info/package_info.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);
  static const routeName = "/settings";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("設定"),
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
          title: const Text("ダークモード"),
          value: settings.isDarkMode,
          onChanged: (value) {
            context
                .read(generalSettingsControllerProvider)
                .update(isDarkMode: value);
            context
                .read(analyticsControllerProvider)
                .setUserProp(darkModePropName, value.toString());
          },
        ),
        ListTile(
          title: const Text("目標利益率設定"),
          subtitle: settings.enableTargetProfit == false
              ? const Text("無効")
              : Text("${settings.targetProfitValue} %"),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute<void>(
                  settings:
                      const RouteSettings(name: TargetProfitPage.routeName),
                  builder: (context) => const TargetProfitPage(),
                ));
          },
        ),
        ListTile(
          title: const Text("SKU フォーマット"),
          subtitle: Text("${settings.skuFormat}"),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute<void>(
                  settings: const RouteSettings(name: SkuFormatPage.routeName),
                  builder: (context) => const SkuFormatPage(),
                ));
          },
        ),
        const ThemeDivider(),
        ListTile(
          title: const Text("このアプリについて"),
          onTap: () async {
            final packageInfo = await PackageInfo.fromPlatform();
            showAboutDialog(
              context: context,
              applicationName: packageInfo.appName,
              applicationVersion:
                  "${packageInfo.version} (build ${packageInfo.buildNumber})",
              applicationLegalese: "Copyright けんず",
            );
          },
        ),
        const ThemeDivider(),
      ],
    );
  }
}
