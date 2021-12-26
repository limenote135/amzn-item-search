import 'package:amasearch/models/enums/item_sub_condition.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'events.dart';

const propValueMaxLength = 36;
const eventValueMaxLength = 100;

final analyticsObserverProvider = Provider(
    (ref) => FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance));

final analyticsControllerProvider = Provider((_) => AnalyticsController());

class AnalyticsController {
  AnalyticsController();

  Future<void> logPurchaseEvent(StockItem stock) {
    final title = stock.item.title.length > eventValueMaxLength
        ? stock.item.title.substring(0, eventValueMaxLength)
        : stock.item.title;
    return FirebaseAnalytics.instance
        .logEvent(name: purchaseEventName, parameters: <String, dynamic>{
      "ASIN": stock.item.asin,
      "title": title,
      "quantity": stock.amount,
      "purchasePrice": stock.purchasePrice,
      "sellPrice": stock.sellPrice,
      "profit": stock.profitPerItem,
      "condition": stock.subCondition.toDisplayString(),
      "retailer": stock.retailer,
    });
  }

  Future<void> logPushSearchButtonEvent(String name) {
    return FirebaseAnalytics.instance.logEvent(
        name: pushSearchButtonEventName,
        parameters: <String, dynamic>{
          "type": name,
        });
  }

  Future<void> logSearchEvent(String type) {
    return FirebaseAnalytics.instance
        .logEvent(name: searchEventName, parameters: <String, dynamic>{
      "type": type,
    });
  }

  Future<void> logCalcEvent(String type) {
    return FirebaseAnalytics.instance.logEvent(
      name: calcEventName,
      parameters: <String, dynamic>{
        "type": type,
      },
    );
  }

  Future<void> logSingleEvent(String name) {
    return FirebaseAnalytics.instance
        .logEvent(name: name, parameters: <String, dynamic>{});
  }

  Future<void> setUserProp(String name, String value) {
    final normalizedVal = value.length > propValueMaxLength
        ? value.substring(0, propValueMaxLength)
        : value;
    return FirebaseAnalytics.instance
        .setUserProperty(name: name, value: normalizedVal);
  }

  Future<void> setUserId(String? uid) {
    return FirebaseAnalytics.instance.setUserId(id: uid);
  }
}
