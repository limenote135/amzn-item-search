import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/util/hive_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final stockItemListControllerProvider =
    StateNotifierProvider<StockItemListController, List<StockItem>>(
  (ref) => StockItemListController(ref.read),
);

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
    final data = box.values.toList()..sort(_sortFunc);
    state = data;
  }

  void add(StockItem item) {
    final box = _read(stockItemBoxProvider);
    // 過去の日付で仕入れをする場合があるため、仕入後には再ソートする
    state = [item, ...state]..sort(_sortFunc);
    box.put(item.id, item);
  }

  void update(StockItem item) {
    final box = _read(stockItemBoxProvider);
    // 仕入れ日を変更する場合があるため、再ソートする
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

  void setListingDate(List<StockItem> items, String date) {
    final box = _read(stockItemBoxProvider);
    final itemMap = <String, StockItem>{};
    for (final e in items) {
      itemMap[e.id] = e.copyWith(listingDate: date);
    }
    state = [
      for (final e in state) itemMap.containsKey(e.id) ? itemMap[e.id]! : e
    ];
    box.putAll(itemMap);
  }
}
