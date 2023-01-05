import 'package:amasearch/models/constants.dart';
import 'package:hive/hive.dart';

part 'shortcut_type.g.dart';

const navigationTargetKeepa = "keepa";
const navigationTargetNewOffers = "newOffers";
const navigationTargetUsedOffers = "usedOffers";
const navigationTargetVariation = "variation";

@HiveType(typeId: shortcutTypeId)
enum ShortcutType {
  @HiveField(0)
  none,
  @HiveField(1)
  purchase,
  @HiveField(2)
  delete,
  @HiveField(3)
  web,
  @HiveField(4)
  navigation,
  @HiveField(5)
  keep,
}
