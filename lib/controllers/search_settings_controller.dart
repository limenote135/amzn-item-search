import 'package:amasearch/models/constants.dart';
import 'package:amasearch/models/enums/search_type.dart';
import 'package:amasearch/models/enums/used_sub_condition.dart';
import 'package:amasearch/models/search_settings.dart';
import 'package:amasearch/util/hive_provider.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:state_notifier/state_notifier.dart';

final searchSettingsControllerProvider =
    StateNotifierProvider((ref) => SearchSettingsController(ref.read));

class SearchSettingsController extends StateNotifier<SearchSettings> {
  SearchSettingsController(this._read) : super(const SearchSettings()) {
    _loadSettings();
  }

  final Reader _read;

  void _loadSettings() {
    final box = _read(settingsBoxProvider);
    final settings = box.get(searchSettingsKeyName) as SearchSettings;
    if (settings == null) {
      return;
    }
    state = settings;
  }

  void update({
    SearchType type,
    UsedSubCondition usedSubCondition,
    bool useFba,
    bool priorFba,
  }) {
    final box = _read(settingsBoxProvider);
    state = state.copyWith(
      type: type ?? state.type,
      usedSubCondition: usedSubCondition ?? state.usedSubCondition,
      useFba: useFba ?? state.useFba,
      priorFba: priorFba ?? state.priorFba,
    );
    box.put(searchSettingsKeyName, state);
  }
}
