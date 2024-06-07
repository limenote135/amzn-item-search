import 'dart:async';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/properties.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/enums/keepa_show_period.dart';
import 'package:amasearch/repository/keepa.dart';
import 'package:amasearch/styles/font.dart';
import 'package:amasearch/widgets/custom_dialog.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class KeepaSettings extends StatelessWidget {
  const KeepaSettings({super.key});
  static const String routeName = "/settings/keepa";

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const KeepaSettings(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Keepa 設定")),
      body: const _Body(),
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(
      generalSettingsControllerProvider.select((value) => value.keepaSettings),
    );

    return ListView(
      children: [
        ListTile(
          title: Text("デフォルト表示設定", style: captionFontSize(context)),
        ),
        SwitchListTile(
          title: const Text("新品価格"),
          value: settings.showNew,
          onChanged: (value) {
            final newState = settings.copyWith(showNew: value);
            if (newState.showNew || newState.showUsed || newState.showAmazon) {
              // １つ以上は常に選択されるようにする
              ref
                  .read(generalSettingsControllerProvider.notifier)
                  .update(keepaSettings: newState);
            }
          },
        ),
        SwitchListTile(
          title: const Text("中古価格"),
          value: settings.showUsed,
          onChanged: (value) {
            final newState = settings.copyWith(showUsed: value);
            if (newState.showNew || newState.showUsed || newState.showAmazon) {
              // １つ以上は常に選択されるようにする
              ref
                  .read(generalSettingsControllerProvider.notifier)
                  .update(keepaSettings: newState);
            }
          },
        ),
        SwitchListTile(
          title: const Text("Amazon価格"),
          value: settings.showAmazon,
          onChanged: (value) {
            final newState = settings.copyWith(showAmazon: value);
            if (newState.showNew || newState.showUsed || newState.showAmazon) {
              // １つ以上は常に選択されるようにする
              ref
                  .read(generalSettingsControllerProvider.notifier)
                  .update(keepaSettings: newState);
            }
          },
        ),
        SwitchListTile(
          title: const Text("カート価格"),
          value: settings.showBuyBox,
          onChanged: (value) {
            final newState = settings.copyWith(showBuyBox: value);
            ref
                .read(generalSettingsControllerProvider.notifier)
                .update(keepaSettings: newState);
          },
        ),
        SwitchListTile(
          title: const Text("FBA 配送"),
          value: settings.showFba,
          onChanged: (value) {
            final newState = settings.copyWith(showFba: value);
            ref
                .read(generalSettingsControllerProvider.notifier)
                .update(keepaSettings: newState);
          },
        ),
        ListTile(
          title: const Text("期間"),
          trailing: DropdownButton<KeepaShowPeriod>(
            value: settings.period,
            items: KeepaShowPeriod.values.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text("${e.toValue()}日"),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null && settings.period != value) {
                final newState = settings.copyWith(period: value);
                ref
                    .read(generalSettingsControllerProvider.notifier)
                    .update(keepaSettings: newState);
              }
            },
          ),
        ),
        const ThemeDivider(),
        SwitchListTile(
          title: const Text(" APIアクセスキーを利用する"),
          subtitle: const Text("必ずランキンググラフが表示されるようになります"),
          value: settings.useApiKey,
          onChanged: (value) {
            final newState = settings.copyWith(useApiKey: value);
            ref
                .read(generalSettingsControllerProvider.notifier)
                .update(keepaSettings: newState);

            final analytics = ref.read(analyticsControllerProvider);
            if (settings.useApiKey && settings.apiKey.isNotEmpty) {
              analytics.setUserProp(enableKeepaApiPropName, "true");
            } else {
              analytics.setUserProp(enableKeepaApiPropName, "false");
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: DebounceTextField(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: settings.apiKey.isEmpty
                  ? null
                  : () async {
                      final repository = ref.read(keepaProvider);
                      try {
                        final resp =
                            await repository.tokenStatus(settings.apiKey);
                        if (resp.error != null) {
                          await showOkAlertDialog(
                            context: context,
                            title: "接続エラー",
                            message: "API キーが間違っているか、有料プランではありません\n"
                                "${resp.error?.message}",
                          );
                        } else {
                          final msg = "残りトークン数: ${resp.tokensLeft}個\n"
                              "トークン補充頻度: ${resp.refillRate}個/ 分\n\n"
                              "グラフ1つにつき1つ消費され、トークンが無くなるとグラフが表示されなくなります";
                          if (settings.useApiKey) {
                            await showOkAlertDialog(
                              context: context,
                              title: "接続成功",
                              message: msg,
                            );
                          } else {
                            final ret = await showOkCancelAlertDialog(
                              context: context,
                              title: "接続成功",
                              message: "$msg\n\nAPI アクセスキーを利用する設定にしますか？",
                            );
                            if (ret == OkCancelResult.ok) {
                              final current =
                                  ref.read(generalSettingsControllerProvider);
                              final newState = current.keepaSettings
                                  .copyWith(useApiKey: true);
                              ref
                                  .read(
                                    generalSettingsControllerProvider.notifier,
                                  )
                                  .update(keepaSettings: newState);
                            }
                          }
                        }
                        // ignore: avoid_catches_without_on_clauses
                      } catch (e) {
                        await showOkAlertDialog(
                          context: context,
                          title: "エラー",
                          message: e.toString(),
                        );
                        rethrow;
                      }
                    },
              child: const Text("接続テスト"),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Center(
            child: GestureDetector(
              child: const Text(
                "API アクセスキーの確認方法はこちら",
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
              onTap: () {
                showKeepaApiKeyDialog(context: context);
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: const Text("Keepa を開く"),
              onPressed: () {
                launchUrl(Uri.parse("https://keepa.com/#!api"));
              },
            ),
          ],
        ),
      ],
    );
  }

  Future<void> showKeepaApiKeyDialog({required BuildContext context}) async {
    const title = Text("API キーの確認方法");
    final content = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("Keepa を開き、以下の部分をコピーしてください"),
        ExtendedImage.asset(
          "assets/keepa_api_key.png",
          border: Border.all(),
        ),
      ],
    );
    await showCustomOkDialog(context: context, title: title, content: content);
  }
}

// ignore: must_be_immutable
class DebounceTextField extends HookConsumerWidget {
  DebounceTextField({super.key});

  Timer? _timer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(
      generalSettingsControllerProvider.select((value) => value.keepaSettings),
    );
    final controller = useTextEditingController(text: settings.apiKey);
    return TextField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: "APIアクセスキー",
        hintText: "APIアクセスキーを入力してください",
      ),
      onChanged: (value) {
        if (_timer?.isActive ?? false) {
          _timer?.cancel();
        }
        _timer = Timer(const Duration(milliseconds: 500), () {
          final newState = settings.copyWith(apiKey: value);
          ref
              .read(generalSettingsControllerProvider.notifier)
              .update(keepaSettings: newState);
        });
      },
    );
  }
}
