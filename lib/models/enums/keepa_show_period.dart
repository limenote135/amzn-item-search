import 'package:amasearch/models/constants.dart';
import 'package:hive/hive.dart';

part 'keepa_show_period.g.dart';

@HiveType(typeId: keepaShowPeriodTypeId)
enum KeepaShowPeriod {
  @HiveField(0)
  day,
  @HiveField(1)
  week,
  @HiveField(2)
  month,
  @HiveField(3)
  threeMonth,
  @HiveField(4)
  year,
}

extension KeepaShowPeriodExtention on KeepaShowPeriod {
  String toValue() {
    switch (this) {
      case KeepaShowPeriod.day:
        return "1";
      case KeepaShowPeriod.week:
        return "7";
      case KeepaShowPeriod.month:
        return "31";
      case KeepaShowPeriod.threeMonth:
        return "90";
      case KeepaShowPeriod.year:
        return "365";
    }
  }
}
