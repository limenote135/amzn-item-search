import 'package:flutter/material.dart';

void unfocus() {
  FocusManager.instance.primaryFocus?.unfocus();
}

bool isDark(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
}

String urlEncode(String str) {
  return Uri.encodeQueryComponent(str).replaceAll("+", "%20");
}

String currentTimeString({DateTime? time}) {
  return (time ?? DateTime.now()).toUtc().toIso8601String();
}
