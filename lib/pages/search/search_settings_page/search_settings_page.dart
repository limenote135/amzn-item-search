import 'package:amasearch/controllers/search_settings_controller.dart';
import 'package:amasearch/models/enums/search_type.dart';
import 'package:amasearch/models/enums/used_sub_condition.dart';
import 'package:amasearch/models/search_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

final _currentSettingsProvider = ScopedProvider<SearchSettings>(null);

class SearchSettingsPage extends StatelessWidget {
  const SearchSettingsPage({Key key}) : super(key: key);

  static const String routeName = "/search_setting";

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
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = useProvider(searchSettingsControllerProvider.state);
    return ProviderScope(
      overrides: [
        _currentSettingsProvider.overrideWithValue(settings),
      ],
      child: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            const _CodeType(),
            const _UsedSubCondition(),
            SwitchListTile(
              value: settings.useFba,
              title: const Text("FBA 利用"),
              onChanged: (value) {
                if (value != settings.useFba) {
                  context
                      .read(searchSettingsControllerProvider)
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
                      .read(searchSettingsControllerProvider)
                      .update(priorFba: value);
                }
              },
            ),
          ],
        ).toList(),
      ),
    );
  }
}

class _CodeType extends HookWidget {
  const _CodeType({Key key}) : super(key: key);

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
                child: Text("JAN"),
                value: SearchType.jan,
              ),
              DropdownMenuItem(
                child: Text("BOOK OFF"),
                value: SearchType.bookoff,
              ),
              DropdownMenuItem(
                child: Text("ゲオ"),
                value: SearchType.geo,
              ),
              DropdownMenuItem(
                child: Text("TSUTAYA"),
                value: SearchType.tsutaya,
              ),
            ],
            onChanged: (value) {
              if (value != settings.type) {
                context
                    .read(searchSettingsControllerProvider)
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
  const _UsedSubCondition({Key key}) : super(key: key);

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
                child: Text("すべて"),
                value: UsedSubCondition.all,
              ),
              DropdownMenuItem(
                child: Text("ほぼ新品"),
                value: UsedSubCondition.mint,
              ),
              DropdownMenuItem(
                child: Text("非常に良い"),
                value: UsedSubCondition.veryGood,
              ),
              DropdownMenuItem(
                child: Text("良い"),
                value: UsedSubCondition.good,
              ),
              DropdownMenuItem(
                child: Text("可"),
                value: UsedSubCondition.acceptable,
              ),
            ],
            onChanged: (value) {
              if (value != settings.usedSubCondition) {
                context
                    .read(searchSettingsControllerProvider)
                    .update(usedSubCondition: value);
              }
            },
          )
        ],
      ),
    );
  }
}
