import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/properties.dart';
import 'package:amasearch/models/enums/alert_type.dart';
import 'package:amasearch/models/general_settings.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void updateAlertConditionAnalytics(
  BuildContext context,
  WidgetRef ref,
  List<AlertConditionSet> alerts,
) {
  final prop = _encodeAlertConditionToUserProps(alerts);
  ref
      .read(analyticsControllerProvider)
      .setUserProp(alertSettingsPropName, prop);
}

String _encodeAlertConditionToUserProps(List<AlertConditionSet> alerts) {
  final buffer = StringBuffer();
  for (var i = 0; i < alerts.length; i++) {
    final val = _createAlertConditionPropVal(alerts[i]);
    buffer.write(val);
  }
  return buffer.toString();
}

String _createAlertConditionPropVal(AlertConditionSet alert) {
  final buffer = StringBuffer()..write("(");
  for (var i = 0; i < alert.conditions.length; i++) {
    final cond = alert.conditions[i];
    switch (cond.type) {
      case AlertType.profit:
        buffer.write("p:${cond.value},");
        break;
      case AlertType.rank:
        buffer.write("r:${cond.value},");
        break;
      case AlertType.category:
        buffer.write("C,");
        break;
      case AlertType.condition:
        switch (cond.value) {
          case 0:
            //新品
            buffer.write("c:n,");
            break;
          case 1:
            // 中古全て
            buffer.write("c:u,");
            break;
          case 2:
            // ほぼ新品
            buffer.write("c:m,");
            break;
          case 3:
            // 非常に良い
            buffer.write("c:v,");
            break;
          case 4:
            // 良い
            buffer.write("c:g,");
            break;
          case 5:
            // 可
            buffer.write("c:a,");
            break;
        }
        buffer.write("c,");
        break;
      case AlertType.premium:
        buffer.write("pre,");
        break;
      case AlertType.noAmazon:
        buffer.write("noA");
        break;
      case AlertType.noNewOffer:
        buffer.write("noN");
        break;
    }
  }
  buffer.write(")");
  return buffer.toString();
}
