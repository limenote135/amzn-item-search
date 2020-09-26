import 'package:amasearch/models/item.dart';
import 'package:amasearch/util/hive_provider.dart';
import 'package:hooks_riverpod/all.dart';

final itemListControllerProvider =
    StateNotifierProvider((ref) => ItemListController(ref.read));

class ItemListController extends StateNotifier<List<FutureProvider<Item>>> {
  ItemListController(this._read, {List<FutureProvider<Item>> state})
      : super(state ?? []) {
    _fetchAll();
  }

  final Reader _read;

  void _fetchAll() {
    final box = _read(searchItemBoxProvider);
    state = box.values
        .map((e) => FutureProvider((_) => Future.value(e)))
        .toList()
        .reversed
        .toList();
  }

  void add(String jan) {
    final future = itemFutureProvider(jan);
    state = [future, ...state];
  }

  void saveData(Item data) {
    final box = _read(searchItemBoxProvider);
    // ignore: cascade_invocations
    box.put(data.searchDate, data);
  }
}
