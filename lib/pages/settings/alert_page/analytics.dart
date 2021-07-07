import 'dart:convert';

import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/properties.dart';
import 'package:amasearch/models/general_settings.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void updateAlertConditionAnalytics(
    BuildContext context, WidgetRef ref, List<AlertConditionSet> alerts) {
  final js = jsonEncode(alerts);
  ref.read(analyticsControllerProvider).setUserProp(alertSettingsPropName, js);
}
