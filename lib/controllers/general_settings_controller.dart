import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/properties.dart';
import 'package:amasearch/models/constants.dart';
import 'package:amasearch/models/enums/csv_columns.dart';
import 'package:amasearch/models/general_settings.dart';
import 'package:amasearch/models/general_settings_default.dart';
import 'package:amasearch/models/keepa_settings.dart';
import 'package:amasearch/models/makad_settings.dart';
import 'package:amasearch/models/pricetar_settings.dart';
import 'package:amasearch/models/sellersket_settings.dart';
import 'package:amasearch/util/hive_provider.dart';
import 'package:dartx/dartx.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final generalSettingsControllerProvider =
    StateNotifierProvider<GeneralSettingsController, GeneralSettings>(
  GeneralSettingsController.new,
);

class GeneralSettingsController extends StateNotifier<GeneralSettings> {
  GeneralSettingsController(this._ref) : super(const GeneralSettings()) {
    _loadSettings();
  }

  final Ref _ref;

  void _loadSettings() {
    final box = _ref.read(settingsBoxProvider);
    var settings = box.get(generalSettingsKeyName) as GeneralSettings?;
    if (settings != null) {
      // 小口設定の削除に伴うマイグレーション since v1.1.4
      if (!settings.isMajorCustomer) {
        settings = settings.copyWith(isMajorCustomer: true);
      }

      // カスタムボタンを増やした際のマイグレーション since v1.2.0
      var buttons = settings.customButtons;
      if (buttons.length == 12) {
        buttons = migrateCustomButtonsToV1_2_0(buttons);
        settings = settings.copyWith(customButtons: buttons);
      }

      // CSV にカラムを足した際のマイグレーション since v1.3.0
      if (settings.csvOrder.length == 15) {
        final newOrder = <CsvColumn>[
          ...settings.csvOrder,
          CsvColumn.otherCost,
          CsvColumn.conditionText,
        ];
        settings = settings.copyWith(csvOrder: newOrder);
      }

      // 重複がある場合、並べ替えがうまくいかない
      final uniqueRetailers = settings.retailers.distinct().toList();
      settings = settings.copyWith(retailers: uniqueRetailers);

      state = settings;

      final analytics = _ref.read(analyticsControllerProvider);
      if (settings.keepaSettings.useApiKey &&
          settings.keepaSettings.apiKey.isNotEmpty) {
        analytics.setUserProp(enableKeepaApiPropName, "true");
      } else {
        analytics.setUserProp(enableKeepaApiPropName, "false");
      }
    }
    // 新規追加された項目が、ロード時にデフォルト値になっている可能性があるので一度保存する
    box.put(generalSettingsKeyName, state);
  }

  List<CustomButtonDetail> migrateCustomButtonsToV1_2_0(
    List<CustomButtonDetail> current,
  ) {
    var migrationIndex = 0;
    final newButtons = <CustomButtonDetail>[];

    // 未使用ボタンに新しいプリセットを追加していく処理
    for (var i = 0; i < current.length; i++) {
      if (!current[i].enable && current[i].pattern == "") {
        newButtons.add(
          current[i].copyWith(
            title: migrationCustomButtons[migrationIndex].title,
            pattern: migrationCustomButtons[migrationIndex].pattern,
          ),
        );
        migrationIndex++;
      } else {
        newButtons.add(current[i]);
      }
    }

    // 新しくボタンを追加していく処理
    var buttonIndex = 1;
    for (var i = newButtons.length + 1; i <= 20; i++) {
      if (migrationIndex < migrationCustomButtons.length) {
        newButtons.add(
          migrationCustomButtons[migrationIndex].copyWith(
            id: "bt$i",
          ),
        );
        migrationIndex++;
      } else {
        newButtons.add(
          CustomButtonDetail(
            id: "bt$i",
            enable: false,
            title: "ボタン$buttonIndex",
            pattern: "",
          ),
        );
        buttonIndex++;
      }
    }
    return newButtons;
  }

