import 'package:ama_search/models/item.dart';
import 'package:hooks_riverpod/all.dart';

final itemListControllerProvider =
    StateNotifierProvider((ref) => ItemListController(ref.read));

class ItemListController extends StateNotifier<List<FutureProvider<Item>>> {
  ItemListController(this._read, {List<FutureProvider<Item>> state})
      : super(state ?? []);

  final Reader _read;

  void add(String jan) {
    final future = itemFutureProvider(jan);
    state = [future, ...state];
  }
}
