import 'package:amasearch/models/stock_item.dart';
import 'package:hooks_riverpod/all.dart';

final stockItemListControllerProvider =
    StateNotifierProvider((_) => StockItemListController());

class StockItemListController extends StateNotifier<List<StockItem>> {
  StockItemListController({List<StockItem> state}) : super(state ?? []);

  void add(StockItem item) {
    state = [item, ...state];
  }

  void remove(List<StockItem> targets) {
    if(targets.isEmpty) {
      return;
    }
    state = state.where((element) => !targets.contains(element)).toList();
  }
}
