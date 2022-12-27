import 'package:amasearch/models/keep_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectedKeepItemsControllerProvider =
    StateNotifierProvider<SelectedKeepItemsController, List<KeepItem>>(
  (_) => SelectedKeepItemsController(),
);

class SelectedKeepItemsController extends StateNotifier<List<KeepItem>> {
  SelectedKeepItemsController() : super([]);

  void toggleItem(KeepItem item) {
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

  void setItems(List<KeepItem> items) {
    state = [...items];
  }

  void removeAll() {
    state = [];
  }
}
