import 'package:riverpod/riverpod.dart';

enum StockPageMode {
  normal,
  select,
  listing,
  upload,
  delete,
}

final stockPageModeProvider = StateProvider((_) => StockPageMode.normal);
