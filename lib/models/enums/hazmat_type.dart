import 'package:amasearch/models/constants.dart';
import 'package:hive/hive.dart';

part 'hazmat_type.g.dart';

@HiveType(typeId: hazmatTypeId)
enum HazmatType {
  @HiveField(0)
  nonHazmat,
  @HiveField(1)
  sds,
  @HiveField(2)
  battery,
  @HiveField(3)
  warn,
  @HiveField(4)
  hazmat,
  @HiveField(5)
  unknown,
  @HiveField(6)
  qualification,
}
