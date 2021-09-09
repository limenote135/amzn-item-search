import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

Future<void> recordError(
  dynamic exception,
  StackTrace? stackTrace, {
  Iterable<DiagnosticsNode> information = const [],
  bool fatal = false,
}) async {
  final log = (StringBuffer()..writeAll(information, '\n')).toString();
  await FirebaseCrashlytics.instance.log(log);
  await FirebaseCrashlytics.instance.recordError(exception, stackTrace,
      information: information, fatal: fatal);
}
