import 'package:amasearch/models/word_search_history.dart';
import 'package:amasearch/util/hive_provider.dart';
import 'package:dartx/dartx.dart';
import 'package:riverpod/riverpod.dart';

final wordSearchHistoryControllerProvider =
    StateNotifierProvider<WordSearchHistoryController, List<WordSearchHistory>>(
  WordSearchHistoryController.new,
);

class WordSearchHistoryController
    extends StateNotifier<List<WordSearchHistory>> {
  WordSearchHistoryController(this._ref) : super([]) {
    _fetchAll();
  }
  final Ref _ref;

  void _fetchAll() {
    final box = _ref.read(wordSearchHistoryBoxProvider);
    final data = box.values.toList();
    if (data.length > 300) {
      final recentData = data.takeLast(100);
      box
        ..clear()
        ..addAll(recentData);
    }
    state = data.reversed.toList().takeFirst(100);
  }

  void add(WordSearchHistory data) {
    final box = _ref.read(wordSearchHistoryBoxProvider);
    state = [data, ...state];
    box.add(data);
  }
}
