import 'dart:async';

import 'package:amasearch/models/constants.dart';
import 'package:amasearch/models/enums/search_type.dart';
import 'package:amasearch/models/enums/used_sub_condition.dart';
import 'package:amasearch/models/search_settings.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/hive_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchSettingsControllerProvider =
    StateNotifierProvider<SearchSettingsController, SearchSettings>(
  SearchSettingsController.new,
);

class SearchSettingsController extends StateNotifier<SearchSettings> {
  SearchSettingsController(this._ref) : super(const SearchSettings()) {
    _loadSettings();
  }

  final Ref _ref;

  void _loadSettings() {
    final box = _ref.read(settingsBoxProvider);
    final isPaidUser = _ref.read(isPaidUserProvider);
    var settings = box.get(searchSettingsKeyName) as SearchSettings?;
    if (settings != null) {
      if (!isPaidUser) {
        settings = settings.copyWith(type: SearchType.jan);
      }
      state = settings;
    }
    // デフォルト値が設定されている可能性があるので、一度保存する
    unawaited(box.put(searchSettingsKeyName, state));
  }

  void update({
    SearchType? type,
    UsedSubCondition? usedSubCondition,
    bool? useFba,
    bool? priorFba,
    bool? continuousCameraRead,
    bool? continuousInput,
  }) {
    final box = _ref.read(settingsBoxProvider);
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
