import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/properties.dart';
import 'package:amasearch/models/enums/alert_type.dart';
import 'package:amasearch/models/general_settings.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void updateAlertConditionAnalytics(
    BuildContext context, WidgetRef ref, List<AlertConditionSet> alerts) {
  final prop = _encodeAlertConditionToUserProps(alerts);
  ref.read(analyticsControllerProvider).setUserProp(
      alertSettingsPropName, prop.length > 36 ? prop.substring(0, 36) : prop);
}

String _encodeAlertConditionToUserProps(List<AlertConditionSet> alerts) {
  final buffer = StringBuffer("");
  for (var i = 0; i < alerts.length; i++) {
    final val = _createAlertConditionPropVal(alerts[i]);
    buffer
      ..write(val)
      ..write(",");
  }
  return buffer.toString();
}

String _createAlertConditionPropVal(AlertConditionSet alert) {
  final buffer = StringBuffer();
  for (var i = 0; i < alert.conditions.length; i++) {
    final cond = alert.conditions[i];
    switch (cond.type) {
      case AlertType.profit:
        return "p:${cond.value}";
      case AlertType.rank:
        return "r:${cond.value}";
      case AlertType.category:
        return "C";
      case AlertType.condition:
        switch (cond.value) {
          case 0:
            //新品
            return "c:n";
          case 1:
            // 中古全て
            return "c:u";
          case 2:
            // ほぼ新品
            return "c:m";
          case 3:
            // 非常に良い
            return "c:v";
          case 4:
            // 良い
            return "c:g";
          case 5:
            // 可
            return "c:a";
        }
        return "c";
      case AlertType.premium:
        return "pre";
      case AlertType.noAmazon:
        return "noA";
      case AlertType.noNewOffer:
        return "noN";
    }
  }
  return buffer.toString();
}
