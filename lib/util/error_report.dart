import 'package:firebase_crashlytics/firebase_crashlytics.dart';

Future<void> recordError(
  dynamic exception,
  StackTrace? stackTrace, {
  Iterable<String> information = const [],
  bool fatal = false,
}) async {
  final log = (StringBuffer()..writeAll(information, '\n')).toString();
  await FirebaseCrashlytics.instance.log(log);
  await FirebaseCrashlytics.instance
      .recordError(exception, stackTrace, fatal: fatal);
}
