import 'package:amasearch/models/constants.dart';
import 'package:hive/hive.dart';

part 'size_type.g.dart';

@HiveType(typeId: sizeTypeTypeId)
enum SizeType {
  @HiveField(0)
  normal,
  @HiveField(1)
  small,
  @HiveField(2)
  big,
  @HiveField(3)
  moreBig,
}
