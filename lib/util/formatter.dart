import 'package:intl/intl.dart';

// 3桁カンマ区切り
final numberFormatter = NumberFormat("#,##0");
// yyyy/M/d hh:mm
final dateFormatter = DateFormat.yMd().add_Hm();
final dateTimestampFormatter = DateFormat("yyyyMMdd_hhmm");
// yyyy/M/d
final dayFormatter = DateFormat.yMd();

extension DateExtension on DateTime {
  String format() {
    return dateFormatter.format(this);
  }

  String timestampFormat() {
    return dateTimestampFormatter.format(this);
  }

  String dayFormat() {
    return dayFormatter.format(this);
  }
}
