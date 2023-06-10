// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'general_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GeneralSettings {
// ダークモード
  @HiveField(0)
  bool get isDarkMode => throw _privateConstructorUsedError; // 目標利益率設定
  @HiveField(1)
  bool get enableTargetProfit => throw _privateConstructorUsedError; // 目標利益率
  @HiveField(2)
  int get targetProfitValue => throw _privateConstructorUsedError; // SKU 設定
  @HiveField(3)
  String get skuFormat => throw _privateConstructorUsedError; // 仕入れ先設定
  @HiveField(4)
  List<String> get retailers => throw _privateConstructorUsedError; // 読み上げ設定
  @HiveField(5)
  bool get enableReadAloud => throw _privateConstructorUsedError;
  @HiveField(6)
  int get patternIndex => throw _privateConstructorUsedError;
  @HiveField(7)
  List<ReadAloudPattern> get readAloudPatterns =>
      throw _privateConstructorUsedError;
  @HiveField(8)
  double get readAloudVolume => throw _privateConstructorUsedError;
  @HiveField(9)
  double? get readAloudSpeed => throw _privateConstructorUsedError; // カスタムボタン設定
  @HiveField(10, defaultValue: defaultCustomButtons)
  List<CustomButtonDetail> get customButtons =>
      throw _privateConstructorUsedError; // CSV の並び順
  @HiveField(11, defaultValue: defaultCsvOrder)
  List<CsvColumn> get csvOrder => throw _privateConstructorUsedError; // 最低利益額
  @HiveField(12, defaultValue: 0)
  int get minProfit => throw _privateConstructorUsedError; // 在庫の取得設定
  @HiveField(13, defaultValue: false)
  bool get getStocks => throw _privateConstructorUsedError; // アラート設定
  @HiveField(14, defaultValue: true)
  bool get enableAlert => throw _privateConstructorUsedError;
  @HiveField(15, defaultValue: defaultAlert)
  List<AlertConditionSet> get alerts => throw _privateConstructorUsedError;
  @HiveField(16, defaultValue: false)
  bool get enableAlertVibration => throw _privateConstructorUsedError;
  @HiveField(17, defaultValue: true)
  bool get isMajorCustomer => throw _privateConstructorUsedError;
  @HiveField(18, defaultValue: defaultKeepaSettings)
  KeepaSettings get keepaSettings => throw _privateConstructorUsedError;
  @HiveField(19, defaultValue: defaultLeftShortcut)
  List<ShortcutDetail> get leftSlideShortcut =>
      throw _privateConstructorUsedError;
  @HiveField(20, defaultValue: defaultRightShortcut)
  List<ShortcutDetail> get rightSlideShortcut =>
      throw _privateConstructorUsedError;
  @HiveField(21, defaultValue: defaultNewConditionTexts)
  List<String> get newConditionTexts => throw _privateConstructorUsedError;
  @HiveField(22, defaultValue: 0)
  int get newConditionTextIndex => throw _privateConstructorUsedError;
  @HiveField(23, defaultValue: defaultUsedConditionText)
  List<String> get usedConditionTexts => throw _privateConstructorUsedError;
  @HiveField(24, defaultValue: 0)
  int get usedConditionTextIndex => throw _privateConstructorUsedError;
  @HiveField(25, defaultValue: defaultPricetarSettings)
  PricetarSettings get pricetarSettings => throw _privateConstructorUsedError;
  @HiveField(26, defaultValue: defaultMakadSettings)
  MakadSettings get makadSettings => throw _privateConstructorUsedError;
  @HiveField(27, defaultValue: defaultSellerSketSettings)
  SellerSketSettings get sellerSketSettings =>
      throw _privateConstructorUsedError;
  @HiveField(28, defaultValue: defaultStandardButtons)
  Map<String, bool> get standardButtons => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GeneralSettingsCopyWith<GeneralSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneralSettingsCopyWith<$Res> {
  factory $GeneralSettingsCopyWith(
          GeneralSettings value, $Res Function(GeneralSettings) then) =
      _$GeneralSettingsCopyWithImpl<$Res, GeneralSettings>;
  @useResult
  $Res call(
      {@HiveField(0)
          bool isDarkMode,
      @HiveField(1)
          bool enableTargetProfit,
      @HiveField(2)
          int targetProfitValue,
      @HiveField(3)
          String skuFormat,
      @HiveField(4)
          List<String> retailers,
      @HiveField(5)
          bool enableReadAloud,
      @HiveField(6)
          int patternIndex,
      @HiveField(7)
          List<ReadAloudPattern> readAloudPatterns,
      @HiveField(8)
          double readAloudVolume,
      @HiveField(9)
          double? readAloudSpeed,
      @HiveField(10, defaultValue: defaultCustomButtons)
          List<CustomButtonDetail> customButtons,
      @HiveField(11, defaultValue: defaultCsvOrder)
          List<CsvColumn> csvOrder,
      @HiveField(12, defaultValue: 0)
          int minProfit,
      @HiveField(13, defaultValue: false)
          bool getStocks,
      @HiveField(14, defaultValue: true)
          bool enableAlert,
      @HiveField(15, defaultValue: defaultAlert)
          List<AlertConditionSet> alerts,
      @HiveField(16, defaultValue: false)
          bool enableAlertVibration,
      @HiveField(17, defaultValue: true)
          bool isMajorCustomer,
      @HiveField(18, defaultValue: defaultKeepaSettings)
          KeepaSettings keepaSettings,
      @HiveField(19, defaultValue: defaultLeftShortcut)
          List<ShortcutDetail> leftSlideShortcut,
      @HiveField(20, defaultValue: defaultRightShortcut)
          List<ShortcutDetail> rightSlideShortcut,
      @HiveField(21, defaultValue: defaultNewConditionTexts)
          List<String> newConditionTexts,
      @HiveField(22, defaultValue: 0)
          int newConditionTextIndex,
      @HiveField(23, defaultValue: defaultUsedConditionText)
          List<String> usedConditionTexts,
      @HiveField(24, defaultValue: 0)
          int usedConditionTextIndex,
      @HiveField(25, defaultValue: defaultPricetarSettings)
          PricetarSettings pricetarSettings,
      @HiveField(26, defaultValue: defaultMakadSettings)
          MakadSettings makadSettings,
      @HiveField(27, defaultValue: defaultSellerSketSettings)
          SellerSketSettings sellerSketSettings,
      @HiveField(28, defaultValue: defaultStandardButtons)
          Map<String, bool> standardButtons});

  $KeepaSettingsCopyWith<$Res> get keepaSettings;
  $PricetarSettingsCopyWith<$Res> get pricetarSettings;
  $MakadSettingsCopyWith<$Res> get makadSettings;
  $SellerSketSettingsCopyWith<$Res> get sellerSketSettings;
}