  void update({
    bool? isDarkMode,
    // 目標利益率設定
    bool? enableTargetProfit,
    int? targetProfitValue,
    int? minProfit,
    String? skuFormat,
    List<String>? retailers,
    List<CustomButtonDetail>? customButtons,
    bool? enableReadAloud,
    int? patternIndex,
    List<ReadAloudPattern>? patterns,
    double? readAloudVolume,
    double? readAloudSpeed,
    List<CsvColumn>? csvOrder,
    bool? getStocks,
    bool? enableAlert,
    List<AlertConditionSet>? alerts,
    bool? enableAlertVibration,
    bool? isMajorCustomer,
    KeepaSettings? keepaSettings,
    List<ShortcutDetail>? leftShortcut,
    List<ShortcutDetail>? rightShortcut,
    List<String>? newConditionTexts,
    int? newConditionTextIndex,
    List<String>? usedConditionTexts,
    int? usedConditionTextIndex,
    PricetarSettings? pricetarSettings,
    MakadSettings? makadSettings,
    SellerSketSettings? sellerSketSettings,
    Map<String, bool>? standardButtons,
  }) {
    final box = _ref.read(settingsBoxProvider);
    state = state.copyWith(
      isDarkMode: isDarkMode ?? state.isDarkMode,
      enableTargetProfit: enableTargetProfit ?? state.enableTargetProfit,
      targetProfitValue: targetProfitValue ?? state.targetProfitValue,
      minProfit: minProfit ?? state.minProfit,
      skuFormat: skuFormat ?? state.skuFormat,
      retailers: retailers ?? state.retailers,
      customButtons: customButtons ?? state.customButtons,
      enableReadAloud: enableReadAloud ?? state.enableReadAloud,
      patternIndex: patternIndex ?? state.patternIndex,
      readAloudPatterns: patterns ?? state.readAloudPatterns,
      readAloudVolume: readAloudVolume ?? state.readAloudVolume,
      readAloudSpeed: readAloudSpeed ?? state.readAloudSpeed,
      csvOrder: csvOrder ?? state.csvOrder,
      getStocks: getStocks ?? state.getStocks,
      enableAlert: enableAlert ?? state.enableAlert,
      alerts: alerts ?? state.alerts,
      enableAlertVibration: enableAlertVibration ?? state.enableAlertVibration,
      isMajorCustomer: isMajorCustomer ?? state.isMajorCustomer,
      keepaSettings: keepaSettings ?? state.keepaSettings,
      leftSlideShortcut: leftShortcut ?? state.leftSlideShortcut,
      rightSlideShortcut: rightShortcut ?? state.rightSlideShortcut,
      newConditionTexts: newConditionTexts ?? state.newConditionTexts,
      newConditionTextIndex:
          newConditionTextIndex ?? state.newConditionTextIndex,
      usedConditionTexts: usedConditionTexts ?? state.usedConditionTexts,
      usedConditionTextIndex:
          usedConditionTextIndex ?? state.usedConditionTextIndex,
      pricetarSettings: pricetarSettings ?? state.pricetarSettings,
      makadSettings: makadSettings ?? state.makadSettings,
      sellerSketSettings: sellerSketSettings ?? state.sellerSketSettings,
      standardButtons: standardButtons ?? state.standardButtons,
    );
    box.put(generalSettingsKeyName, state);
  }

  void changeKeepaExtraParam() {
    final box = _ref.read(settingsBoxProvider);
    final current = state.keepaSettings.extraParam;
    var next = "";
    switch (current) {
      case "":
        next = "&bb=0";
      case "&bb=0":
        next = "&yzoom=1";
      case "&yzoom=1":
        next = "&ld=0";
      case "&ld=0":
        next = "&wd=0";
      default:
        next = "";
    }
    state = state.copyWith(
      keepaSettings: state.keepaSettings.copyWith(
        extraParam: next,
      ),
    );
    box.put(generalSettingsKeyName, state);
  }
}
