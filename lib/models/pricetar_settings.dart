import 'package:amasearch/models/constants.dart';
import 'package:amasearch/models/enums/pricetar_rule.dart';
import 'package:amasearch/models/enums/pricetar_stopper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'pricetar_settings.freezed.dart';
part 'pricetar_settings.g.dart';

@freezed
class PricetarSettings with _$PricetarSettings {
  @HiveType(typeId: pricetarSettingsTypeId)
  const factory PricetarSettings({
    @HiveField(0) @Default(PricetarRule.cart) PricetarRule newRule,
    @HiveField(1) @Default(PricetarRule.fbaSameCondition) PricetarRule usedRule,
    @HiveField(2)
    @Default(RevisePriceStopper.profitValue)
        RevisePriceStopper lowestStopperType,
    @HiveField(3) @Default(1) int lowestStopperValue,
    @HiveField(4)
    @Default(RevisePriceStopper.nothing)
        RevisePriceStopper highestStopperType,
    @HiveField(5) @Default(0) int highestStopperValue,
  }) = _PricetarSettings;
}
