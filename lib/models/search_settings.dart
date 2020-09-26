import 'package:freezed_annotation/freezed_annotation.dart';

import 'enums/search_type.dart';
import 'enums/used_sub_condition.dart';

part 'search_settings.freezed.dart';

@freezed
abstract class SearchSettings with _$SearchSettings {
  const factory SearchSettings({
    @Default(SearchType.jan) SearchType type,
    @Default(UsedSubCondition.all) UsedSubCondition usedSubCondition,
    @Default(false) bool useFba,
    @Default(false) bool priorFba,
  }) = _SearchSettings;
}
