import 'package:amasearch/models/constants.dart';
import 'package:amasearch/models/enums/search_type.dart';
import 'package:amasearch/models/enums/used_sub_condition.dart';
import 'package:amasearch/models/search_settings.dart';
import 'package:amasearch/util/hive_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchSettingsControllerProvider =
    StateNotifierProvider<SearchSettingsController, SearchSettings>(
        (ref) => SearchSettingsController(ref.read));

class SearchSettingsController extends StateNotifier<SearchSettings> {
  SearchSettingsController(this._read) : super(const SearchSettings()) {
    _loadSettings();
  }

  final Reader _read;

  void _loadSettings() {
    final box = _read(settingsBoxProvider);
    final settings = box.get(searchSettingsKeyName) as SearchSettings?;
    if (settings != null) {
      if (settings.type == SearchType.freeWord) {
        // フリーワード検索を別ページに分けたことによるマイグレーション
        state = settings.copyWith(type: SearchType.jan);
      } else {
        state = settings;
      }
    }
    // デフォルト値が設定されている可能性があるので、一度保存する
    box.put(searchSettingsKeyName, state);
  }

  void update({
    SearchType? type,
    UsedSubCondition? usedSubCondition,
    bool? useFba,
    bool? priorFba,
    bool? continuousCameraRead,
    bool? continuousInput,
  }) {
    final box = _read(settingsBoxProvider);
    state = state.copyWith(
      type: type ?? state.type,
      usedSubCondition: usedSubCondition ?? state.usedSubCondition,
      useFba: useFba ?? state.useFba,
      priorFba: priorFba ?? state.priorFba,
      continuousCameraRead: continuousCameraRead ?? state.continuousCameraRead,
      continuousInput: continuousInput ?? state.continuousInput,
    );
    box.put(searchSettingsKeyName, state);
  }
}
