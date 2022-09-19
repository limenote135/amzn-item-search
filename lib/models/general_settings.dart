import 'package:amasearch/models/alert_condition.dart';
import 'package:amasearch/models/constants.dart';
import 'package:amasearch/models/enums/alert_type.dart';
import 'package:amasearch/models/enums/csv_columns.dart';
import 'package:amasearch/models/enums/shortcut_type.dart';
import 'package:amasearch/models/makad_settings.dart';
import 'package:amasearch/models/pricetar_settings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'general_settings_default.dart';
import 'keepa_settings.dart';

part 'general_settings.freezed.dart';
part 'general_settings.g.dart';

@freezed
class GeneralSettings with _$GeneralSettings {
  @HiveType(typeId: generalSettingsTypeId)
  const factory GeneralSettings({
    // ダークモード
    @HiveField(0) @Default(false) bool isDarkMode,
    // 目標利益率設定
    @HiveField(1) @Default(false) bool enableTargetProfit,
    // 目標利益率
    @HiveField(2) @Default(10) int targetProfitValue,
    // SKU 設定
    @HiveField(3) @Default(defaultSkuFormat) String skuFormat,
    // 仕入れ先設定
    @HiveField(4) @Default(<String>[]) List<String> retailers,
    // 読み上げ設定
    @HiveField(5) @Default(false) bool enableReadAloud,
    @HiveField(6) @Default(0) int patternIndex,
    @HiveField(7)
    @Default(defaultReadAloudPatterns)
        List<ReadAloudPattern> readAloudPatterns,
    @HiveField(8) @Default(1.0) double readAloudVolume,
    @HiveField(9) double? readAloudSpeed,
    // カスタムボタン設定
    @HiveField(10, defaultValue: defaultCustomButtons)
    @Default(defaultCustomButtons)
        List<CustomButtonDetail> customButtons,
    // CSV の並び順
    @HiveField(11, defaultValue: defaultCsvOrder)
    @Default(defaultCsvOrder)
        List<CsvColumn> csvOrder,
    // 最低利益額
    @HiveField(12, defaultValue: 0) @Default(0) int minProfit,
    // 在庫の取得設定
    @HiveField(13, defaultValue: false) @Default(false) bool getStocks,
    // アラート設定
    @HiveField(14, defaultValue: true) @Default(true) bool enableAlert,
    @HiveField(15, defaultValue: defaultAlert)
    @Default(defaultAlert)
        List<AlertConditionSet> alerts,
    @HiveField(16, defaultValue: false)
    @Default(false)
        bool enableAlertVibration,
    @HiveField(17, defaultValue: true) @Default(true) bool isMajorCustomer,
    @HiveField(18, defaultValue: defaultKeepaSettings)
    @Default(defaultKeepaSettings)
        KeepaSettings keepaSettings,
    @HiveField(19, defaultValue: defaultLeftShortcut)
    @Default(defaultLeftShortcut)
        List<ShortcutDetail> leftSlideShortcut,
    @HiveField(20, defaultValue: defaultRightShortcut)
    @Default(defaultRightShortcut)
        List<ShortcutDetail> rightSlideShortcut,
    @HiveField(21, defaultValue: defaultNewConditionTexts)
    @Default(defaultNewConditionTexts)
        List<String> newConditionTexts,
    @HiveField(22, defaultValue: 0) @Default(0) int newConditionTextIndex,
    @HiveField(23, defaultValue: defaultUsedConditionText)
    @Default(defaultUsedConditionText)
        List<String> usedConditionTexts,
    @HiveField(24, defaultValue: 0) @Default(0) int usedConditionTextIndex,
    @HiveField(25, defaultValue: defaultPricetarSettings)
    @Default(defaultPricetarSettings)
        PricetarSettings pricetarSettings,
    @HiveField(26, defaultValue: defaultMakadSettings)
    @Default(defaultMakadSettings)
        MakadSettings makadSettings,
  }) = _GeneralSettings;
}

@freezed
class ReadAloudPattern with _$ReadAloudPattern {
  @HiveType(typeId: readAloudPatternTypeId)
  const factory ReadAloudPattern({
    @HiveField(0) required String title,
    @HiveField(1) required String pattern,
  }) = _ReadAloudPattern;
}

@freezed
class CustomButtonDetail with _$CustomButtonDetail {
  @HiveType(typeId: customButtonDetailTypeId)
  const factory CustomButtonDetail({
    @HiveField(0) required bool enable,
    @HiveField(1) required String title,
    @HiveField(2) required String pattern,
    @HiveField(3, defaultValue: "") required String id,
  }) = _CustomButtonDetail;
}

@freezed
class AlertConditionSet with _$AlertConditionSet {
  @HiveType(typeId: alertConditionSetTypeId)
  const factory AlertConditionSet({
    @HiveField(0) required String id,
    @HiveField(1) @JsonKey(name: "t") required String title,
    @HiveField(2)
    @JsonKey(name: "c")
    @Default(<AlertCondition>[])
        List<AlertCondition> conditions,
  }) = _AlertConditionSet;

  factory AlertConditionSet.fromJson(Map<String, dynamic> json) =>
      _$AlertConditionSetFromJson(json);
}

@freezed
class ShortcutDetail with _$ShortcutDetail {
  @HiveType(typeId: shortcutDetailTypeId)
  const factory ShortcutDetail({
    @HiveField(0) required ShortcutType type,
    @HiveField(1) @Default("") String param,
  }) = _ShortcutDetail;

  factory ShortcutDetail.fromJson(Map<String, dynamic> json) =>
      _$ShortcutDetailFromJson(json);
}
