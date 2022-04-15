import 'package:amasearch/models/constants.dart';
import 'package:amasearch/models/enums/keepa_show_period.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'keepa_settings.freezed.dart';
part 'keepa_settings.g.dart';

@freezed
class KeepaSettings with _$KeepaSettings {
  @HiveType(typeId: keepaSettingsTypeId)
  const factory KeepaSettings({
    @HiveField(0, defaultValue: true) @Default(true) bool showNew,
    @HiveField(1, defaultValue: true) @Default(true) bool showUsed,
    @HiveField(2, defaultValue: true) @Default(true) bool showAmazon,
    @HiveField(3, defaultValue: KeepaShowPeriod.month)
    @Default(KeepaShowPeriod.month)
        KeepaShowPeriod period,
    @HiveField(4, defaultValue: "") @Default("") String extraParam,
    @HiveField(5, defaultValue: true) @Default(true) bool showBuyBox,
    @HiveField(6, defaultValue: false) @Default(false) bool showFba,
  }) = _KeepaSettings;
}
