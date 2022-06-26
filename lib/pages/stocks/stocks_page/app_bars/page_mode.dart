import 'package:riverpod/riverpod.dart';

enum StockPageMode {
  normal,
  select,
  listing,
  upload,
}

final stockPageModeProvider = StateProvider((_) => StockPageMode.normal);
