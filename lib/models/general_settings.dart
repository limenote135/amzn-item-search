import 'package:amasearch/models/constants.dart';
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

@freezed
class GeneralSettings with _$GeneralSettings {
  @HiveType(typeId: generalSettingsTypeId)
  const factory GeneralSettings({
    @HiveField(0) @Default(false) bool isDarkMode,
    // 目標利益率設定
    @HiveField(1) @Default(false) bool enableTargetProfit,
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
    @HiveField(10)
    @Default(defaultCustomButtons)
        List<CustomButtonDetail> customButtons,
    @HiveField(11) @Default(_defaultCsvOrder) List<CsvColumn> csvOrder,
    @HiveField(12) @Default(0) int minProfit,
    @HiveField(13) @Default(false) bool getStocks,
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
