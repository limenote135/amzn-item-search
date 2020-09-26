import 'package:amasearch/models/enums/search_type.dart';
import 'package:amasearch/models/enums/used_sub_condition.dart';
import 'package:amasearch/models/search_settings.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:state_notifier/state_notifier.dart';

final searchSettingsControllerProvider =
    StateNotifierProvider((_) => SearchSettingsController());

class SearchSettingsController extends StateNotifier<SearchSettings> {
  SearchSettingsController() : super(const SearchSettings());

  void update({
    SearchType type,
    UsedSubCondition usedSubCondition,
    bool useFba,
    bool priorFba,
  }) {
    state = state.copyWith(
      type: type ?? state.type,
      usedSubCondition: usedSubCondition ?? state.usedSubCondition,
      useFba: useFba ?? state.useFba,
      priorFba: priorFba ?? state.priorFba,
    );
  }
}
