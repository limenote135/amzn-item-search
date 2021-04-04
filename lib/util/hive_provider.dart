import 'package:amasearch/models/constants.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchItemBoxProvider =
    Provider((_) => Hive.box<SearchItem>(searchItemBoxName));

final stockItemBoxProvider =
    Provider((_) => Hive.box<StockItem>(stockItemBoxName));

final settingsBoxProvider = Provider((_) => Hive.box<dynamic>(settingsBoxName));
