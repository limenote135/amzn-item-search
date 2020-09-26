import 'package:amasearch/models/constants.dart';
import 'package:amasearch/models/item.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchItemBoxProvider =
    Provider((_) => Hive.box<Item>(searchItemBoxName));
