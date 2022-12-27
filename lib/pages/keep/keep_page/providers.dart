import 'package:riverpod/riverpod.dart';

enum KeepPageMode {
  normal,
  select,
}

final keepPageModeProvider = StateProvider((_) => KeepPageMode.normal);
final selectAllProvider = StateProvider((_) => false);
