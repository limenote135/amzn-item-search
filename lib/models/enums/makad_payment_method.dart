import 'package:amasearch/models/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'makad_payment_method.g.dart';

@HiveType(typeId: makadPaymentMethodTypeId)
enum MakadPaymentMethod {
  @HiveField(0)
  all,
  @HiveField(1)
  excludeCashOnDelivery,
  @HiveField(2)
  excludeConvenience,
  @HiveField(3)
  excludeBoth;

  String get displayString {
    switch (this) {
      case MakadPaymentMethod.all:
        return "すべて許可";
      case MakadPaymentMethod.excludeCashOnDelivery:
        return "代金引換を制限";
      case MakadPaymentMethod.excludeConvenience:
        return "コンビニ決済を制限";
      case MakadPaymentMethod.excludeBoth:
        return "代金引換とコンビニ決済を制限";
    }
  }

  int get makadCsvValue {
    switch (this) {
      case MakadPaymentMethod.all:
        return 0;
      case MakadPaymentMethod.excludeCashOnDelivery:
        return 1;
      case MakadPaymentMethod.excludeConvenience:
        return 2;
      case MakadPaymentMethod.excludeBoth:
        return 3;
    }
  }
}
