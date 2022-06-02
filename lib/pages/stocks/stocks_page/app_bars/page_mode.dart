import 'package:riverpod/riverpod.dart';

enum StockPageMode {
  normal,
  select,
  listing,
}

final stockPageModeProvider = StateProvider((_) => StockPageMode.normal);
