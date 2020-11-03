import 'package:intl/intl.dart';

final numberFormatter = NumberFormat("#,##0");
final dateFormatter = DateFormat.yMd().add_Hm();
final dayFormatter = DateFormat.yMd();

extension DateExtension on DateTime {
  String format() {
    return dateFormatter.format(this);
  }

  String dayFormat() {
    return dayFormatter.format(this);
  }
}
