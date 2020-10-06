import 'package:amasearch/models/constants.dart';
import 'package:amasearch/models/general_settings.dart';
import 'package:amasearch/util/hive_provider.dart';
import 'package:hooks_riverpod/all.dart';

final generalSettingsControllerProvider =
    StateNotifierProvider((ref) => GeneralSettingsController(ref.read));

class GeneralSettingsController extends StateNotifier<GeneralSettings> {
  GeneralSettingsController(this._read) : super(const GeneralSettings()) {
    _loadSettings();
  }

  final Reader _read;

  void _loadSettings() {
    final box = _read(settingsBoxProvider);
    final settings = box.get(generalSettingsKeyName) as GeneralSettings;
    if (settings != null) {
      state = settings;
    }
    // 新規追加された項目が、ロード時にデフォルト値になっている可能性があるので一度保存する
    box.put(generalSettingsKeyName, state);
  }

  void update({bool isDarkMode}) {
    final box = _read(settingsBoxProvider);
    state = state.copyWith(
      isDarkMode: isDarkMode ?? state.isDarkMode,
    );
    box.put(generalSettingsKeyName, state);
  }
}
