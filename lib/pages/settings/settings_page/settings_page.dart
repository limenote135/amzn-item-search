import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/properties.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/pages/settings/alert_page/alert_page.dart';
import 'package:amasearch/pages/settings/amazon_page/amazon_page.dart';
import 'package:amasearch/pages/settings/condition_text_page/condition_text_page.dart';
import 'package:amasearch/pages/settings/csv_page/csv_page.dart';
import 'package:amasearch/pages/settings/custom_button_page/custom_button_page.dart';
import 'package:amasearch/pages/settings/debug_page/debug_page.dart';
import 'package:amasearch/pages/settings/donation_page/donation_page.dart';
import 'package:amasearch/pages/settings/external_services_page/external_services_page.dart';
import 'package:amasearch/pages/settings/faq_page/faq_page.dart';
import 'package:amasearch/pages/settings/keepa_page/keepa_page.dart';
import 'package:amasearch/pages/settings/read_aloud_page/read_aloud_settings_page.dart';
import 'package:amasearch/pages/settings/retailers_page/retailers_page.dart';
import 'package:amasearch/pages/settings/settings_page/subscription_status.dart';
import 'package:amasearch/pages/settings/shortcut_page/shortcut_page.dart';
import 'package:amasearch/pages/settings/sku_format_page/sku_format_page.dart';
import 'package:amasearch/pages/settings/support_page/suppert_page.dart';
import 'package:amasearch/pages/settings/target_profit_page/target_profit_page.dart';
import 'package:amasearch/styles/font.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/cloud_functions.dart';
import 'package:amasearch/util/dio.dart';
import 'package:amasearch/util/release_notes.dart';
import 'package:amasearch/widgets/payment.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:release_notes_dialog/release_notes_dialog.dart';

import 'amazon_status.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

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
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(generalSettingsControllerProvider);
    final showPlanAsync = ref.watch(showPlanProvider);

    final captionStyle = captionFontSize(context);
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
        ListTile(
          title: const Text("Amazon連携"),
          subtitle: const AmazonStatus(),
          onTap: () {
            Navigator.push(context, AmazonPage.route());
          },
        ),
        showPlanAsync.when(
          error: (error, stackTrace) {
            return const ListTile(
              title: Text("現在のプラン"),
              subtitle: SubscriptionStatus(),
            );
          },
          loading: Container.new,
          data: (showPlan) {
            if (showPlan) {
              return const ListTile(
                title: Text("現在のプラン"),
                subtitle: SubscriptionStatus(),
              );
            }
            return Container();
          },
        ),
        const ThemeDivider(),
        ListTile(
          title: Text("検索設定", style: captionStyle),
        ),
        ListTile(
          title: const WithLockIconIfNotPaid(child: Text("目標利益率設定")),
          subtitle: settings.enableTargetProfit
              ? Text("${settings.targetProfitValue} %")
              : const Text("無効"),
          onTap: () {
            Navigator.push(
              context,
              TargetProfitPage.route(),
            );
          },
        ),
        ListTile(
          title: const WithLockIconIfNotPaid(child: Text("カスタムボタン設定")),
          onTap: () {
            Navigator.push(
              context,
              CustomButtonPage.route(),
            );
          },
        ),
        ListTile(
          title: const WithLockIconIfNotPaid(child: Text("読み上げ設定")),
          subtitle: settings.enableReadAloud
              ? Text(settings.readAloudPatterns[settings.patternIndex].title)
              : const Text("無効"),
          onTap: () {
            Navigator.push(
              context,
              ReadAloudSettingsPage.route(),
            );
          },
        ),
        ListTile(
          title: const WithLockIconIfNotPaid(child: Text("アラート設定")),
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
          title: const WithLockIconIfNotPaid(child: Text("ショートカット設定")),
          onTap: () {
            Navigator.push(context, ShortcutPage.route());
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
              CsvPage.route(),
            );
          },
        ),
        ListTile(
          title: const Text("価格改定サービス設定"),
          onTap: () {
            Navigator.push(
              context,
              ExternalServicesPage.route(),
            );
          },
        ),
        ListTile(
          title: const Text("コンディション説明設定"),
          onTap: () {
            Navigator.push(
              context,
              ConditionTextPage.route(),
            );
          },
        ),
        const ThemeDivider(),
        ListTile(
          title: Text("その他", style: captionStyle),
        ),
        ListTile(
          title: const Text("コーヒーをおごる"),
          onTap: () {
            Navigator.push(
              context,
              DonationPage.route(),
            );
          },
        ),
        ListTile(
          title: const Text("キャッシュの削除"),
          onTap: () async {
            final ret = await showOkCancelAlertDialog(
              context: context,
              title: "キャッシュの削除",
              message: "すべてのキャッシュファイルを削除しますか？\n"
                  "(各種リストの内容や設定内容は消えません)",
            );
            if (ret == OkCancelResult.ok) {
              try {
                await EasyLoading.show(status: "削除中...");
                await clearDiskCachedImages();
                ref
                    .read(generalSettingsControllerProvider.notifier)
                    .changeKeepaExtraParam();
                if (Platform.isIOS) {
                  await ChromeSafariBrowser.clearWebsiteData();
                }
                await FilePicker.platform.clearTemporaryFiles();
                final tempDir = await getTemporaryDirectory();
                final imageDir = Directory("$tempDir/images");
                if (imageDir.existsSync()) {
                  imageDir.deleteSync();
                }
                final cookieManager = CookieManager.instance();
                await cookieManager.deleteAllCookies();
                final jar = await ref.read(persistCookieJarProvider.future);
                await jar.deleteAll();
              } finally {
                await EasyLoading.dismiss();
              }
            }
          },
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
              await FirebaseAuth.instance.signOut();
              await GoogleSignIn().signOut();
            }
          },
        ),
        const ThemeDivider(),
        ListTile(
          title: Text("サポート", style: captionStyle),
        ),
        ListTile(
          title: const Text("よくあるご質問"),
          onTap: () {
            Navigator.push(context, FaqPage.route());
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
              message: "アカウントを削除すると同じメールアドレスで再登録はできません。\n"
                  "また、加入中のプランは即座にキャンセルされます。\n"
                  "この操作は取り消せません。\n\n"
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
                await FirebaseAuth.instance.signOut();
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
          onLongPress: () {
            Navigator.push(context, DebugPage.route());
          },
        ),
        ListTile(
          title: const Text("更新履歴"),
          onTap: () async {
            await showDialog<void>(
              context: context,
              builder: (context) => ReleaseNotesDialog(
                title: "更新履歴",
                closeButtonString: "OK",
                titleTextStyle: Theme.of(context).textTheme.titleLarge,
                releases: releaseNotes,
              ),
            );
          },
        ),
        const ThemeDivider(),
      ],
    );
  }
}
