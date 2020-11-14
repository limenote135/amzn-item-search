import 'package:amasearch/models/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'general_settings.freezed.dart';
part 'general_settings.g.dart';

const _readAloudPattern1 = "{title}、新品利益{newProfit}円、"
    "中古利益{usedProfit}円、順位{rank}位です。";
const _readAloudPattern2 = "{title}、新品利益{newProfit}円、順位{rank}位です。";
const _readAloudPattern3 = "{title}、中古利益{usedProfit}円、順位{rank}位です。";

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
    @Default("<yyyy><mm><dd>-<asin>-<cond>-<purchasePrice>-<quantity>")
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
    @nullable
        double readAloudSpeed,
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
