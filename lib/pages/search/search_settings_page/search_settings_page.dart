import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/events.dart';
import 'package:amasearch/controllers/search_item_controller.dart';
import 'package:amasearch/controllers/search_settings_controller.dart';
import 'package:amasearch/models/enums/search_type.dart';
import 'package:amasearch/models/enums/used_sub_condition.dart';
import 'package:amasearch/models/search_settings.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _currentSettingsProvider =
    Provider<SearchSettings>((_) => throw UnimplementedError());

class SearchSettingsPage extends StatelessWidget {
  const SearchSettingsPage({Key? key}) : super(key: key);
  static const String routeName = "/search_setting";

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const SearchSettingsPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("検索設定"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(searchSettingsControllerProvider);
    return ProviderScope(
      overrides: [
        _currentSettingsProvider.overrideWithValue(settings),
      ],
      child: ListView(
        children: [
          const _CodeType(),
          const _UsedSubCondition(),
          SwitchListTile(
            value: settings.useFba,
            title: const Text("FBA 利用"),
            onChanged: (value) {
              if (value != settings.useFba) {
                ref
                    .read(searchSettingsControllerProvider.notifier)
                    .update(useFba: value);
              }
            },
          ),
          SwitchListTile(
            value: settings.priorFba,
            title: const Text("FBA 出品を優先表示"),
            onChanged: (value) {
              if (value != settings.priorFba) {
                ref
                    .read(searchSettingsControllerProvider.notifier)
                    .update(priorFba: value);
              }
            },
          ),
          SwitchListTile(
            value: settings.continuousInput,
            title: const Text("連続入力モード"),
            subtitle: const Text("外部バーコードリーダーを使う場合"),
            onChanged: (value) {
              if (value != settings.continuousInput) {
                ref
                    .read(searchSettingsControllerProvider.notifier)
                    .update(continuousInput: value);
              }
            },
          ),
          if (Platform.isIOS)
            ListTile(
              onTap: () async {
                await showOkAlertDialog(
                  context: context,
                  message: "iOS では、外部バーコードリーダーを接続すると"
                      "文字入力時にキーボードが表示されなくなります。\n\n"
                      "代わりに、ほとんどのバーコードリーダーにはスキャンボタンを2回押すと"
                      "キーボードを表示する機能があるため、これを有効化することをオススメします。\n\n"
                      "詳しくはバーコードリーダーの説明書をご確認ください。",
                );
              },
              title: const Text(
                "外部バーコードリーダーを使う場合の注意",
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          const ThemeDivider(),
          ListTile(
            title: const Text("検索履歴をすべて削除"),
            onTap: () async {
              final ret = await showOkCancelAlertDialog(
                context: context,
                title: "検索履歴の削除",
                message: "検索履歴からすべてのアイテムを削除します",
                isDestructiveAction: true,
              );
              if (ret == OkCancelResult.ok) {
                ref.read(searchItemControllerProvider.notifier).removeAll();
                await ref
                    .read(analyticsControllerProvider)
                    .logSingleEvent(deleteAllSearchHistoryEventName);
                Navigator.pop(context);
              }
            },
          ),
          const ThemeDivider(),
        ],
      ),
    );
  }
}

class _CodeType extends HookConsumerWidget {
  const _CodeType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(_currentSettingsProvider);
    return ListTile(
      title: Row(
        children: [
          const Text("コードタイプ"),
          const Spacer(),
          DropdownButton<SearchType>(
            value: settings.type,
            items: const [
              DropdownMenuItem(
                value: SearchType.jan,
                child: Text("JAN"),
              ),
              DropdownMenuItem(
                value: SearchType.bookoff,
                child: Text("BOOK OFF"),
              ),
              DropdownMenuItem(
                value: SearchType.geo,
                child: Text("GEO"),
              ),
              DropdownMenuItem(
                value: SearchType.tsutaya,
                child: Text("TSUTAYA"),
              ),
            ],
            onChanged: (value) {
              if (value != settings.type) {
                ref
                    .read(searchSettingsControllerProvider.notifier)
                    .update(type: value);
              }
            },
          )
        ],
      ),
    );
  }
}

class _UsedSubCondition extends HookConsumerWidget {
  const _UsedSubCondition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(_currentSettingsProvider);
    return ListTile(
      title: Row(
        children: [
          const Text("中古コンディション"),
          const Spacer(),
          DropdownButton<UsedSubCondition>(
            value: settings.usedSubCondition,
            items: const [
              DropdownMenuItem(
                value: UsedSubCondition.all,
                child: Text("すべて"),
              ),
              DropdownMenuItem(
                value: UsedSubCondition.mint,
                child: Text("ほぼ新品以上"),
              ),
              DropdownMenuItem(
                value: UsedSubCondition.veryGood,
                child: Text("非常に良い以上"),
              ),
              DropdownMenuItem(
                value: UsedSubCondition.good,
                child: Text("良い以上"),
              ),
              DropdownMenuItem(
                value: UsedSubCondition.acceptable,
                child: Text("可以上"),
              ),
            ],
            onChanged: (value) {
              if (value != settings.usedSubCondition) {
                ref
                    .read(searchSettingsControllerProvider.notifier)
                    .update(usedSubCondition: value);
              }
            },
          )
        ],
      ),
    );
  }
}
