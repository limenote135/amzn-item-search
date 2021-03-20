import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/util/hive_provider.dart';
import 'package:amasearch/util/uuid.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final stockItemListControllerProvider =
    StateNotifierProvider((ref) => StockItemListController(ref.read));

class StockItemListController extends StateNotifier<List<StockItem>> {
  StockItemListController(this._read, {List<StockItem>? state})
      : super(state ?? []) {
    _fetchAll();
  }

  static int _sortFunc(StockItem x, StockItem y) {
    return y.purchaseDate.compareTo(x.purchaseDate);
  }

  final Reader _read;

  void _fetchAll() {
    final box = _read(stockItemBoxProvider);
    final uuid = _read(uuidProvider);
    final data = box.values.toList()..sort(_sortFunc);
    state = data;

    // キーを購入日から UUID に変更するためのマイグレーション
    if (data.any((element) => element.id == "")) {
      final newData = <String, StockItem>{};
      final newState = <StockItem>[];
      for (var i = 0; i < data.length; i++) {
        final id = data[i].id != "" ? data[i].id : uuid.v4();
        final storeData = data[i].id != "" ? data[i] : data[i].copyWith(id: id);
        newData[id] = storeData;
        newState.add(storeData);
      }
      state = newState;
      box.clear().then((_) => box.putAll(newData));
    }
  }

  void add(StockItem item) {
    final box = _read(stockItemBoxProvider);
    state = [item, ...state];
    box.put(item.id, item);
  }

  void update(StockItem item) {
    final box = _read(stockItemBoxProvider);
    state = [for (final i in state) i.id == item.id ? item : i]
      ..sort(_sortFunc);
    box.put(item.id, item);
  }

  void remove(List<StockItem> targets) {
    if (targets.isEmpty) {
      return;
    }
    state = state.where((element) => !targets.contains(element)).toList();

    final box = _read(stockItemBoxProvider);
    final keys = targets.map((e) => e.id);
    box.deleteAll(keys);
  }

  void removeAll() {
    final box = _read(stockItemBoxProvider);
    state = [];
    box.clear();
  }
}
