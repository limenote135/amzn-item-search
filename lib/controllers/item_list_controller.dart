import 'package:amasearch/models/item.dart';
import 'package:amasearch/repository/bookoff.dart';
import 'package:amasearch/util/hive_provider.dart';
import 'package:hooks_riverpod/all.dart';

import 'item_controller.dart';

final itemListControllerProvider =
    StateNotifierProvider((ref) => ItemListController(ref.read));

class ItemListController extends StateNotifier<
    List<FutureProvider<StateNotifierProvider<ItemController>>>> {
  ItemListController(this._read,
      {List<FutureProvider<StateNotifierProvider<ItemController>>> state})
      : super(state ?? []) {
    _fetchAll();
  }

  final Reader _read;

  void _fetchAll() {
    final box = _read(searchItemBoxProvider);
    state = box.values
        .map((e) =>
            FutureProvider((_) => Future.value(itemControllerProvider(e))))
        .toList()
        .reversed
        .toList();
  }

  void add(String jan) {
    final future = itemFutureProvider(jan);
    state = [future, ...state];
  }

  void addBookoff(String jan) {
    final future = bookoffItemFutureProvider(jan);
    state = [future, ...state];
  }
}
