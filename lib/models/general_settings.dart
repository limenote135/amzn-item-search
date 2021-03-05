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
    // SKU 設定
    @HiveField(3)
    @Default(_defaultSkuFormat)
        String skuFormat,
    // 仕入れ先設定
    @HiveField(4)
    @Default(<String>[])
        List<String> retailers,
    // 読み上げ設定
    @HiveField(5)
    @Default(false)
        bool enableReadAloud,
    @HiveField(6)
    @Default(0)
        int patternIndex,
    @HiveField(7)
    @Default([
      ReadAloudPattern(title: "パターン1", pattern: _readAloudPattern1),
      ReadAloudPattern(title: "パターン2", pattern: _readAloudPattern2),
      ReadAloudPattern(title: "パターン3", pattern: _readAloudPattern3),
    ])
        List<ReadAloudPattern> readAloudPatterns,
    @HiveField(8)
    @Default(1.0)
        double readAloudVolume,
    @HiveField(9)
        double readAloudSpeed,
    @HiveField(10)
    @Default([
      CustomButtonDetail(enable: false, title: "ボタン1", pattern: ""),
      CustomButtonDetail(enable: false, title: "ボタン2", pattern: ""),
      CustomButtonDetail(enable: false, title: "ボタン3", pattern: ""),
      CustomButtonDetail(enable: false, title: "ボタン4", pattern: ""),
      CustomButtonDetail(enable: false, title: "ボタン5", pattern: ""),
    ])
        List<CustomButtonDetail> customButtons,
    @HiveField(11)
    @Default([
      CsvColumn.asin,
      CsvColumn.jan,
      CsvColumn.title,
      CsvColumn.sellPrice,
      CsvColumn.purchasePrice,
      CsvColumn.profit,
      CsvColumn.listingPrice,
      CsvColumn.quantity,
      CsvColumn.condition,
      CsvColumn.shipment,
      CsvColumn.sku,
      CsvColumn.retailer,
      CsvColumn.comment,
      CsvColumn.purchaseDate
    ])
        List<CsvColumn> csvOrder,
    @HiveField(12)
    @Default(0)
        int minProfit,
    @HiveField(13)
    @Default(false)
        bool getStocks,
  }) = _GeneralSettings;
}

@freezed
abstract class ReadAloudPattern with _$ReadAloudPattern {
  @HiveType(typeId: readAloudPatternTypeId)
  const factory ReadAloudPattern({
    @HiveField(0) @required String title,
    @HiveField(1) @required String pattern,
  }) = _ReadAloudPattern;
}

@freezed
abstract class CustomButtonDetail with _$CustomButtonDetail {
  @HiveType(typeId: customButtonDetailTypeId)
  const factory CustomButtonDetail({
    @HiveField(0) @required bool enable,
    @HiveField(1) @required String title,
    @HiveField(2) @required String pattern,
  }) = _CustomButtonDetail;
}
