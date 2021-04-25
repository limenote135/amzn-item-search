import 'package:amasearch/models/alert_condition.dart';
import 'package:amasearch/models/constants.dart';
import 'package:amasearch/models/enums/alert_type.dart';
import 'package:amasearch/models/enums/csv_columns.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'general_settings.freezed.dart';
part 'general_settings.g.dart';

const _defaultSkuFormat =
    "{yyyy}{mm}{dd}-{asin}-{cond}-{purchasePrice}-{quantity}";

const _readAloudPattern1 = "{title}、新品利益{newProfit}、"
    "中古利益{usedProfit}、順位{rank}です。";
const _readAloudPattern2 = "{title}、新品利益{newProfit}、順位{rank}です。";
const _readAloudPattern3 = "{title}、中古利益{usedProfit}、順位{rank}です。";

const _defaultReadAloudPatterns = [
  ReadAloudPattern(title: "パターン1", pattern: _readAloudPattern1),
  ReadAloudPattern(title: "パターン2", pattern: _readAloudPattern2),
  ReadAloudPattern(title: "パターン3", pattern: _readAloudPattern3),
];

const customButtonAmazonUrl = "https://www.amazon.co.jp/gp/product/{asin}/";
const customButtonKeepaUrl = "https://keepa.com/#!product/5-{asin}/";
const customButtonDeltaUrl = "https://delta-tracer.com/item/detail/jp/{asin}/";
const customButtonMonoSearchUrl = "https://mnsearch.com/item?kwd={asin}";
const customButtonKeezonUrl = "https://keezon.net/item/index?ASIN={asin}";
const customButtonMercariUrl =
    "https://www.mercari.com/jp/search/?keyword={title}";
const customButtonAmazonStockUrl =
    "https://sellercentral.amazon.co.jp/inventory/ref=xx_invmgr_dnav_home?tbla_myitable=search:{asin};";
const customButtonAmazonListableUrl =
    "https://sellercentral.amazon.co.jp/abis/listing/syh?asin={asin}";

const defaultCustomButtons = [
  CustomButtonDetail(
      enable: true, title: "Amazon", pattern: customButtonAmazonUrl),
  CustomButtonDetail(
      enable: true, title: "出品確認", pattern: customButtonAmazonListableUrl),
  CustomButtonDetail(
      enable: true, title: "Delta", pattern: customButtonDeltaUrl),
  CustomButtonDetail(
      enable: true, title: "モノサーチ", pattern: customButtonMonoSearchUrl),
  CustomButtonDetail(
      enable: false, title: "Keezon", pattern: customButtonKeezonUrl),
  CustomButtonDetail(
      enable: false, title: "メルカリ", pattern: customButtonMercariUrl),
  CustomButtonDetail(
      enable: false, title: "在庫", pattern: customButtonAmazonStockUrl),
  CustomButtonDetail(enable: false, title: "ボタン1", pattern: ""),
  CustomButtonDetail(enable: false, title: "ボタン2", pattern: ""),
  CustomButtonDetail(enable: false, title: "ボタン3", pattern: ""),
  CustomButtonDetail(enable: false, title: "ボタン4", pattern: ""),
  CustomButtonDetail(enable: false, title: "ボタン5", pattern: ""),
];

const _defaultCsvOrder = [
  CsvColumn.asin,
  CsvColumn.jan,
  CsvColumn.title,
  CsvColumn.sellPrice,
  CsvColumn.purchasePrice,
  CsvColumn.profit,
  CsvColumn.listingPrice,
  CsvColumn.breakEven,
  CsvColumn.quantity,
  CsvColumn.condition,
  CsvColumn.shipment,
  CsvColumn.sku,
  CsvColumn.retailer,
  CsvColumn.comment,
  CsvColumn.purchaseDate,
];

const _defaultAlert = [
  AlertConditionSet(
    id: "default",
    title: "プレ値",
    conditions: [
      AlertCondition(type: AlertType.premium),
    ],
  ),
];

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
    @HiveField(3) @Default(_defaultSkuFormat) String skuFormat,
    // 仕入れ先設定
    @HiveField(4) @Default(<String>[]) List<String> retailers,
    // 読み上げ設定
    @HiveField(5) @Default(false) bool enableReadAloud,
    @HiveField(6) @Default(0) int patternIndex,
    @HiveField(7)
    @Default(_defaultReadAloudPatterns)
        List<ReadAloudPattern> readAloudPatterns,
    @HiveField(8) @Default(1.0) double readAloudVolume,
    @HiveField(9) double? readAloudSpeed,
    // カスタムボタン設定
    @HiveField(10, defaultValue: defaultCustomButtons)
    @Default(defaultCustomButtons)
        List<CustomButtonDetail> customButtons,
    // CSV の並び順
    @HiveField(11, defaultValue: _defaultCsvOrder)
    @Default(_defaultCsvOrder)
        List<CsvColumn> csvOrder,
    // 最低利益額
    @HiveField(12, defaultValue: 0) @Default(0) int minProfit,
    // 在庫の取得設定
    @HiveField(13, defaultValue: false) @Default(false) bool getStocks,
    // アラート設定
    @HiveField(14, defaultValue: true) @Default(true) bool enableAlert,
    @HiveField(15, defaultValue: _defaultAlert)
    @Default(_defaultAlert)
        List<AlertConditionSet> alerts,
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
