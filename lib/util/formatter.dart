import 'package:intl/intl.dart';

final numberFormatter = NumberFormat("#,##0");
final dateFormatter = DateFormat.yMd().add_Hm();

extension DateExtension on DateTime {
  String format() {
    return dateFormatter.format(this);
  }
}