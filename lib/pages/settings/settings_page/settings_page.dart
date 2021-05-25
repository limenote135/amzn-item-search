import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/properties.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/pages/settings/alert_page/alert_page.dart';
import 'package:amasearch/pages/settings/custom_button_page/custom_button_page.dart';
import 'package:amasearch/pages/settings/purchase_list_page/purchase_list_page.dart';
import 'package:amasearch/pages/settings/read_aloud_page/read_aloud_settings_page.dart';
import 'package:amasearch/pages/settings/retailers_page/retailers_page.dart';
import 'package:amasearch/pages/settings/sku_format_page/sku_format_page.dart';
import 'package:amasearch/pages/settings/target_profit_page/target_profit_page.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info/package_info.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);
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
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = useProvider(generalSettingsControllerProvider);
    final auth = useProvider(firebaseAuthProvider);
    return ListView(
      children: [
        SwitchListTile(
          title: const Text("ダークモード"),
          value: settings.isDarkMode,
          onChanged: (value) {
            context
                .read(generalSettingsControllerProvider.notifier)
                .update(isDarkMode: value);
            context
                .read(analyticsControllerProvider)
                .setUserProp(darkModePropName, value.toString());
          },
        ),
        SwitchListTile(
          title: const Text("大口出品者"),
          value: settings.isMajorCustomer,
          onChanged: (value) {
            context
                .read(generalSettingsControllerProvider.notifier)
                .update(isMajorCustomer: value);
            context
                .read(analyticsControllerProvider)
                .setUserProp(majorCustomerPropName, value.toString());
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
              TargetProfitPage.route(),
            );
          },
        ),
        ListTile(
          title: const Text("SKU フォーマット"),
          subtitle: Text("${settings.skuFormat}"),
          onTap: () {
            Navigator.push(
              context,
              SkuFormatPage.route(),
            );
          },
        ),
        ListTile(
          title: const Text("仕入れ先設定"),
          onTap: () {
            Navigator.push(
              context,
              RetailersPage.route(),
            );
          },
        ),
        ListTile(
          title: const Text("カスタムボタン設定"),
          onTap: () {
            Navigator.push(
              context,
              CustomButtonPage.route(),
            );
          },
        ),
        ListTile(
          title: const Text("読み上げ設定"),
          subtitle: settings.enableReadAloud == false
              ? const Text("無効")
              : Text(settings.readAloudPatterns[settings.patternIndex].title),
          onTap: () {
            Navigator.push(
              context,
              ReadAloudSettingsPage.route(),
            );
          },
        ),
        ListTile(
          title: const Text("CSV設定"),
          onTap: () {
            Navigator.push(
              context,
              PurchaseListPage.route(),
            );
          },
        ),
        ListTile(
          title: const Text("アラート設定"),
          onTap: () {
            Navigator.push(
              context,
              AlertPage.route(),
            );
          },
        ),
        SwitchListTile(
          title: const Text("出品一覧で在庫を取得(β)"),
          subtitle: const Text("出品一覧画面が重くなります。"),
          value: settings.getStocks,
          onChanged: (value) {
            context
                .read(generalSettingsControllerProvider.notifier)
                .update(getStocks: value);
            context
                .read(analyticsControllerProvider)
                .setUserProp(getStocksPropName, value.toString());
          },
        ),
        const ThemeDivider(),
        ListTile(
          title: const Text("ログアウト"),
          onTap: () async {
            await auth.signOut();
            await GoogleSignIn().signOut();
          },
        ),
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
