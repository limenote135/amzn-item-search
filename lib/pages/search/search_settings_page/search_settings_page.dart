import 'package:ama_search/models/search_type.dart';
import 'package:ama_search/models/used_sub_condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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
    return ListView(
      children: ListTile.divideTiles(
        context: context,
        tiles: [
          const _CodeType(),
          const _UsedSubCondition(),
          SwitchListTile(
            value: true, // TODO: 仮
            title: const Text("FBA 利用"),
            onChanged: (value) {
              //TODO: 変更対応
            },
          ),
          SwitchListTile(
            value: true, // TODO: 仮
            title: const Text("FBA 出品を優先表示"),
            onChanged: (value) {
              //TODO: 変更対応
            },
          ),
        ],
      ).toList(),
    );
  }
}

class _CodeType extends StatelessWidget {
  const _CodeType({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          const Text("コードタイプ"),
          const Spacer(),
          DropdownButton<SearchType>(
            value: SearchType.jan, // TODO: 仮
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
              // TODO: 変更に対応
            },
          )
        ],
      ),
    );
  }
}

class _UsedSubCondition extends StatelessWidget {
  const _UsedSubCondition({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          const Text("中古コンディション"),
          const Spacer(),
          DropdownButton<UsedSubCondition>(
            value: UsedSubCondition.all, // TODO: 仮
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
              // TODO: 変更対応
            },
          )
        ],
      ),
    );
  }
}
