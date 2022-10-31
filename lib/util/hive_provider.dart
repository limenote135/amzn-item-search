import 'package:amasearch/models/constants.dart';
import 'package:amasearch/models/keep_item.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/models/word_search_history.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchItemBoxProvider =
    Provider((_) => Hive.box<SearchItem>(searchItemBoxName));

final stockItemBoxProvider =
    Provider((_) => Hive.box<StockItem>(stockItemBoxName));

final settingsBoxProvider = Provider((_) => Hive.box<dynamic>(settingsBoxName));

final wordSearchHistoryBoxProvider =
    Provider((_) => Hive.box<WordSearchHistory>(wordSearchHistoryBoxName));

final keepItemBoxProvider =
    Provider((_) => Hive.box<KeepItem>(keepItemBoxName));
