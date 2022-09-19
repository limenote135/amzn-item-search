import 'package:amasearch/models/constants.dart';
import 'package:hive/hive.dart';

part 'pricetar_stopper.g.dart';

@HiveType(typeId: revisePriceStopperTypeId)
enum RevisePriceStopper {
  @HiveField(0)
  nothing,
  @HiveField(1)
  listingPrice,
  @HiveField(2)
  profitValue,
  @HiveField(3)
  profitRate,
}

extension RevisePriceStopperExtension on RevisePriceStopper {
  String toDisplayString() {
    switch (this) {
      case RevisePriceStopper.nothing:
        return "設定なし";
      case RevisePriceStopper.listingPrice:
        return "出品価格からの割合";
      case RevisePriceStopper.profitValue:
        return "利益額を指定";
      case RevisePriceStopper.profitRate:
        return "利益率を指定";
    }
  }
}
