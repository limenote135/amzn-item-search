import 'package:amasearch/models/enums/item_sub_condition.dart';
import 'package:amasearch/models/enums/shortcut_type.dart';
import 'package:amasearch/models/general_settings.dart';
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
      "retailer": stock.retailer,
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

  Future<void> logCalcEvent(String type) {
    return _read(_analyticsProvider).logEvent(
      name: calcEventName,
      parameters: <String, dynamic>{
        "type": type,
      },
    );
  }

  Future<void> logSingleEvent(String name) {
    return _read(_analyticsProvider)
        .logEvent(name: name, parameters: <String, dynamic>{});
  }

  Future<void> setUserProp(String name, String value) {
    return _read(_analyticsProvider).setUserProperty(name: name, value: value);
  }

  Future<void> setUserId(String? uid) {
    return _read(_analyticsProvider).setUserId(uid);
  }

  static String encodeShortcutToUserProp(List<ShortcutDetail> commands) {
    // ユーザープロパティの値の最大は36文字
    final buffer = StringBuffer("[");
    for (var i = 0; i < commands.length; i++) {
      if (commands[i].type != ShortcutType.none) {
        final val = _createShortcutPropVal(commands[i]);
        buffer
          ..write("(")
          ..write(val)
          ..write(")");
      }
    }
    buffer.write("]");
    return buffer.toString();
  }

  static String _createShortcutPropVal(ShortcutDetail command) {
    switch (command.type) {
      case ShortcutType.none:
        // ここにはこないはず
        return "";
      case ShortcutType.purchase:
        return "buy";
      case ShortcutType.delete:
        return "del";
      case ShortcutType.web:
        return "web:${command.param}";
      case ShortcutType.navigation:
        switch (command.param) {
          case navigationTargetNewOffers:
            return "nav:new";
          case navigationTargetUsedOffers:
            return "nav:used";
          case navigationTargetKeepa:
            return "nav:kp";
        }
        return "nav:${command.param}";
    }
  }
}
