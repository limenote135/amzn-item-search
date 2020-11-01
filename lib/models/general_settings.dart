import 'package:amasearch/models/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'general_settings.freezed.dart';
part 'general_settings.g.dart';

@freezed
abstract class GeneralSettings with _$GeneralSettings {
  @HiveType(typeId: generalSettingsTypeId)
  const factory GeneralSettings({
    @HiveField(0)
    @Default(false)
        bool isDarkMode,
    // 目標利益率設定
    @HiveField(1)
    @Default(false)
        bool enableTargetProfit,
    @HiveField(2)
    @Default(10)
        int targetProfitValue,
  }) = _GeneralSettings;
}
