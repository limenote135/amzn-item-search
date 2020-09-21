import 'package:ama_search/models/search_type.dart';
import 'package:ama_search/models/used_sub_condition.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
