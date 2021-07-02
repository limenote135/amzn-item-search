import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/properties.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/pages/settings/alert_page/alert_page.dart';
import 'package:amasearch/pages/settings/amazon_page/amazon_page.dart';
import 'package:amasearch/pages/settings/custom_button_page/custom_button_page.dart';
import 'package:amasearch/pages/settings/keepa_page/keepa_page.dart';
import 'package:amasearch/pages/settings/purchase_list_page/purchase_list_page.dart';
import 'package:amasearch/pages/settings/read_aloud_page/read_aloud_settings_page.dart';
import 'package:amasearch/pages/settings/retailers_page/retailers_page.dart';
import 'package:amasearch/pages/settings/shortcut_page/shortcut_page.dart';
import 'package:amasearch/pages/settings/sku_format_page/sku_format_page.dart';
import 'package:amasearch/pages/settings/support_page/suppert_page.dart';
import 'package:amasearch/pages/settings/target_profit_page/target_profit_page.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/cloud_functions.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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

class _Body extends HookConsumerWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(generalSettingsControllerProvider);
    final auth = ref.watch(firebaseAuthProvider);

    final captionStyle = Theme.of(context).textTheme.caption;
    return ListView(
      children: [
        ListTile(
          title: Text("全般", style: captionStyle),
        ),
        SwitchListTile(
          title: const Text("ダークモード"),
          value: settings.isDarkMode,
          onChanged: (value) {
            ref
                .read(generalSettingsControllerProvider.notifier)
                .update(isDarkMode: value);
            ref
                .read(analyticsControllerProvider)
                .setUserProp(darkModePropName, value.toString());
          },
        ),
        SwitchListTile(
          title: const Text("大口出品者"),
          value: settings.isMajorCustomer,
          onChanged: (value) {
            ref
                .read(generalSettingsControllerProvider.notifier)
                .update(isMajorCustomer: value);
            ref
                .read(analyticsControllerProvider)
                .setUserProp(majorCustomerPropName, value.toString());
          },
        ),
        ListTile(
          title: const Text("Amazon連携"),
          onTap: () {
            Navigator.push(context, AmazonPage.route());
          },
        ),
        const ThemeDivider(),
        ListTile(
          title: Text("検索設定", style: captionStyle),
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
          title: const Text("アラート設定"),
          onTap: () {
            Navigator.push(
              context,
              AlertPage.route(),
            );
          },
        ),
        ListTile(
          title: const Text("Keepa設定"),
          onTap: () {
            Navigator.push(context, KeepaSettings.route());
          },
        ),
        ListTile(
          title: const Text("ショートカット設定"),
          onTap: () {
            Navigator.push(context, ShortcutPage.route());
          },
        ),
        SwitchListTile(
          title: const Text("出品一覧で在庫数を取得(β)"),
          subtitle: const Text("出品一覧画面が重くなります。"),
          value: settings.getStocks,
          onChanged: (value) {
            ref
                .read(generalSettingsControllerProvider.notifier)
                .update(getStocks: value);
            ref
                .read(analyticsControllerProvider)
                .setUserProp(getStocksPropName, value.toString());
          },
        ),
        const ThemeDivider(),
        ListTile(
          title: Text("仕入れ設定", style: captionStyle),
        ),
        ListTile(
          title: const Text("SKU フォーマット"),
          subtitle: Text(settings.skuFormat),
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
          title: const Text("CSV設定"),
          onTap: () {
            Navigator.push(
              context,
              PurchaseListPage.route(),
            );
          },
        ),
        const ThemeDivider(),
        ListTile(
          title: Text("その他", style: captionStyle),
        ),
        ListTile(
          title: const Text("ログアウト"),
          onTap: () async {
            final ret = await showOkCancelAlertDialog(
              context: context,
              title: "ログアウト",
              message: "ログアウトしますか？",
              isDestructiveAction: true,
            );
            if (ret == OkCancelResult.ok) {
              await auth.signOut();
              await GoogleSignIn().signOut();
            }
          },
        ),
        ListTile(
          title: const Text("問い合わせ"),
          onTap: () {
            Navigator.push(context, SupportPage.route());
          },
        ),
        ListTile(
          title: const Text("アカウントの削除"),
          onTap: () async {
            final ret = await showOkCancelAlertDialog(
              context: context,
              title: "アカウントの削除",
              message: "アカウントを削除すると同じアカウントで再登録はできません。\n"
                  "本当に削除してよろしいですか？",
              isDestructiveAction: true,
            );
            if (ret == OkCancelResult.ok) {
              try {
                await EasyLoading.show(status: '削除中...');
                final fn =
                    ref.read(cloudFunctionProvider(functionNameDisableUser));
                await fn.call<String>("");

                // Loading アイコンがダイアログの上に重なって表示されるので、dismiss する
                await EasyLoading.dismiss();
                await showOkAlertDialog(
                  context: context,
                  message: "ご利用ありがとうございました。",
                );
                await auth.signOut();
                await GoogleSignIn().signOut();
              } finally {
                if (EasyLoading.isShow) {
                  await EasyLoading.dismiss();
                }
              }
            }
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
