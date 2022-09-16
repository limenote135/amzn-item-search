import 'package:amasearch/models/constants.dart';
import 'package:hive/hive.dart';

part 'pricetar_stopper.g.dart';

@HiveType(typeId: pricetarStopperTypeId)
enum PricetarStopperType {
  @HiveField(0)
  nothing,
  @HiveField(1)
  listingPrice,
  @HiveField(2)
  profitValue,
  @HiveField(3)
  profitRate,
}

extension PricetarStopperTypeExtension on PricetarStopperType {
  String toDisplayString() {
    switch (this) {
      case PricetarStopperType.nothing:
        return "設定なし";
      case PricetarStopperType.listingPrice:
        return "出品価格からの割合";
      case PricetarStopperType.profitValue:
        return "利益額を指定";
      case PricetarStopperType.profitRate:
        return "利益率を指定";
    }
  }
}
