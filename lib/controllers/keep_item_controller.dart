import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/models/keep_item.dart';
import 'package:amasearch/util/hive_provider.dart';
import 'package:amasearch/util/util.dart';
import 'package:amasearch/util/uuid.dart';
import 'package:riverpod/riverpod.dart';

final keepItemListControllerProvider =
    StateNotifierProvider<KeepItemListController, List<KeepItem>>(
  KeepItemListController.new,
);

class KeepItemListController extends StateNotifier<List<KeepItem>> {
  KeepItemListController(this._ref) : super([]) {
    _fetchAll();
  }

  static int _sortFunc(KeepItem x, KeepItem y) {
    return y.keepDate.compareTo(x.keepDate);
  }

  final Ref _ref;

  void _fetchAll() {
    final box = _ref.read(keepItemBoxProvider);
    final data = box.values.toList()..sort(_sortFunc);
    state = data;
  }

  void add(AsinData asinData, String memo) {
    final id = _ref.read(uuidProvider).v4();
    final keepItem = KeepItem(
      id: id,
      item: asinData,
      keepDate: currentTimeString(),
      memo: memo,
    );
    final box = _ref.read(keepItemBoxProvider);
    state = [keepItem, ...state];
    box.put(id, keepItem);
  }

  void remove(List<String> ids) {
    final box = _ref.read(keepItemBoxProvider);
    state = state.where((element) => !ids.contains(element.id)).toList();
    box.deleteAll(ids);
  }

  void removeAll() {
    final box = _ref.read(keepItemBoxProvider);
    state = [];
    box.clear();
  }

  void updateMemo(KeepItem item, String memo) {
    final box = _ref.read(keepItemBoxProvider);
    state = [
      for (var i = 0; i < state.length; i++)
        state[i].id == item.id ? item : state[i]
    ];
    box.put(item.id, item);
  }
}
