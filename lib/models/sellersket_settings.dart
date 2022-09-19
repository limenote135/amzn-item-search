import 'package:amasearch/models/constants.dart';
import 'package:amasearch/models/enums/pricetar_stopper.dart';
import 'package:amasearch/models/enums/sellersket_revise_rule.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'sellersket_settings.freezed.dart';
part 'sellersket_settings.g.dart';

@freezed
class SellerSketSettings with _$SellerSketSettings {
  @HiveType(typeId: sellerSketSettingsTypeId)
  const factory SellerSketSettings({
    @HiveField(0)
    @Default(SellerSketReviseRule.cart)
        SellerSketReviseRule newRule,
    @HiveField(1)
    @Default(SellerSketReviseRule.fbaSameCondition)
        SellerSketReviseRule usedRule,
    @HiveField(2)
    @Default(RevisePriceStopper.profitValue)
        RevisePriceStopper lowestStopperType,
    @HiveField(3) @Default(1) int lowestStopperValue,
    @HiveField(4)
    @Default(RevisePriceStopper.nothing)
        RevisePriceStopper highestStopperType,
    @HiveField(5) @Default(0) int highestStopperValue,
    @HiveField(6) @Default("移行された配送パターン") String shippingPattern,
  }) = _SellerSketSettings;
}