/// @nodoc
class _$GeneralSettingsCopyWithImpl<$Res, $Val extends GeneralSettings>
    implements $GeneralSettingsCopyWith<$Res> {
  _$GeneralSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDarkMode = null,
    Object? enableTargetProfit = null,
    Object? targetProfitValue = null,
    Object? skuFormat = null,
    Object? retailers = null,
    Object? enableReadAloud = null,
    Object? patternIndex = null,
    Object? readAloudPatterns = null,
    Object? readAloudVolume = null,
    Object? readAloudSpeed = freezed,
    Object? customButtons = null,
    Object? csvOrder = null,
    Object? minProfit = null,
    Object? getStocks = null,
    Object? enableAlert = null,
    Object? alerts = null,
    Object? enableAlertVibration = null,
    Object? isMajorCustomer = null,
    Object? keepaSettings = null,
    Object? leftSlideShortcut = null,
    Object? rightSlideShortcut = null,
    Object? newConditionTexts = null,
    Object? newConditionTextIndex = null,
    Object? usedConditionTexts = null,
    Object? usedConditionTextIndex = null,
    Object? pricetarSettings = null,
    Object? makadSettings = null,
    Object? sellerSketSettings = null,
    Object? standardButtons = null,
  }) {
    return _then(_value.copyWith(
      isDarkMode: null == isDarkMode
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      enableTargetProfit: null == enableTargetProfit
          ? _value.enableTargetProfit
          : enableTargetProfit // ignore: cast_nullable_to_non_nullable
              as bool,
      targetProfitValue: null == targetProfitValue
          ? _value.targetProfitValue
          : targetProfitValue // ignore: cast_nullable_to_non_nullable
              as int,
      skuFormat: null == skuFormat
          ? _value.skuFormat
          : skuFormat // ignore: cast_nullable_to_non_nullable
              as String,
      retailers: null == retailers
          ? _value.retailers
          : retailers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      enableReadAloud: null == enableReadAloud
          ? _value.enableReadAloud
          : enableReadAloud // ignore: cast_nullable_to_non_nullable
              as bool,
      patternIndex: null == patternIndex
          ? _value.patternIndex
          : patternIndex // ignore: cast_nullable_to_non_nullable
              as int,
      readAloudPatterns: null == readAloudPatterns
          ? _value.readAloudPatterns
          : readAloudPatterns // ignore: cast_nullable_to_non_nullable
              as List<ReadAloudPattern>,
      readAloudVolume: null == readAloudVolume
          ? _value.readAloudVolume
          : readAloudVolume // ignore: cast_nullable_to_non_nullable
              as double,
      readAloudSpeed: freezed == readAloudSpeed
          ? _value.readAloudSpeed
          : readAloudSpeed // ignore: cast_nullable_to_non_nullable
              as double?,
      customButtons: null == customButtons
          ? _value.customButtons
          : customButtons // ignore: cast_nullable_to_non_nullable
              as List<CustomButtonDetail>,
      csvOrder: null == csvOrder
          ? _value.csvOrder
          : csvOrder // ignore: cast_nullable_to_non_nullable
              as List<CsvColumn>,
      minProfit: null == minProfit
          ? _value.minProfit
          : minProfit // ignore: cast_nullable_to_non_nullable
              as int,
      getStocks: null == getStocks
          ? _value.getStocks
          : getStocks // ignore: cast_nullable_to_non_nullable
              as bool,
      enableAlert: null == enableAlert
          ? _value.enableAlert
          : enableAlert // ignore: cast_nullable_to_non_nullable
              as bool,
      alerts: null == alerts
          ? _value.alerts
          : alerts // ignore: cast_nullable_to_non_nullable
              as List<AlertConditionSet>,
      enableAlertVibration: null == enableAlertVibration
          ? _value.enableAlertVibration
          : enableAlertVibration // ignore: cast_nullable_to_non_nullable
              as bool,
      isMajorCustomer: null == isMajorCustomer
          ? _value.isMajorCustomer
          : isMajorCustomer // ignore: cast_nullable_to_non_nullable
              as bool,
      keepaSettings: null == keepaSettings
          ? _value.keepaSettings
          : keepaSettings // ignore: cast_nullable_to_non_nullable
              as KeepaSettings,
      leftSlideShortcut: null == leftSlideShortcut
          ? _value.leftSlideShortcut
          : leftSlideShortcut // ignore: cast_nullable_to_non_nullable
              as List<ShortcutDetail>,
      rightSlideShortcut: null == rightSlideShortcut
          ? _value.rightSlideShortcut
          : rightSlideShortcut // ignore: cast_nullable_to_non_nullable
              as List<ShortcutDetail>,
      newConditionTexts: null == newConditionTexts
          ? _value.newConditionTexts
          : newConditionTexts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      newConditionTextIndex: null == newConditionTextIndex
          ? _value.newConditionTextIndex
          : newConditionTextIndex // ignore: cast_nullable_to_non_nullable
              as int,
      usedConditionTexts: null == usedConditionTexts
          ? _value.usedConditionTexts
          : usedConditionTexts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      usedConditionTextIndex: null == usedConditionTextIndex
          ? _value.usedConditionTextIndex
          : usedConditionTextIndex // ignore: cast_nullable_to_non_nullable
              as int,
      pricetarSettings: null == pricetarSettings
          ? _value.pricetarSettings
          : pricetarSettings // ignore: cast_nullable_to_non_nullable
              as PricetarSettings,
      makadSettings: null == makadSettings
          ? _value.makadSettings
          : makadSettings // ignore: cast_nullable_to_non_nullable
              as MakadSettings,
      sellerSketSettings: null == sellerSketSettings
          ? _value.sellerSketSettings
          : sellerSketSettings // ignore: cast_nullable_to_non_nullable
              as SellerSketSettings,
      standardButtons: null == standardButtons
          ? _value.standardButtons
          : standardButtons // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $KeepaSettingsCopyWith<$Res> get keepaSettings {
    return $KeepaSettingsCopyWith<$Res>(_value.keepaSettings, (value) {
      return _then(_value.copyWith(keepaSettings: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PricetarSettingsCopyWith<$Res> get pricetarSettings {
    return $PricetarSettingsCopyWith<$Res>(_value.pricetarSettings, (value) {
      return _then(_value.copyWith(pricetarSettings: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MakadSettingsCopyWith<$Res> get makadSettings {
    return $MakadSettingsCopyWith<$Res>(_value.makadSettings, (value) {
      return _then(_value.copyWith(makadSettings: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SellerSketSettingsCopyWith<$Res> get sellerSketSettings {
    return $SellerSketSettingsCopyWith<$Res>(_value.sellerSketSettings,
        (value) {
      return _then(_value.copyWith(sellerSketSettings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GeneralSettingsCopyWith<$Res>
    implements $GeneralSettingsCopyWith<$Res> {
  factory _$$_GeneralSettingsCopyWith(
          _$_GeneralSettings value, $Res Function(_$_GeneralSettings) then) =
      __$$_GeneralSettingsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0)
          bool isDarkMode,
      @HiveField(1)
          bool enableTargetProfit,
      @HiveField(2)
          int targetProfitValue,
      @HiveField(3)
          String skuFormat,
      @HiveField(4)
          List<String> retailers,
      @HiveField(5)
          bool enableReadAloud,
      @HiveField(6)
          int patternIndex,
      @HiveField(7)
          List<ReadAloudPattern> readAloudPatterns,
      @HiveField(8)
          double readAloudVolume,
      @HiveField(9)
          double? readAloudSpeed,
      @HiveField(10, defaultValue: defaultCustomButtons)
          List<CustomButtonDetail> customButtons,
      @HiveField(11, defaultValue: defaultCsvOrder)
          List<CsvColumn> csvOrder,
      @HiveField(12, defaultValue: 0)
          int minProfit,
      @HiveField(13, defaultValue: false)
          bool getStocks,
      @HiveField(14, defaultValue: true)
          bool enableAlert,
      @HiveField(15, defaultValue: defaultAlert)
          List<AlertConditionSet> alerts,
      @HiveField(16, defaultValue: false)
          bool enableAlertVibration,
      @HiveField(17, defaultValue: true)
          bool isMajorCustomer,
      @HiveField(18, defaultValue: defaultKeepaSettings)
          KeepaSettings keepaSettings,
      @HiveField(19, defaultValue: defaultLeftShortcut)
          List<ShortcutDetail> leftSlideShortcut,
      @HiveField(20, defaultValue: defaultRightShortcut)
          List<ShortcutDetail> rightSlideShortcut,
      @HiveField(21, defaultValue: defaultNewConditionTexts)
          List<String> newConditionTexts,
      @HiveField(22, defaultValue: 0)
          int newConditionTextIndex,
      @HiveField(23, defaultValue: defaultUsedConditionText)
          List<String> usedConditionTexts,
      @HiveField(24, defaultValue: 0)
          int usedConditionTextIndex,
      @HiveField(25, defaultValue: defaultPricetarSettings)
          PricetarSettings pricetarSettings,
      @HiveField(26, defaultValue: defaultMakadSettings)
          MakadSettings makadSettings,
      @HiveField(27, defaultValue: defaultSellerSketSettings)
          SellerSketSettings sellerSketSettings,
      @HiveField(28, defaultValue: defaultStandardButtons)
          Map<String, bool> standardButtons});

  @override
  $KeepaSettingsCopyWith<$Res> get keepaSettings;
  @override
  $PricetarSettingsCopyWith<$Res> get pricetarSettings;
  @override
  $MakadSettingsCopyWith<$Res> get makadSettings;
  @override
  $SellerSketSettingsCopyWith<$Res> get sellerSketSettings;
}

/// @nodoc
class __$$_GeneralSettingsCopyWithImpl<$Res>
    extends _$GeneralSettingsCopyWithImpl<$Res, _$_GeneralSettings>
    implements _$$_GeneralSettingsCopyWith<$Res> {
  __$$_GeneralSettingsCopyWithImpl(
      _$_GeneralSettings _value, $Res Function(_$_GeneralSettings) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDarkMode = null,
    Object? enableTargetProfit = null,
    Object? targetProfitValue = null,
    Object? skuFormat = null,
    Object? retailers = null,
    Object? enableReadAloud = null,
    Object? patternIndex = null,
    Object? readAloudPatterns = null,
    Object? readAloudVolume = null,
    Object? readAloudSpeed = freezed,
    Object? customButtons = null,
    Object? csvOrder = null,
    Object? minProfit = null,
    Object? getStocks = null,
    Object? enableAlert = null,
    Object? alerts = null,
    Object? enableAlertVibration = null,
    Object? isMajorCustomer = null,
    Object? keepaSettings = null,
    Object? leftSlideShortcut = null,
    Object? rightSlideShortcut = null,
    Object? newConditionTexts = null,
    Object? newConditionTextIndex = null,
    Object? usedConditionTexts = null,
    Object? usedConditionTextIndex = null,
    Object? pricetarSettings = null,
    Object? makadSettings = null,
    Object? sellerSketSettings = null,
    Object? standardButtons = null,
  }) {
    return _then(_$_GeneralSettings(
      isDarkMode: null == isDarkMode
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      enableTargetProfit: null == enableTargetProfit
          ? _value.enableTargetProfit
          : enableTargetProfit // ignore: cast_nullable_to_non_nullable
              as bool,
      targetProfitValue: null == targetProfitValue
          ? _value.targetProfitValue
          : targetProfitValue // ignore: cast_nullable_to_non_nullable
              as int,
      skuFormat: null == skuFormat
          ? _value.skuFormat
          : skuFormat // ignore: cast_nullable_to_non_nullable
              as String,
      retailers: null == retailers
          ? _value._retailers
          : retailers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      enableReadAloud: null == enableReadAloud
          ? _value.enableReadAloud
          : enableReadAloud // ignore: cast_nullable_to_non_nullable
              as bool,
      patternIndex: null == patternIndex
          ? _value.patternIndex
          : patternIndex // ignore: cast_nullable_to_non_nullable
              as int,
      readAloudPatterns: null == readAloudPatterns
          ? _value._readAloudPatterns
          : readAloudPatterns // ignore: cast_nullable_to_non_nullable
              as List<ReadAloudPattern>,
      readAloudVolume: null == readAloudVolume
          ? _value.readAloudVolume
          : readAloudVolume // ignore: cast_nullable_to_non_nullable
              as double,
      readAloudSpeed: freezed == readAloudSpeed
          ? _value.readAloudSpeed
          : readAloudSpeed // ignore: cast_nullable_to_non_nullable
              as double?,
      customButtons: null == customButtons
          ? _value._customButtons
          : customButtons // ignore: cast_nullable_to_non_nullable
              as List<CustomButtonDetail>,
      csvOrder: null == csvOrder
          ? _value._csvOrder
          : csvOrder // ignore: cast_nullable_to_non_nullable
              as List<CsvColumn>,
      minProfit: null == minProfit
          ? _value.minProfit
          : minProfit // ignore: cast_nullable_to_non_nullable
              as int,
      getStocks: null == getStocks
          ? _value.getStocks
          : getStocks // ignore: cast_nullable_to_non_nullable
              as bool,
      enableAlert: null == enableAlert
          ? _value.enableAlert
          : enableAlert // ignore: cast_nullable_to_non_nullable
              as bool,
      alerts: null == alerts
          ? _value._alerts
          : alerts // ignore: cast_nullable_to_non_nullable
              as List<AlertConditionSet>,
      enableAlertVibration: null == enableAlertVibration
          ? _value.enableAlertVibration
          : enableAlertVibration // ignore: cast_nullable_to_non_nullable
              as bool,
      isMajorCustomer: null == isMajorCustomer
          ? _value.isMajorCustomer
          : isMajorCustomer // ignore: cast_nullable_to_non_nullable
              as bool,
      keepaSettings: null == keepaSettings
          ? _value.keepaSettings
          : keepaSettings // ignore: cast_nullable_to_non_nullable
              as KeepaSettings,
      leftSlideShortcut: null == leftSlideShortcut
          ? _value._leftSlideShortcut
          : leftSlideShortcut // ignore: cast_nullable_to_non_nullable
              as List<ShortcutDetail>,
      rightSlideShortcut: null == rightSlideShortcut
          ? _value._rightSlideShortcut
          : rightSlideShortcut // ignore: cast_nullable_to_non_nullable
              as List<ShortcutDetail>,
      newConditionTexts: null == newConditionTexts
          ? _value._newConditionTexts
          : newConditionTexts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      newConditionTextIndex: null == newConditionTextIndex
          ? _value.newConditionTextIndex
          : newConditionTextIndex // ignore: cast_nullable_to_non_nullable
              as int,
      usedConditionTexts: null == usedConditionTexts
          ? _value._usedConditionTexts
          : usedConditionTexts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      usedConditionTextIndex: null == usedConditionTextIndex
          ? _value.usedConditionTextIndex
          : usedConditionTextIndex // ignore: cast_nullable_to_non_nullable
              as int,
      pricetarSettings: null == pricetarSettings
          ? _value.pricetarSettings
          : pricetarSettings // ignore: cast_nullable_to_non_nullable
              as PricetarSettings,
      makadSettings: null == makadSettings
          ? _value.makadSettings
          : makadSettings // ignore: cast_nullable_to_non_nullable
              as MakadSettings,
      sellerSketSettings: null == sellerSketSettings
          ? _value.sellerSketSettings
          : sellerSketSettings // ignore: cast_nullable_to_non_nullable
              as SellerSketSettings,
      standardButtons: null == standardButtons
          ? _value._standardButtons
          : standardButtons // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
    ));
  }
}

/// @nodoc

@HiveType(typeId: generalSettingsTypeId)
class _$_GeneralSettings implements _GeneralSettings {
  const _$_GeneralSettings(
      {@HiveField(0)
          this.isDarkMode = false,
      @HiveField(1)
          this.enableTargetProfit = false,
      @HiveField(2)
          this.targetProfitValue = 10,
      @HiveField(3)
          this.skuFormat = defaultSkuFormat,
      @HiveField(4)
          final List<String> retailers = const <String>[],
      @HiveField(5)
          this.enableReadAloud = false,
      @HiveField(6)
          this.patternIndex = 0,
      @HiveField(7)
          final List<ReadAloudPattern>
              readAloudPatterns = defaultReadAloudPatterns,
      @HiveField(8)
          this.readAloudVolume = 1.0,
      @HiveField(9)
          this.readAloudSpeed,
      @HiveField(10, defaultValue: defaultCustomButtons)
          final List<CustomButtonDetail> customButtons = defaultCustomButtons,
      @HiveField(11, defaultValue: defaultCsvOrder)
          final List<CsvColumn> csvOrder = defaultCsvOrder,
      @HiveField(12, defaultValue: 0)
          this.minProfit = 0,
      @HiveField(13, defaultValue: false)
          this.getStocks = false,
      @HiveField(14, defaultValue: true)
          this.enableAlert = true,
      @HiveField(15, defaultValue: defaultAlert)
          final List<AlertConditionSet> alerts = defaultAlert,
      @HiveField(16, defaultValue: false)
          this.enableAlertVibration = false,
      @HiveField(17, defaultValue: true)
          this.isMajorCustomer = true,
      @HiveField(18, defaultValue: defaultKeepaSettings)
          this.keepaSettings = defaultKeepaSettings,
      @HiveField(19, defaultValue: defaultLeftShortcut)
          final List<ShortcutDetail> leftSlideShortcut = defaultLeftShortcut,
      @HiveField(20, defaultValue: defaultRightShortcut)
          final List<ShortcutDetail> rightSlideShortcut = defaultRightShortcut,
      @HiveField(21, defaultValue: defaultNewConditionTexts)
          final List<String> newConditionTexts = defaultNewConditionTexts,
      @HiveField(22, defaultValue: 0)
          this.newConditionTextIndex = 0,
      @HiveField(23, defaultValue: defaultUsedConditionText)
          final List<String> usedConditionTexts = defaultUsedConditionText,
      @HiveField(24, defaultValue: 0)
          this.usedConditionTextIndex = 0,
      @HiveField(25, defaultValue: defaultPricetarSettings)
          this.pricetarSettings = defaultPricetarSettings,
      @HiveField(26, defaultValue: defaultMakadSettings)
          this.makadSettings = defaultMakadSettings,
      @HiveField(27, defaultValue: defaultSellerSketSettings)
          this.sellerSketSettings = defaultSellerSketSettings,
      @HiveField(28, defaultValue: defaultStandardButtons)
          final Map<String, bool> standardButtons = defaultStandardButtons})
      : _retailers = retailers,
        _readAloudPatterns = readAloudPatterns,
        _customButtons = customButtons,
        _csvOrder = csvOrder,
        _alerts = alerts,
        _leftSlideShortcut = leftSlideShortcut,
        _rightSlideShortcut = rightSlideShortcut,
        _newConditionTexts = newConditionTexts,
        _usedConditionTexts = usedConditionTexts,
        _standardButtons = standardButtons;

// ダークモード
  @override
  @JsonKey()
  @HiveField(0)
  final bool isDarkMode;
// 目標利益率設定
  @override
  @JsonKey()
  @HiveField(1)
  final bool enableTargetProfit;
// 目標利益率
  @override
  @JsonKey()
  @HiveField(2)
  final int targetProfitValue;
// SKU 設定
  @override
  @JsonKey()
  @HiveField(3)
  final String skuFormat;
// 仕入れ先設定
  final List<String> _retailers;
// 仕入れ先設定
  @override
  @JsonKey()
  @HiveField(4)
  List<String> get retailers {
    if (_retailers is EqualUnmodifiableListView) return _retailers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_retailers);
  }

// 読み上げ設定
  @override
  @JsonKey()
  @HiveField(5)
  final bool enableReadAloud;
  @override
  @JsonKey()
  @HiveField(6)
  final int patternIndex;
  final List<ReadAloudPattern> _readAloudPatterns;
  @override
  @JsonKey()
  @HiveField(7)
  List<ReadAloudPattern> get readAloudPatterns {
    if (_readAloudPatterns is EqualUnmodifiableListView)
      return _readAloudPatterns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_readAloudPatterns);
  }

  @override
  @JsonKey()
  @HiveField(8)
  final double readAloudVolume;
  @override
  @HiveField(9)
  final double? readAloudSpeed;
// カスタムボタン設定
  final List<CustomButtonDetail> _customButtons;
// カスタムボタン設定
  @override
  @JsonKey()
  @HiveField(10, defaultValue: defaultCustomButtons)
  List<CustomButtonDetail> get customButtons {
    if (_customButtons is EqualUnmodifiableListView) return _customButtons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customButtons);
  }

// CSV の並び順
  final List<CsvColumn> _csvOrder;
// CSV の並び順
  @override
  @JsonKey()
  @HiveField(11, defaultValue: defaultCsvOrder)
  List<CsvColumn> get csvOrder {
    if (_csvOrder is EqualUnmodifiableListView) return _csvOrder;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_csvOrder);
  }

// 最低利益額
  @override
  @JsonKey()
  @HiveField(12, defaultValue: 0)
  final int minProfit;
// 在庫の取得設定
  @override
  @JsonKey()
  @HiveField(13, defaultValue: false)
  final bool getStocks;
// アラート設定
  @override
  @JsonKey()
  @HiveField(14, defaultValue: true)
  final bool enableAlert;
  final List<AlertConditionSet> _alerts;
  @override
  @JsonKey()
  @HiveField(15, defaultValue: defaultAlert)
  List<AlertConditionSet> get alerts {
    if (_alerts is EqualUnmodifiableListView) return _alerts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_alerts);
  }

  @override
  @JsonKey()
  @HiveField(16, defaultValue: false)
  final bool enableAlertVibration;
  @override
  @JsonKey()
  @HiveField(17, defaultValue: true)
  final bool isMajorCustomer;
  @override
  @JsonKey()
  @HiveField(18, defaultValue: defaultKeepaSettings)
  final KeepaSettings keepaSettings;
  final List<ShortcutDetail> _leftSlideShortcut;
  @override
  @JsonKey()
  @HiveField(19, defaultValue: defaultLeftShortcut)
  List<ShortcutDetail> get leftSlideShortcut {
    if (_leftSlideShortcut is EqualUnmodifiableListView)
      return _leftSlideShortcut;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_leftSlideShortcut);
  }

  final List<ShortcutDetail> _rightSlideShortcut;
  @override
  @JsonKey()
  @HiveField(20, defaultValue: defaultRightShortcut)
  List<ShortcutDetail> get rightSlideShortcut {
    if (_rightSlideShortcut is EqualUnmodifiableListView)
      return _rightSlideShortcut;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rightSlideShortcut);
  }

  final List<String> _newConditionTexts;
  @override
  @JsonKey()
  @HiveField(21, defaultValue: defaultNewConditionTexts)
  List<String> get newConditionTexts {
    if (_newConditionTexts is EqualUnmodifiableListView)
      return _newConditionTexts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newConditionTexts);
  }

  @override
  @JsonKey()
  @HiveField(22, defaultValue: 0)
  final int newConditionTextIndex;
  final List<String> _usedConditionTexts;
  @override
  @JsonKey()
  @HiveField(23, defaultValue: defaultUsedConditionText)
  List<String> get usedConditionTexts {
    if (_usedConditionTexts is EqualUnmodifiableListView)
      return _usedConditionTexts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_usedConditionTexts);
  }

  @override
  @JsonKey()
  @HiveField(24, defaultValue: 0)
  final int usedConditionTextIndex;
  @override
  @JsonKey()
  @HiveField(25, defaultValue: defaultPricetarSettings)
  final PricetarSettings pricetarSettings;
  @override
  @JsonKey()
  @HiveField(26, defaultValue: defaultMakadSettings)
  final MakadSettings makadSettings;
  @override
  @JsonKey()
  @HiveField(27, defaultValue: defaultSellerSketSettings)
  final SellerSketSettings sellerSketSettings;
  final Map<String, bool> _standardButtons;
  @override
  @JsonKey()
  @HiveField(28, defaultValue: defaultStandardButtons)
  Map<String, bool> get standardButtons {
    if (_standardButtons is EqualUnmodifiableMapView) return _standardButtons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_standardButtons);
  }

  @override
  String toString() {
    return 'GeneralSettings(isDarkMode: $isDarkMode, enableTargetProfit: $enableTargetProfit, targetProfitValue: $targetProfitValue, skuFormat: $skuFormat, retailers: $retailers, enableReadAloud: $enableReadAloud, patternIndex: $patternIndex, readAloudPatterns: $readAloudPatterns, readAloudVolume: $readAloudVolume, readAloudSpeed: $readAloudSpeed, customButtons: $customButtons, csvOrder: $csvOrder, minProfit: $minProfit, getStocks: $getStocks, enableAlert: $enableAlert, alerts: $alerts, enableAlertVibration: $enableAlertVibration, isMajorCustomer: $isMajorCustomer, keepaSettings: $keepaSettings, leftSlideShortcut: $leftSlideShortcut, rightSlideShortcut: $rightSlideShortcut, newConditionTexts: $newConditionTexts, newConditionTextIndex: $newConditionTextIndex, usedConditionTexts: $usedConditionTexts, usedConditionTextIndex: $usedConditionTextIndex, pricetarSettings: $pricetarSettings, makadSettings: $makadSettings, sellerSketSettings: $sellerSketSettings, standardButtons: $standardButtons)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GeneralSettings &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode) &&
            (identical(other.enableTargetProfit, enableTargetProfit) ||
                other.enableTargetProfit == enableTargetProfit) &&
            (identical(other.targetProfitValue, targetProfitValue) ||
                other.targetProfitValue == targetProfitValue) &&
            (identical(other.skuFormat, skuFormat) ||
                other.skuFormat == skuFormat) &&
            const DeepCollectionEquality()
                .equals(other._retailers, _retailers) &&
            (identical(other.enableReadAloud, enableReadAloud) ||
                other.enableReadAloud == enableReadAloud) &&
            (identical(other.patternIndex, patternIndex) ||
                other.patternIndex == patternIndex) &&
            const DeepCollectionEquality()
                .equals(other._readAloudPatterns, _readAloudPatterns) &&
            (identical(other.readAloudVolume, readAloudVolume) ||
                other.readAloudVolume == readAloudVolume) &&
            (identical(other.readAloudSpeed, readAloudSpeed) ||
                other.readAloudSpeed == readAloudSpeed) &&
            const DeepCollectionEquality()
                .equals(other._customButtons, _customButtons) &&
            const DeepCollectionEquality().equals(other._csvOrder, _csvOrder) &&
            (identical(other.minProfit, minProfit) ||
                other.minProfit == minProfit) &&
            (identical(other.getStocks, getStocks) ||
                other.getStocks == getStocks) &&
            (identical(other.enableAlert, enableAlert) ||
                other.enableAlert == enableAlert) &&
            const DeepCollectionEquality().equals(other._alerts, _alerts) &&
            (identical(other.enableAlertVibration, enableAlertVibration) ||
                other.enableAlertVibration == enableAlertVibration) &&
            (identical(other.isMajorCustomer, isMajorCustomer) ||
                other.isMajorCustomer == isMajorCustomer) &&
            (identical(other.keepaSettings, keepaSettings) ||
                other.keepaSettings == keepaSettings) &&
            const DeepCollectionEquality()
                .equals(other._leftSlideShortcut, _leftSlideShortcut) &&
            const DeepCollectionEquality()
                .equals(other._rightSlideShortcut, _rightSlideShortcut) &&
            const DeepCollectionEquality()
                .equals(other._newConditionTexts, _newConditionTexts) &&
            (identical(other.newConditionTextIndex, newConditionTextIndex) ||
                other.newConditionTextIndex == newConditionTextIndex) &&
            const DeepCollectionEquality()
                .equals(other._usedConditionTexts, _usedConditionTexts) &&
            (identical(other.usedConditionTextIndex, usedConditionTextIndex) ||
                other.usedConditionTextIndex == usedConditionTextIndex) &&
            (identical(other.pricetarSettings, pricetarSettings) ||
                other.pricetarSettings == pricetarSettings) &&
            (identical(other.makadSettings, makadSettings) ||
                other.makadSettings == makadSettings) &&
            (identical(other.sellerSketSettings, sellerSketSettings) ||
                other.sellerSketSettings == sellerSketSettings) &&
            const DeepCollectionEquality()
                .equals(other._standardButtons, _standardButtons));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isDarkMode,
        enableTargetProfit,
        targetProfitValue,
        skuFormat,
        const DeepCollectionEquality().hash(_retailers),
        enableReadAloud,
        patternIndex,
        const DeepCollectionEquality().hash(_readAloudPatterns),
        readAloudVolume,
        readAloudSpeed,
        const DeepCollectionEquality().hash(_customButtons),
        const DeepCollectionEquality().hash(_csvOrder),
        minProfit,
        getStocks,
        enableAlert,
        const DeepCollectionEquality().hash(_alerts),
        enableAlertVibration,
        isMajorCustomer,
        keepaSettings,
        const DeepCollectionEquality().hash(_leftSlideShortcut),
        const DeepCollectionEquality().hash(_rightSlideShortcut),
        const DeepCollectionEquality().hash(_newConditionTexts),
        newConditionTextIndex,
        const DeepCollectionEquality().hash(_usedConditionTexts),
        usedConditionTextIndex,
        pricetarSettings,
        makadSettings,
        sellerSketSettings,
        const DeepCollectionEquality().hash(_standardButtons)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GeneralSettingsCopyWith<_$_GeneralSettings> get copyWith =>
      __$$_GeneralSettingsCopyWithImpl<_$_GeneralSettings>(this, _$identity);
}

abstract class _GeneralSettings implements GeneralSettings {
  const factory _GeneralSettings(
      {@HiveField(0)
          final bool isDarkMode,
      @HiveField(1)
          final bool enableTargetProfit,
      @HiveField(2)
          final int targetProfitValue,
      @HiveField(3)
          final String skuFormat,
      @HiveField(4)
          final List<String> retailers,
      @HiveField(5)
          final bool enableReadAloud,
      @HiveField(6)
          final int patternIndex,
      @HiveField(7)
          final List<ReadAloudPattern> readAloudPatterns,
      @HiveField(8)
          final double readAloudVolume,
      @HiveField(9)
          final double? readAloudSpeed,
      @HiveField(10, defaultValue: defaultCustomButtons)
          final List<CustomButtonDetail> customButtons,
      @HiveField(11, defaultValue: defaultCsvOrder)
          final List<CsvColumn> csvOrder,
      @HiveField(12, defaultValue: 0)
          final int minProfit,
      @HiveField(13, defaultValue: false)
          final bool getStocks,
      @HiveField(14, defaultValue: true)
          final bool enableAlert,
      @HiveField(15, defaultValue: defaultAlert)
          final List<AlertConditionSet> alerts,
      @HiveField(16, defaultValue: false)
          final bool enableAlertVibration,
      @HiveField(17, defaultValue: true)
          final bool isMajorCustomer,
      @HiveField(18, defaultValue: defaultKeepaSettings)
          final KeepaSettings keepaSettings,
      @HiveField(19, defaultValue: defaultLeftShortcut)
          final List<ShortcutDetail> leftSlideShortcut,
      @HiveField(20, defaultValue: defaultRightShortcut)
          final List<ShortcutDetail> rightSlideShortcut,
      @HiveField(21, defaultValue: defaultNewConditionTexts)
          final List<String> newConditionTexts,
      @HiveField(22, defaultValue: 0)
          final int newConditionTextIndex,
      @HiveField(23, defaultValue: defaultUsedConditionText)
          final List<String> usedConditionTexts,
      @HiveField(24, defaultValue: 0)
          final int usedConditionTextIndex,
      @HiveField(25, defaultValue: defaultPricetarSettings)
          final PricetarSettings pricetarSettings,
      @HiveField(26, defaultValue: defaultMakadSettings)
          final MakadSettings makadSettings,
      @HiveField(27, defaultValue: defaultSellerSketSettings)
          final SellerSketSettings sellerSketSettings,
      @HiveField(28, defaultValue: defaultStandardButtons)
          final Map<String, bool> standardButtons}) = _$_GeneralSettings;

  @override // ダークモード
  @HiveField(0)
  bool get isDarkMode;
  @override // 目標利益率設定
  @HiveField(1)
  bool get enableTargetProfit;
  @override // 目標利益率
  @HiveField(2)
  int get targetProfitValue;
  @override // SKU 設定
  @HiveField(3)
  String get skuFormat;
  @override // 仕入れ先設定
  @HiveField(4)
  List<String> get retailers;
  @override // 読み上げ設定
  @HiveField(5)
  bool get enableReadAloud;
  @override
  @HiveField(6)
  int get patternIndex;
  @override
  @HiveField(7)
  List<ReadAloudPattern> get readAloudPatterns;
  @override
  @HiveField(8)
  double get readAloudVolume;
  @override
  @HiveField(9)
  double? get readAloudSpeed;
  @override // カスタムボタン設定
  @HiveField(10, defaultValue: defaultCustomButtons)
  List<CustomButtonDetail> get customButtons;
  @override // CSV の並び順
  @HiveField(11, defaultValue: defaultCsvOrder)
  List<CsvColumn> get csvOrder;
  @override // 最低利益額
  @HiveField(12, defaultValue: 0)
  int get minProfit;
  @override // 在庫の取得設定
  @HiveField(13, defaultValue: false)
  bool get getStocks;
  @override // アラート設定
  @HiveField(14, defaultValue: true)
  bool get enableAlert;
  @override
  @HiveField(15, defaultValue: defaultAlert)
  List<AlertConditionSet> get alerts;
  @override
  @HiveField(16, defaultValue: false)
  bool get enableAlertVibration;
  @override
  @HiveField(17, defaultValue: true)
  bool get isMajorCustomer;
  @override
  @HiveField(18, defaultValue: defaultKeepaSettings)
  KeepaSettings get keepaSettings;
  @override
  @HiveField(19, defaultValue: defaultLeftShortcut)
  List<ShortcutDetail> get leftSlideShortcut;
  @override
  @HiveField(20, defaultValue: defaultRightShortcut)
  List<ShortcutDetail> get rightSlideShortcut;
  @override
  @HiveField(21, defaultValue: defaultNewConditionTexts)
  List<String> get newConditionTexts;
  @override
  @HiveField(22, defaultValue: 0)
  int get newConditionTextIndex;
  @override
  @HiveField(23, defaultValue: defaultUsedConditionText)
  List<String> get usedConditionTexts;
  @override
  @HiveField(24, defaultValue: 0)
  int get usedConditionTextIndex;
  @override
  @HiveField(25, defaultValue: defaultPricetarSettings)
  PricetarSettings get pricetarSettings;
  @override
  @HiveField(26, defaultValue: defaultMakadSettings)
  MakadSettings get makadSettings;
  @override
  @HiveField(27, defaultValue: defaultSellerSketSettings)
  SellerSketSettings get sellerSketSettings;
  @override
  @HiveField(28, defaultValue: defaultStandardButtons)
  Map<String, bool> get standardButtons;
  @override
  @JsonKey(ignore: true)
  _$$_GeneralSettingsCopyWith<_$_GeneralSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReadAloudPattern {
  @HiveField(0)
  String get title => throw _privateConstructorUsedError;
  @HiveField(1)
  String get pattern => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReadAloudPatternCopyWith<ReadAloudPattern> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadAloudPatternCopyWith<$Res> {
  factory $ReadAloudPatternCopyWith(
          ReadAloudPattern value, $Res Function(ReadAloudPattern) then) =
      _$ReadAloudPatternCopyWithImpl<$Res, ReadAloudPattern>;
  @useResult
  $Res call({@HiveField(0) String title, @HiveField(1) String pattern});
}

/// @nodoc
class _$ReadAloudPatternCopyWithImpl<$Res, $Val extends ReadAloudPattern>
    implements $ReadAloudPatternCopyWith<$Res> {
  _$ReadAloudPatternCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? pattern = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      pattern: null == pattern
          ? _value.pattern
          : pattern // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReadAloudPatternCopyWith<$Res>
    implements $ReadAloudPatternCopyWith<$Res> {
  factory _$$_ReadAloudPatternCopyWith(
          _$_ReadAloudPattern value, $Res Function(_$_ReadAloudPattern) then) =
      __$$_ReadAloudPatternCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) String title, @HiveField(1) String pattern});
}

/// @nodoc
class __$$_ReadAloudPatternCopyWithImpl<$Res>
    extends _$ReadAloudPatternCopyWithImpl<$Res, _$_ReadAloudPattern>
    implements _$$_ReadAloudPatternCopyWith<$Res> {
  __$$_ReadAloudPatternCopyWithImpl(
      _$_ReadAloudPattern _value, $Res Function(_$_ReadAloudPattern) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? pattern = null,
  }) {
    return _then(_$_ReadAloudPattern(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      pattern: null == pattern
          ? _value.pattern
          : pattern // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@HiveType(typeId: readAloudPatternTypeId)
class _$_ReadAloudPattern implements _ReadAloudPattern {
  const _$_ReadAloudPattern(
      {@HiveField(0) required this.title, @HiveField(1) required this.pattern});

  @override
  @HiveField(0)
  final String title;
  @override
  @HiveField(1)
  final String pattern;

  @override
  String toString() {
    return 'ReadAloudPattern(title: $title, pattern: $pattern)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReadAloudPattern &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.pattern, pattern) || other.pattern == pattern));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, pattern);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReadAloudPatternCopyWith<_$_ReadAloudPattern> get copyWith =>
      __$$_ReadAloudPatternCopyWithImpl<_$_ReadAloudPattern>(this, _$identity);
}

abstract class _ReadAloudPattern implements ReadAloudPattern {
  const factory _ReadAloudPattern(
      {@HiveField(0) required final String title,
      @HiveField(1) required final String pattern}) = _$_ReadAloudPattern;

  @override
  @HiveField(0)
  String get title;
  @override
  @HiveField(1)
  String get pattern;
  @override
  @JsonKey(ignore: true)
  _$$_ReadAloudPatternCopyWith<_$_ReadAloudPattern> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CustomButtonDetail {
  @HiveField(0)
  bool get enable => throw _privateConstructorUsedError;
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;
  @HiveField(2)
  String get pattern => throw _privateConstructorUsedError;
  @HiveField(3, defaultValue: "")
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomButtonDetailCopyWith<CustomButtonDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomButtonDetailCopyWith<$Res> {
  factory $CustomButtonDetailCopyWith(
          CustomButtonDetail value, $Res Function(CustomButtonDetail) then) =
      _$CustomButtonDetailCopyWithImpl<$Res, CustomButtonDetail>;
  @useResult
  $Res call(
      {@HiveField(0) bool enable,
      @HiveField(1) String title,
      @HiveField(2) String pattern,
      @HiveField(3, defaultValue: "") String id});
}

/// @nodoc
class _$CustomButtonDetailCopyWithImpl<$Res, $Val extends CustomButtonDetail>
    implements $CustomButtonDetailCopyWith<$Res> {
  _$CustomButtonDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enable = null,
    Object? title = null,
    Object? pattern = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      enable: null == enable
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      pattern: null == pattern
          ? _value.pattern
          : pattern // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomButtonDetailCopyWith<$Res>
    implements $CustomButtonDetailCopyWith<$Res> {
  factory _$$_CustomButtonDetailCopyWith(_$_CustomButtonDetail value,
          $Res Function(_$_CustomButtonDetail) then) =
      __$$_CustomButtonDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) bool enable,
      @HiveField(1) String title,
      @HiveField(2) String pattern,
      @HiveField(3, defaultValue: "") String id});
}

/// @nodoc
class __$$_CustomButtonDetailCopyWithImpl<$Res>
    extends _$CustomButtonDetailCopyWithImpl<$Res, _$_CustomButtonDetail>
    implements _$$_CustomButtonDetailCopyWith<$Res> {
  __$$_CustomButtonDetailCopyWithImpl(
      _$_CustomButtonDetail _value, $Res Function(_$_CustomButtonDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enable = null,
    Object? title = null,
    Object? pattern = null,
    Object? id = null,
  }) {
    return _then(_$_CustomButtonDetail(
      enable: null == enable
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      pattern: null == pattern
          ? _value.pattern
          : pattern // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@HiveType(typeId: customButtonDetailTypeId)
class _$_CustomButtonDetail implements _CustomButtonDetail {
  const _$_CustomButtonDetail(
      {@HiveField(0) required this.enable,
      @HiveField(1) required this.title,
      @HiveField(2) required this.pattern,
      @HiveField(3, defaultValue: "") required this.id});

  @override
  @HiveField(0)
  final bool enable;
  @override
  @HiveField(1)
  final String title;
  @override
  @HiveField(2)
  final String pattern;
  @override
  @HiveField(3, defaultValue: "")
  final String id;

  @override
  String toString() {
    return 'CustomButtonDetail(enable: $enable, title: $title, pattern: $pattern, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomButtonDetail &&
            (identical(other.enable, enable) || other.enable == enable) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.pattern, pattern) || other.pattern == pattern) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enable, title, pattern, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomButtonDetailCopyWith<_$_CustomButtonDetail> get copyWith =>
      __$$_CustomButtonDetailCopyWithImpl<_$_CustomButtonDetail>(
          this, _$identity);
}

abstract class _CustomButtonDetail implements CustomButtonDetail {
  const factory _CustomButtonDetail(
          {@HiveField(0) required final bool enable,
          @HiveField(1) required final String title,
          @HiveField(2) required final String pattern,
          @HiveField(3, defaultValue: "") required final String id}) =
      _$_CustomButtonDetail;

  @override
  @HiveField(0)
  bool get enable;
  @override
  @HiveField(1)
  String get title;
  @override
  @HiveField(2)
  String get pattern;
  @override
  @HiveField(3, defaultValue: "")
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_CustomButtonDetailCopyWith<_$_CustomButtonDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

AlertConditionSet _$AlertConditionSetFromJson(Map<String, dynamic> json) {
  return _AlertConditionSet.fromJson(json);
}

/// @nodoc
mixin _$AlertConditionSet {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: "t")
  String get title => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: "c")
  List<AlertCondition> get conditions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlertConditionSetCopyWith<AlertConditionSet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlertConditionSetCopyWith<$Res> {
  factory $AlertConditionSetCopyWith(
          AlertConditionSet value, $Res Function(AlertConditionSet) then) =
      _$AlertConditionSetCopyWithImpl<$Res, AlertConditionSet>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) @JsonKey(name: "t") String title,
      @HiveField(2) @JsonKey(name: "c") List<AlertCondition> conditions});
}

/// @nodoc
class _$AlertConditionSetCopyWithImpl<$Res, $Val extends AlertConditionSet>
    implements $AlertConditionSetCopyWith<$Res> {
  _$AlertConditionSetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? conditions = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      conditions: null == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as List<AlertCondition>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AlertConditionSetCopyWith<$Res>
    implements $AlertConditionSetCopyWith<$Res> {
  factory _$$_AlertConditionSetCopyWith(_$_AlertConditionSet value,
          $Res Function(_$_AlertConditionSet) then) =
      __$$_AlertConditionSetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) @JsonKey(name: "t") String title,
      @HiveField(2) @JsonKey(name: "c") List<AlertCondition> conditions});
}

/// @nodoc
class __$$_AlertConditionSetCopyWithImpl<$Res>
    extends _$AlertConditionSetCopyWithImpl<$Res, _$_AlertConditionSet>
    implements _$$_AlertConditionSetCopyWith<$Res> {
  __$$_AlertConditionSetCopyWithImpl(
      _$_AlertConditionSet _value, $Res Function(_$_AlertConditionSet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? conditions = null,
  }) {
    return _then(_$_AlertConditionSet(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      conditions: null == conditions
          ? _value._conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as List<AlertCondition>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: alertConditionSetTypeId)
class _$_AlertConditionSet implements _AlertConditionSet {
  const _$_AlertConditionSet(
      {@HiveField(0)
          required this.id,
      @HiveField(1)
      @JsonKey(name: "t")
          required this.title,
      @HiveField(2)
      @JsonKey(name: "c")
          final List<AlertCondition> conditions = const <AlertCondition>[]})
      : _conditions = conditions;

  factory _$_AlertConditionSet.fromJson(Map<String, dynamic> json) =>
      _$$_AlertConditionSetFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  @JsonKey(name: "t")
  final String title;
  final List<AlertCondition> _conditions;
  @override
  @HiveField(2)
  @JsonKey(name: "c")
  List<AlertCondition> get conditions {
    if (_conditions is EqualUnmodifiableListView) return _conditions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conditions);
  }

  @override
  String toString() {
    return 'AlertConditionSet(id: $id, title: $title, conditions: $conditions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AlertConditionSet &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._conditions, _conditions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, const DeepCollectionEquality().hash(_conditions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AlertConditionSetCopyWith<_$_AlertConditionSet> get copyWith =>
      __$$_AlertConditionSetCopyWithImpl<_$_AlertConditionSet>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AlertConditionSetToJson(
      this,
    );
  }
}

abstract class _AlertConditionSet implements AlertConditionSet {
  const factory _AlertConditionSet(
      {@HiveField(0)
          required final String id,
      @HiveField(1)
      @JsonKey(name: "t")
          required final String title,
      @HiveField(2)
      @JsonKey(name: "c")
          final List<AlertCondition> conditions}) = _$_AlertConditionSet;

  factory _AlertConditionSet.fromJson(Map<String, dynamic> json) =
      _$_AlertConditionSet.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  @JsonKey(name: "t")
  String get title;
  @override
  @HiveField(2)
  @JsonKey(name: "c")
  List<AlertCondition> get conditions;
  @override
  @JsonKey(ignore: true)
  _$$_AlertConditionSetCopyWith<_$_AlertConditionSet> get copyWith =>
      throw _privateConstructorUsedError;
}

ShortcutDetail _$ShortcutDetailFromJson(Map<String, dynamic> json) {
  return _ShortcutDetail.fromJson(json);
}

/// @nodoc
mixin _$ShortcutDetail {
  @HiveField(0)
  ShortcutType get type => throw _privateConstructorUsedError;
  @HiveField(1)
  String get param => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShortcutDetailCopyWith<ShortcutDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShortcutDetailCopyWith<$Res> {
  factory $ShortcutDetailCopyWith(
          ShortcutDetail value, $Res Function(ShortcutDetail) then) =
      _$ShortcutDetailCopyWithImpl<$Res, ShortcutDetail>;
  @useResult
  $Res call({@HiveField(0) ShortcutType type, @HiveField(1) String param});
}

/// @nodoc
class _$ShortcutDetailCopyWithImpl<$Res, $Val extends ShortcutDetail>
    implements $ShortcutDetailCopyWith<$Res> {
  _$ShortcutDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? param = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ShortcutType,
      param: null == param
          ? _value.param
          : param // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShortcutDetailCopyWith<$Res>
    implements $ShortcutDetailCopyWith<$Res> {
  factory _$$_ShortcutDetailCopyWith(
          _$_ShortcutDetail value, $Res Function(_$_ShortcutDetail) then) =
      __$$_ShortcutDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) ShortcutType type, @HiveField(1) String param});
}

/// @nodoc
class __$$_ShortcutDetailCopyWithImpl<$Res>
    extends _$ShortcutDetailCopyWithImpl<$Res, _$_ShortcutDetail>
    implements _$$_ShortcutDetailCopyWith<$Res> {
  __$$_ShortcutDetailCopyWithImpl(
      _$_ShortcutDetail _value, $Res Function(_$_ShortcutDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? param = null,
  }) {
    return _then(_$_ShortcutDetail(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ShortcutType,
      param: null == param
          ? _value.param
          : param // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: shortcutDetailTypeId)
class _$_ShortcutDetail implements _ShortcutDetail {
  const _$_ShortcutDetail(
      {@HiveField(0) required this.type, @HiveField(1) this.param = ""});

  factory _$_ShortcutDetail.fromJson(Map<String, dynamic> json) =>
      _$$_ShortcutDetailFromJson(json);

  @override
  @HiveField(0)
  final ShortcutType type;
  @override
  @JsonKey()
  @HiveField(1)
  final String param;

  @override
  String toString() {
    return 'ShortcutDetail(type: $type, param: $param)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShortcutDetail &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.param, param) || other.param == param));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, param);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShortcutDetailCopyWith<_$_ShortcutDetail> get copyWith =>
      __$$_ShortcutDetailCopyWithImpl<_$_ShortcutDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShortcutDetailToJson(
      this,
    );
  }
}

abstract class _ShortcutDetail implements ShortcutDetail {
  const factory _ShortcutDetail(
      {@HiveField(0) required final ShortcutType type,
      @HiveField(1) final String param}) = _$_ShortcutDetail;

  factory _ShortcutDetail.fromJson(Map<String, dynamic> json) =
      _$_ShortcutDetail.fromJson;

  @override
  @HiveField(0)
  ShortcutType get type;
  @override
  @HiveField(1)
  String get param;
  @override
  @JsonKey(ignore: true)
  _$$_ShortcutDetailCopyWith<_$_ShortcutDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
