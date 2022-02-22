import 'package:amasearch/models/stock_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectedStockItemsControllerProvider =
    StateNotifierProvider<SelectedStockItemsController, List<StockItem>>(
  (_) => SelectedStockItemsController(),
);

class SelectedStockItemsController extends StateNotifier<List<StockItem>> {
  SelectedStockItemsController() : super([]);

  void toggleItem(StockItem item) {
    if (state.contains(item)) {
      // remove
      state = [
        for (final s in state)
          if (s != item) s
      ];
    } else {
      // add
      state = [item, ...state];
    }
  }

  void removeAll() {
    state = [];
  }
}
