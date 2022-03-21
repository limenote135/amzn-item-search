import 'package:amasearch/models/constants.dart';
import 'package:amasearch/models/enums/csv_columns.dart';
import 'package:amasearch/models/general_settings.dart';
import 'package:amasearch/models/keepa_settings.dart';
import 'package:amasearch/util/hive_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final generalSettingsControllerProvider =
    StateNotifierProvider<GeneralSettingsController, GeneralSettings>(
  (ref) => GeneralSettingsController(ref.read),
);

class GeneralSettingsController extends StateNotifier<GeneralSettings> {
  GeneralSettingsController(this._read) : super(const GeneralSettings()) {
    _loadSettings();
  }

  final Reader _read;

  void _loadSettings() {
    final box = _read(settingsBoxProvider);
    final settings = box.get(generalSettingsKeyName) as GeneralSettings?;
    if (settings != null) {
      state = settings;
    }
    // 新規追加された項目が、ロード時にデフォルト値になっている可能性があるので一度保存する
    box.put(generalSettingsKeyName, state);
  }

  void update({
    bool? isDarkMode,
    // 目標利益率設定
    bool? enableTargetProfit,
    int? targetProfitValue,
    int? minProfit,
    String? skuFormat,
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
  }) {
    final box = _read(settingsBoxProvider);
    state = state.copyWith(
      isDarkMode: isDarkMode ?? state.isDarkMode,
      enableTargetProfit: enableTargetProfit ?? state.enableTargetProfit,
      targetProfitValue: targetProfitValue ?? state.targetProfitValue,
      minProfit: minProfit ?? state.minProfit,
      skuFormat: skuFormat ?? state.skuFormat,
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
    );
    box.put(generalSettingsKeyName, state);
  }

  void addRetailer(String retailer) {
    final box = _read(settingsBoxProvider);
    final retailers = <String>[...state.retailers, retailer];
    state = state.copyWith(
      retailers: retailers,
    );
    box.put(generalSettingsKeyName, state);
  }

  void removeRetailer(int index) {
    final box = _read(settingsBoxProvider);
    final retailers = <String>[
      for (var i = 0; i < state.retailers.length; i++)
        if (i != index) state.retailers[i]
    ];
    state = state.copyWith(
      retailers: retailers,
    );
    box.put(generalSettingsKeyName, state);
  }

  void changeKeepaExtraParam() {
    final box = _read(settingsBoxProvider);
    final current = state.keepaSettings.extraParam;
    var next = "";
    switch (current) {
      case "":
        next = "&bb=0";
        break;
      case "&bb=0":
        next = "&yzoom=1";
        break;
      case "&yzoom=1":
        next = "&ld=0";
        break;
      case "&ld=0":
        next = "&wd=0";
        break;
      default:
        next = "";
        break;
    }
    state = state.copyWith(
      keepaSettings: state.keepaSettings.copyWith(
        extraParam: next,
      ),
    );
    box.put(generalSettingsKeyName, state);
  }
}
