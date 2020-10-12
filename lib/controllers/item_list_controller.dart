import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/events.dart';
import 'package:amasearch/models/item.dart';
import 'package:amasearch/models/item_interceptor.dart';
import 'package:amasearch/repository/bookoff.dart';
import 'package:amasearch/repository/geo.dart';
import 'package:amasearch/repository/tsutaya.dart';
import 'package:amasearch/util/hive_provider.dart';
import 'package:hooks_riverpod/all.dart';

import 'item_controller.dart';

final itemListControllerProvider =
    StateNotifierProvider((ref) => ItemListController(ref.read));

class ItemListController extends StateNotifier<
    List<FutureProvider<StateNotifierProvider<ItemController>>>> {
  ItemListController(this._read,
      {List<FutureProvider<StateNotifierProvider<ItemController>>> state})
      : super(state ?? []) {
    _fetchAll();
  }

  final Reader _read;

  void _fetchAll() {
    final box = _read(searchItemBoxProvider);
    // TODO: オンデマンドで読み込むべき？
    state = box.values
        .map((e) =>
            FutureProvider((_) => Future.value(itemControllerProvider(e))))
        .toList()
        .reversed
        .toList();
  }

  void removeAll() {
    final box = _read(searchItemBoxProvider);
    state = [];
    box.clear();
  }

  void remove(List<Item> targets) {
    if (targets.isEmpty) {
      return;
    }
    final box = _read(searchItemBoxProvider);
    final keys = targets.map((e) => e.searchDate);
    box.deleteAll(keys);

    state = box.values
        .map((e) =>
            FutureProvider((_) => Future.value(itemControllerProvider(e))))
        .toList()
        .reversed
        .toList();
  }

  void add(String raw) {
    var jan = raw.trim();
    if (jan.length == 12) {
      // UPC-A は12桁なので、UPC として検索するか、先頭に0を足して13桁にして JAN として計算する必要がある
      // ここでは後者の方法にする
      jan = "0$jan";
    }
    if (jan.length > 13) {
      if (jan.startsWith("45") || jan.startsWith("49")) {
        jan = jan.substring(0, 13);
      } else {
        jan = jan.substring(jan.length - 13, jan.length);
      }
    }
    _read(analyticsControllerProvider).logSearchEvent(searchEventJan);
    final future = itemFutureProvider(InterceptorParams(code: jan));
    state = [future, ...state];
  }

  void addFreeWord(String word) {
    _read(analyticsControllerProvider).logSearchEvent(searchEventWord);
    final future = freeWordItemFutureProvider(word.trim());
    state = [future, ...state];
  }

  void addBookoff(String code) {
    _read(analyticsControllerProvider).logSearchEvent(searchEventBookoff);
    final future = bookoffItemFutureProvider(code.trim());
    state = [future, ...state];
  }

  void addGeo(String code) {
    _read(analyticsControllerProvider).logSearchEvent(searchEventGeo);
    final future = geoItemFutureProvider(code.trim());
    state = [future, ...state];
  }

  void addTsutaya(String code) {
    _read(analyticsControllerProvider).logSearchEvent(searchEventTsutaya);
    final future = tsutayaItemFutureProvider(code.trim());
    state = [future, ...state];
  }
}
