import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/util/hive_provider.dart';
import 'package:hooks_riverpod/all.dart';

final stockItemListControllerProvider =
    StateNotifierProvider((ref) => StockItemListController(ref.read));

class StockItemListController extends StateNotifier<List<StockItem>> {
  StockItemListController(this._read, {List<StockItem> state})
      : super(state ?? []) {
    _fetchAll();
  }

  final Reader _read;

  void _fetchAll() {
    final box = _read(stockItemBoxProvider);
    state = box.values.toList().reversed.toList();
  }

  void add(StockItem item) {
    final box = _read(stockItemBoxProvider);
    state = [item, ...state];
    box.put(item.purchaseDate, item);
  }

  void update(StockItem item) {
    final box = _read(stockItemBoxProvider);
    state = [
      for (final i in state) i.purchaseDate == item.purchaseDate ? item : i
    ];
    box.put(item.purchaseDate, item);
  }

  void remove(List<StockItem> targets) {
    if (targets.isEmpty) {
      return;
    }
    state = state.where((element) => !targets.contains(element)).toList();

    final box = _read(stockItemBoxProvider);
    final keys = targets.map((e) => e.purchaseDate);
    box.deleteAll(keys);
  }
}
