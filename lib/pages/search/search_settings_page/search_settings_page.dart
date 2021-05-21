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
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _currentSettingsProvider = ScopedProvider<SearchSettings>(null);

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

class _Body extends HookWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = useProvider(searchSettingsControllerProvider);
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
                context
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
                context
                    .read(searchSettingsControllerProvider.notifier)
                    .update(priorFba: value);
              }
            },
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
                context.read(searchItemControllerProvider.notifier).removeAll();
                await context
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

class _CodeType extends HookWidget {
  const _CodeType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = useProvider(_currentSettingsProvider);
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
                child: Text("ゲオ"),
              ),
              DropdownMenuItem(
                value: SearchType.tsutaya,
                child: Text("TSUTAYA"),
              ),
            ],
            onChanged: (value) {
              if (value != settings.type) {
                context
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

class _UsedSubCondition extends HookWidget {
  const _UsedSubCondition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = useProvider(_currentSettingsProvider);
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
                context
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
