import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/events.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/repository/bookoff.dart';
import 'package:amasearch/repository/geo.dart';
import 'package:amasearch/repository/tsutaya.dart';
import 'package:amasearch/util/hive_provider.dart';
import 'package:amasearch/util/util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchItemControllerProvider =
    StateNotifierProvider<SearchItemController, List<Future<SearchItem>>>(
  SearchItemController.new,
);

class SearchItemController extends StateNotifier<List<Future<SearchItem>>> {
  SearchItemController(this._ref) : super([]) {
    _fetchAll();
  }

  final Ref _ref;
  static final RegExp _janRegexp = RegExp(r"4[59]\d{11}");

  void _fetchAll() {
    final box = _ref.read(searchItemBoxProvider);
    state = box.values.map(Future.value).toList().reversed.toList();
  }

  void removeAll() {
    final box = _ref.read(searchItemBoxProvider);
    state = [];
    box.clear();
  }

  void remove(List<SearchItem> targets) {
    if (targets.isEmpty) {
      return;
    }
    final box = _ref.read(searchItemBoxProvider);
    final keys = targets.map((e) => e.searchDate);
    box.deleteAll(keys);

    state = box.values.map(Future.value).toList().reversed.toList();
  }

  void add(String raw) {
    var jan = raw.trim();
    if (jan.length == 12) {
      // UPC-A は12桁なので、UPC として検索するか、先頭に0を足して13桁にして JAN として計算する必要がある
      // ここでは後者の方法にする
      jan = "0$jan";
    }
    if (jan.length > 13) {
      if (jan.startsWith("45") ||
          jan.startsWith("49") ||
          jan.startsWith("978")) {
        jan = jan.substring(0, 13);
      } else {
        final suffix = jan.substring(jan.length - 13, jan.length);
        if (suffix.startsWith("45") || suffix.startsWith("49")) {
          jan = suffix;
        } else {
          final m = _janRegexp.firstMatch(raw);
          final value = m?.group(0);
          if (value != null) {
            jan = value;
          }
        }
      }
    }
    final data = Future.value(
      SearchItem(
        searchDate: currentTimeString(),
        jan: jan,
      ),
    );
    _ref.read(analyticsControllerProvider).logSearchEvent(searchEventJan);
    state = [data, ...state];
  }

  void addBookoff(String code) {
    final code2 = code.trim();
    final future = _ref.read(bookoffItemFutureProvider(code2).future);
    _ref.read(analyticsControllerProvider).logSearchEvent(searchEventBookoff);
    state = [future, ...state];
  }

  void addGeo(String code) {
    final code2 = code.trim();
    final future = _ref.read(geoItemFutureProvider(code2).future);
    _ref.read(analyticsControllerProvider).logSearchEvent(searchEventGeo);
    state = [future, ...state];
  }

  void addTsutaya(String code) {
    final code2 = code.trim();
    final future = _ref.read(tsutayaItemFutureProvider(code2).future);
    _ref.read(analyticsControllerProvider).logSearchEvent(searchEventTsutaya);
    state = [future, ...state];
  }
}
