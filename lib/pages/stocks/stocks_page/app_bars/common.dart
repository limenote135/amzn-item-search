import 'package:amasearch/controllers/selected_stock_items_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'page_mode.dart';

final selectAllProvider = StateProvider((_) => false);

void resetState(WidgetRef ref) {
  ref.read(stockPageModeProvider.notifier).state = StockPageMode.normal;
  ref.read(selectedStockItemsControllerProvider.notifier).removeAll();
  ref.read(selectAllProvider.notifier).state = false;
}
