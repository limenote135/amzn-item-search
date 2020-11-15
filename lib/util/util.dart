import 'package:flutter/material.dart';

void unfocus() {
  FocusManager.instance.primaryFocus?.unfocus();
}

bool isDark(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
}

