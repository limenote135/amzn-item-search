import 'package:amasearch/models/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'enums/search_type.dart';
import 'enums/used_sub_condition.dart';

part 'search_settings.freezed.dart';
part 'search_settings.g.dart';

@freezed
class SearchSettings with _$SearchSettings {
  @HiveType(typeId: searchSettingsTypeId)
  const factory SearchSettings({
    @HiveField(0) @Default(SearchType.jan) SearchType type,
    @HiveField(1)
    @Default(UsedSubCondition.all)
        UsedSubCondition usedSubCondition,
    @HiveField(2) @Default(true) bool useFba,
    @HiveField(3) @Default(true) bool priorFba,
    @HiveField(4, defaultValue: true) @Default(true) bool continuousCameraRead,
  }) = _SearchSettings;
}
