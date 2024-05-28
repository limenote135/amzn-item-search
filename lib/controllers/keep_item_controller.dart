import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/models/keep_item.dart';
import 'package:amasearch/repository/mws.dart';
import 'package:amasearch/util/hive_provider.dart';
import 'package:amasearch/util/util.dart';
import 'package:amasearch/util/uuid.dart';
import 'package:collection/collection.dart';
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
    final newItem = item.copyWith(memo: memo);
    state = [
      for (var i = 0; i < state.length; i++)
        state[i].id == item.id ? newItem : state[i],
    ];
    box.put(item.id, newItem);
  }

  Future<void> updateData(List<KeepItem> raw) async {
    // 連続で実行した場合に備えて、既に更新中のものは無視する
    final items = raw.where((element) => !element.isUpdating).toList();

    final ids = items.map((e) => e.id);
    state = [
      for (final s in state)
        ids.contains(s.id) ? s.copyWith(isUpdating: true) : s,
    ];

    final mws = _ref.read(mwsRepositoryProvider);
    final chunks = items.slices(20);
    for (final chunk in chunks) {
      final asins = chunk.map((e) => e.item.asin).toList();
      final resp = await mws.batchGetAsinData(asins, skipRestrictions: true);
      final result = <String, KeepItem>{};
      for (final item in chunk) {
        final d = resp.data.firstWhereOrNull((e) => e.asin == item.item.asin);
        if (d == null) {
          result[item.id] = item.copyWith(isUpdating: false);
        } else {
          result[item.id] = item.copyWith(item: d, isUpdating: false);
        }
      }
      state = [
        for (final s in state) result.containsKey(s.id) ? result[s.id]! : s,
      ];
      await Future<void>.delayed(const Duration(seconds: 2));
    }
  }
}
