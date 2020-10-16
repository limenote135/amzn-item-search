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
  @HiveField(4)
  freeWord,
}

extension SearchTypeExtension on SearchType {
  String toDisplayString() {
    switch (this) {
      case SearchType.jan:
        return "JAN";
      case SearchType.bookoff:
        return "BOOK OFF";
      case SearchType.geo:
        return "GEO";
      case SearchType.tsutaya:
        return "TSUTAYA";
      case SearchType.freeWord:
        return "フリーワード";
    }
    throw Exception("Unknown SearchType: $this");
  }
}
