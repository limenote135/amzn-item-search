import 'package:amasearch/models/constants.dart';
import 'package:hive/hive.dart';

part 'search_type.g.dart';

@HiveType(typeId: searchTypeTypeId)
enum SearchType {
  @HiveField(0)
  jan,
  @HiveField(1)
  bookoff,
  @HiveField(2)
  geo,
  @HiveField(3)
  tsutaya,
}
