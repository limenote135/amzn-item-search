import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'app.dart';

void main() {
  // TODO:
  Intl.defaultLocale = 'ja_JP';
  runApp(ProviderScope(child: MyApp()));
}
