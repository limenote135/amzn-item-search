import 'package:amasearch/controllers/search_settings_controller.dart';
import 'package:amasearch/models/enums/search_type.dart';
import 'package:amasearch/models/enums/used_sub_condition.dart';
import 'package:amasearch/styles/font.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchSetting extends HookConsumerWidget {
  const SearchSetting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setting = ref.watch(searchSettingsControllerProvider);
    var condText = setting.usedSubCondition.toDisplayShortString();
    if (setting.usedSubCondition != UsedSubCondition.all) {
      condText += "以上";
    }
    final middleSize = middleFontSize(context);
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "検索設定",
              style: middleSize,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "タイプ: ${setting.type.toDisplayString()}",
                    style: middleSize,
                  ),
                  Text("中古表示: $condText", style: middleSize),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "FBA利用: ${setting.useFba ? "する" : "しない"}",
                    style: middleSize,
                  ),
                  Text(
                    "FBA優先表示: ${setting.priorFba ? "する" : "しない"}",
                    style: middleSize,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
