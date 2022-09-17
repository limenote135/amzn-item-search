import 'package:amasearch/models/constants.dart';
import 'package:amasearch/models/enums/makad_payment_method.dart';
import 'package:amasearch/models/enums/makad_revise_rule.dart';
import 'package:amasearch/models/enums/pricetar_stopper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'makad_settings.freezed.dart';
part 'makad_settings.g.dart';

@freezed
class MakadSettings with _$MakadSettings {
  @HiveType(typeId: makadSettingsTypeId)
  const factory MakadSettings({
    @HiveField(0) @Default(MakadReviseRule.cart) MakadReviseRule newRule,
    @HiveField(1)
    @Default(MakadReviseRule.usedFbaSameCondition)
        MakadReviseRule usedRule,
    @HiveField(2)
    @Default(RevisePriceStopper.profitValue)
        RevisePriceStopper lowestStopperType,
    @HiveField(3) @Default(1) int lowestStopperValue,
    @HiveField(4)
    @Default(MakadPaymentMethod.all)
        MakadPaymentMethod paymentMethod,
  }) = _MakadSettings;
}
