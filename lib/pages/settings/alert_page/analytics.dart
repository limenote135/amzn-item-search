import 'dart:convert';

import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/properties.dart';
import 'package:amasearch/models/general_settings.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void updateAlertConditionAnalytics(
    BuildContext context, List<AlertConditionSet> alerts) {
  final js = jsonEncode(alerts);
  context
      .read(analyticsControllerProvider)
      .setUserProp(alertSettingsPropname, js);
}
