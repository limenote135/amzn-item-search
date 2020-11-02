import 'package:amasearch/models/enums/item_sub_condition.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'events.dart';

final _analyticsProvider = Provider((_) => FirebaseAnalytics());

final analyticsObserverProvider = Provider((ref) =>
    FirebaseAnalyticsObserver(analytics: ref.read(_analyticsProvider)));

final analyticsControllerProvider =
    Provider((ref) => AnalyticsController(ref.read));

class AnalyticsController {
  AnalyticsController(this._read);
  final Reader _read;

  Future<void> logPurchaseEvent(StockItem stock) {
    return _read(_analyticsProvider)
        .logEvent(name: purchaseEventName, parameters: <String, dynamic>{
      "ASIN": stock.item.asin,
      "title": stock.item.title,
      "quantity": stock.amount,
      "purchasePrice": stock.purchasePrice,
      "sellPrice": stock.sellPrice,
      "profit": stock.profitPerItem,
      "condition": stock.subCondition.toDisplayString(),
    });
  }

  Future<void> logPushSearchButtonEvent(String name) {
    return _read(_analyticsProvider).logEvent(
        name: pushSearchButtonEventName,
        parameters: <String, dynamic>{
          "type": name,
        });
  }

  Future<void> logSearchEvent(String type) {
    return _read(_analyticsProvider)
        .logEvent(name: searchEventName, parameters: <String, dynamic>{
      "type": type,
    });
  }

  Future<void> logSingleEvent(String name) {
    return _read(_analyticsProvider)
        .logEvent(name: name, parameters: <String, dynamic>{});
  }

  Future<void> setUserProp(String name, String value) {
    return _read(_analyticsProvider).setUserProperty(name: name, value: value);
  }
}
