import 'package:amasearch/controllers/search_settings_controller.dart';
import 'package:amasearch/models/enums/search_type.dart';
import 'package:amasearch/models/enums/used_sub_condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchSetting extends HookWidget {
  const SearchSetting({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final setting = useProvider(searchSettingsControllerProvider.state);
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(child: Text("検索設定")),
          Text("タイプ: ${setting.type.toDisplayString()}"),
          Text("中古コンディション: ${setting.usedSubCondition.toDisplayString()}"),
          Text("FBA利用: ${setting.useFba ? "する" : "しない"}"),
          Text("FBA優先表示: ${setting.priorFba ? "する" : "しない"}"),
        ],
      ),
    );
  }
}
