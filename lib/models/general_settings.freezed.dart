// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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

  @JsonKey(ignore: true)
  $GeneralSettingsCopyWith<GeneralSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneralSettingsCopyWith<$Res> {
  factory $GeneralSettingsCopyWith(
          GeneralSettings value, $Res Function(GeneralSettings) then) =
      _$GeneralSettingsCopyWithImpl<$Res>;
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
          int usedConditionTextIndex});

  $KeepaSettingsCopyWith<$Res> get keepaSettings;
}

/// @nodoc
class _$GeneralSettingsCopyWithImpl<$Res>
    implements $GeneralSettingsCopyWith<$Res> {
  _$GeneralSettingsCopyWithImpl(this._value, this._then);

  final GeneralSettings _value;
  // ignore: unused_field
  final $Res Function(GeneralSettings) _then;

  @override
  $Res call({
    Object? isDarkMode = freezed,
    Object? enableTargetProfit = freezed,
    Object? targetProfitValue = freezed,
    Object? skuFormat = freezed,
    Object? retailers = freezed,
    Object? enableReadAloud = freezed,
    Object? patternIndex = freezed,
    Object? readAloudPatterns = freezed,
    Object? readAloudVolume = freezed,
    Object? readAloudSpeed = freezed,
    Object? customButtons = freezed,
    Object? csvOrder = freezed,
    Object? minProfit = freezed,
    Object? getStocks = freezed,
    Object? enableAlert = freezed,
    Object? alerts = freezed,
    Object? enableAlertVibration = freezed,
    Object? isMajorCustomer = freezed,
    Object? keepaSettings = freezed,
    Object? leftSlideShortcut = freezed,
    Object? rightSlideShortcut = freezed,
    Object? newConditionTexts = freezed,
    Object? newConditionTextIndex = freezed,
    Object? usedConditionTexts = freezed,
    Object? usedConditionTextIndex = freezed,
  }) {
    return _then(_value.copyWith(
      isDarkMode: isDarkMode == freezed
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      enableTargetProfit: enableTargetProfit == freezed
          ? _value.enableTargetProfit
          : enableTargetProfit // ignore: cast_nullable_to_non_nullable
              as bool,
      targetProfitValue: targetProfitValue == freezed
          ? _value.targetProfitValue
          : targetProfitValue // ignore: cast_nullable_to_non_nullable
              as int,
      skuFormat: skuFormat == freezed
          ? _value.skuFormat
          : skuFormat // ignore: cast_nullable_to_non_nullable
              as String,
      retailers: retailers == freezed
          ? _value.retailers
          : retailers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      enableReadAloud: enableReadAloud == freezed
          ? _value.enableReadAloud
          : enableReadAloud // ignore: cast_nullable_to_non_nullable
              as bool,
      patternIndex: patternIndex == freezed
          ? _value.patternIndex
          : patternIndex // ignore: cast_nullable_to_non_nullable
              as int,
      readAloudPatterns: readAloudPatterns == freezed
          ? _value.readAloudPatterns
          : readAloudPatterns // ignore: cast_nullable_to_non_nullable
              as List<ReadAloudPattern>,
      readAloudVolume: readAloudVolume == freezed
          ? _value.readAloudVolume
          : readAloudVolume // ignore: cast_nullable_to_non_nullable
              as double,
      readAloudSpeed: readAloudSpeed == freezed
          ? _value.readAloudSpeed
          : readAloudSpeed // ignore: cast_nullable_to_non_nullable
              as double?,
      customButtons: customButtons == freezed
          ? _value.customButtons
          : customButtons // ignore: cast_nullable_to_non_nullable
              as List<CustomButtonDetail>,
      csvOrder: csvOrder == freezed
          ? _value.csvOrder
          : csvOrder // ignore: cast_nullable_to_non_nullable
              as List<CsvColumn>,
      minProfit: minProfit == freezed
          ? _value.minProfit
          : minProfit // ignore: cast_nullable_to_non_nullable
              as int,
      getStocks: getStocks == freezed
          ? _value.getStocks
          : getStocks // ignore: cast_nullable_to_non_nullable
              as bool,
      enableAlert: enableAlert == freezed
          ? _value.enableAlert
          : enableAlert // ignore: cast_nullable_to_non_nullable
              as bool,
      alerts: alerts == freezed
          ? _value.alerts
          : alerts // ignore: cast_nullable_to_non_nullable
              as List<AlertConditionSet>,
      enableAlertVibration: enableAlertVibration == freezed
          ? _value.enableAlertVibration
          : enableAlertVibration // ignore: cast_nullable_to_non_nullable
              as bool,
      isMajorCustomer: isMajorCustomer == freezed
          ? _value.isMajorCustomer
          : isMajorCustomer // ignore: cast_nullable_to_non_nullable
              as bool,
      keepaSettings: keepaSettings == freezed
          ? _value.keepaSettings
          : keepaSettings // ignore: cast_nullable_to_non_nullable
              as KeepaSettings,
      leftSlideShortcut: leftSlideShortcut == freezed
          ? _value.leftSlideShortcut
          : leftSlideShortcut // ignore: cast_nullable_to_non_nullable
              as List<ShortcutDetail>,
      rightSlideShortcut: rightSlideShortcut == freezed
          ? _value.rightSlideShortcut
          : rightSlideShortcut // ignore: cast_nullable_to_non_nullable
              as List<ShortcutDetail>,
      newConditionTexts: newConditionTexts == freezed
          ? _value.newConditionTexts
          : newConditionTexts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      newConditionTextIndex: newConditionTextIndex == freezed
          ? _value.newConditionTextIndex
          : newConditionTextIndex // ignore: cast_nullable_to_non_nullable
              as int,
      usedConditionTexts: usedConditionTexts == freezed
          ? _value.usedConditionTexts
          : usedConditionTexts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      usedConditionTextIndex: usedConditionTextIndex == freezed
          ? _value.usedConditionTextIndex
          : usedConditionTextIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $KeepaSettingsCopyWith<$Res> get keepaSettings {
    return $KeepaSettingsCopyWith<$Res>(_value.keepaSettings, (value) {
      return _then(_value.copyWith(keepaSettings: value));
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
          int usedConditionTextIndex});

  @override
  $KeepaSettingsCopyWith<$Res> get keepaSettings;
}

/// @nodoc
class __$$_GeneralSettingsCopyWithImpl<$Res>
    extends _$GeneralSettingsCopyWithImpl<$Res>
    implements _$$_GeneralSettingsCopyWith<$Res> {
  __$$_GeneralSettingsCopyWithImpl(
      _$_GeneralSettings _value, $Res Function(_$_GeneralSettings) _then)
      : super(_value, (v) => _then(v as _$_GeneralSettings));

  @override
  _$_GeneralSettings get _value => super._value as _$_GeneralSettings;

  @override
  $Res call({
    Object? isDarkMode = freezed,
    Object? enableTargetProfit = freezed,
    Object? targetProfitValue = freezed,
    Object? skuFormat = freezed,
    Object? retailers = freezed,
    Object? enableReadAloud = freezed,
    Object? patternIndex = freezed,
    Object? readAloudPatterns = freezed,
    Object? readAloudVolume = freezed,
    Object? readAloudSpeed = freezed,
    Object? customButtons = freezed,
    Object? csvOrder = freezed,
    Object? minProfit = freezed,
    Object? getStocks = freezed,
    Object? enableAlert = freezed,
    Object? alerts = freezed,
    Object? enableAlertVibration = freezed,
    Object? isMajorCustomer = freezed,
    Object? keepaSettings = freezed,
    Object? leftSlideShortcut = freezed,
    Object? rightSlideShortcut = freezed,
    Object? newConditionTexts = freezed,
    Object? newConditionTextIndex = freezed,
    Object? usedConditionTexts = freezed,
    Object? usedConditionTextIndex = freezed,
  }) {
    return _then(_$_GeneralSettings(
      isDarkMode: isDarkMode == freezed
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      enableTargetProfit: enableTargetProfit == freezed
          ? _value.enableTargetProfit
          : enableTargetProfit // ignore: cast_nullable_to_non_nullable
              as bool,
      targetProfitValue: targetProfitValue == freezed
          ? _value.targetProfitValue
          : targetProfitValue // ignore: cast_nullable_to_non_nullable
              as int,
      skuFormat: skuFormat == freezed
          ? _value.skuFormat
          : skuFormat // ignore: cast_nullable_to_non_nullable
              as String,
      retailers: retailers == freezed
          ? _value._retailers
          : retailers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      enableReadAloud: enableReadAloud == freezed
          ? _value.enableReadAloud
          : enableReadAloud // ignore: cast_nullable_to_non_nullable
              as bool,
      patternIndex: patternIndex == freezed
          ? _value.patternIndex
          : patternIndex // ignore: cast_nullable_to_non_nullable
              as int,
      readAloudPatterns: readAloudPatterns == freezed
          ? _value._readAloudPatterns
          : readAloudPatterns // ignore: cast_nullable_to_non_nullable
              as List<ReadAloudPattern>,
      readAloudVolume: readAloudVolume == freezed
          ? _value.readAloudVolume
          : readAloudVolume // ignore: cast_nullable_to_non_nullable
              as double,
      readAloudSpeed: readAloudSpeed == freezed
          ? _value.readAloudSpeed
          : readAloudSpeed // ignore: cast_nullable_to_non_nullable
              as double?,
      customButtons: customButtons == freezed
          ? _value._customButtons
          : customButtons // ignore: cast_nullable_to_non_nullable
              as List<CustomButtonDetail>,
      csvOrder: csvOrder == freezed
          ? _value._csvOrder
          : csvOrder // ignore: cast_nullable_to_non_nullable
              as List<CsvColumn>,
      minProfit: minProfit == freezed
          ? _value.minProfit
          : minProfit // ignore: cast_nullable_to_non_nullable
              as int,
      getStocks: getStocks == freezed
          ? _value.getStocks
          : getStocks // ignore: cast_nullable_to_non_nullable
              as bool,
      enableAlert: enableAlert == freezed
          ? _value.enableAlert
          : enableAlert // ignore: cast_nullable_to_non_nullable
              as bool,
      alerts: alerts == freezed
          ? _value._alerts
          : alerts // ignore: cast_nullable_to_non_nullable
              as List<AlertConditionSet>,
      enableAlertVibration: enableAlertVibration == freezed
          ? _value.enableAlertVibration
          : enableAlertVibration // ignore: cast_nullable_to_non_nullable
              as bool,
      isMajorCustomer: isMajorCustomer == freezed
          ? _value.isMajorCustomer
          : isMajorCustomer // ignore: cast_nullable_to_non_nullable
              as bool,
      keepaSettings: keepaSettings == freezed
          ? _value.keepaSettings
          : keepaSettings // ignore: cast_nullable_to_non_nullable
              as KeepaSettings,
      leftSlideShortcut: leftSlideShortcut == freezed
          ? _value._leftSlideShortcut
          : leftSlideShortcut // ignore: cast_nullable_to_non_nullable
              as List<ShortcutDetail>,
      rightSlideShortcut: rightSlideShortcut == freezed
          ? _value._rightSlideShortcut
          : rightSlideShortcut // ignore: cast_nullable_to_non_nullable
              as List<ShortcutDetail>,
      newConditionTexts: newConditionTexts == freezed
          ? _value._newConditionTexts
          : newConditionTexts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      newConditionTextIndex: newConditionTextIndex == freezed
          ? _value.newConditionTextIndex
          : newConditionTextIndex // ignore: cast_nullable_to_non_nullable
              as int,
      usedConditionTexts: usedConditionTexts == freezed
          ? _value._usedConditionTexts
          : usedConditionTexts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      usedConditionTextIndex: usedConditionTextIndex == freezed
          ? _value.usedConditionTextIndex
          : usedConditionTextIndex // ignore: cast_nullable_to_non_nullable
              as int,
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
          this.usedConditionTextIndex = 0})
      : _retailers = retailers,
        _readAloudPatterns = readAloudPatterns,
        _customButtons = customButtons,
        _csvOrder = csvOrder,
        _alerts = alerts,
        _leftSlideShortcut = leftSlideShortcut,
        _rightSlideShortcut = rightSlideShortcut,
        _newConditionTexts = newConditionTexts,
        _usedConditionTexts = usedConditionTexts;

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
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_leftSlideShortcut);
  }

  final List<ShortcutDetail> _rightSlideShortcut;
  @override
  @JsonKey()
  @HiveField(20, defaultValue: defaultRightShortcut)
  List<ShortcutDetail> get rightSlideShortcut {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rightSlideShortcut);
  }

  final List<String> _newConditionTexts;
  @override
  @JsonKey()
  @HiveField(21, defaultValue: defaultNewConditionTexts)
  List<String> get newConditionTexts {
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
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_usedConditionTexts);
  }

  @override
  @JsonKey()
  @HiveField(24, defaultValue: 0)
  final int usedConditionTextIndex;

  @override
  String toString() {
    return 'GeneralSettings(isDarkMode: $isDarkMode, enableTargetProfit: $enableTargetProfit, targetProfitValue: $targetProfitValue, skuFormat: $skuFormat, retailers: $retailers, enableReadAloud: $enableReadAloud, patternIndex: $patternIndex, readAloudPatterns: $readAloudPatterns, readAloudVolume: $readAloudVolume, readAloudSpeed: $readAloudSpeed, customButtons: $customButtons, csvOrder: $csvOrder, minProfit: $minProfit, getStocks: $getStocks, enableAlert: $enableAlert, alerts: $alerts, enableAlertVibration: $enableAlertVibration, isMajorCustomer: $isMajorCustomer, keepaSettings: $keepaSettings, leftSlideShortcut: $leftSlideShortcut, rightSlideShortcut: $rightSlideShortcut, newConditionTexts: $newConditionTexts, newConditionTextIndex: $newConditionTextIndex, usedConditionTexts: $usedConditionTexts, usedConditionTextIndex: $usedConditionTextIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GeneralSettings &&
            const DeepCollectionEquality()
                .equals(other.isDarkMode, isDarkMode) &&
            const DeepCollectionEquality()
                .equals(other.enableTargetProfit, enableTargetProfit) &&
            const DeepCollectionEquality()
                .equals(other.targetProfitValue, targetProfitValue) &&
            const DeepCollectionEquality().equals(other.skuFormat, skuFormat) &&
            const DeepCollectionEquality()
                .equals(other._retailers, _retailers) &&
            const DeepCollectionEquality()
                .equals(other.enableReadAloud, enableReadAloud) &&
            const DeepCollectionEquality()
                .equals(other.patternIndex, patternIndex) &&
            const DeepCollectionEquality()
                .equals(other._readAloudPatterns, _readAloudPatterns) &&
            const DeepCollectionEquality()
                .equals(other.readAloudVolume, readAloudVolume) &&
            const DeepCollectionEquality()
                .equals(other.readAloudSpeed, readAloudSpeed) &&
            const DeepCollectionEquality()
                .equals(other._customButtons, _customButtons) &&
            const DeepCollectionEquality().equals(other._csvOrder, _csvOrder) &&
            const DeepCollectionEquality().equals(other.minProfit, minProfit) &&
            const DeepCollectionEquality().equals(other.getStocks, getStocks) &&
            const DeepCollectionEquality()
                .equals(other.enableAlert, enableAlert) &&
            const DeepCollectionEquality().equals(other._alerts, _alerts) &&
            const DeepCollectionEquality()
                .equals(other.enableAlertVibration, enableAlertVibration) &&
            const DeepCollectionEquality()
                .equals(other.isMajorCustomer, isMajorCustomer) &&
            const DeepCollectionEquality()
                .equals(other.keepaSettings, keepaSettings) &&
            const DeepCollectionEquality()
                .equals(other._leftSlideShortcut, _leftSlideShortcut) &&
            const DeepCollectionEquality()
                .equals(other._rightSlideShortcut, _rightSlideShortcut) &&
            const DeepCollectionEquality()
                .equals(other._newConditionTexts, _newConditionTexts) &&
            const DeepCollectionEquality()
                .equals(other.newConditionTextIndex, newConditionTextIndex) &&
            const DeepCollectionEquality()
                .equals(other._usedConditionTexts, _usedConditionTexts) &&
            const DeepCollectionEquality()
                .equals(other.usedConditionTextIndex, usedConditionTextIndex));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(isDarkMode),
        const DeepCollectionEquality().hash(enableTargetProfit),
        const DeepCollectionEquality().hash(targetProfitValue),
        const DeepCollectionEquality().hash(skuFormat),
        const DeepCollectionEquality().hash(_retailers),
        const DeepCollectionEquality().hash(enableReadAloud),
        const DeepCollectionEquality().hash(patternIndex),
        const DeepCollectionEquality().hash(_readAloudPatterns),
        const DeepCollectionEquality().hash(readAloudVolume),
        const DeepCollectionEquality().hash(readAloudSpeed),
        const DeepCollectionEquality().hash(_customButtons),
        const DeepCollectionEquality().hash(_csvOrder),
        const DeepCollectionEquality().hash(minProfit),
        const DeepCollectionEquality().hash(getStocks),
        const DeepCollectionEquality().hash(enableAlert),
        const DeepCollectionEquality().hash(_alerts),
        const DeepCollectionEquality().hash(enableAlertVibration),
        const DeepCollectionEquality().hash(isMajorCustomer),
        const DeepCollectionEquality().hash(keepaSettings),
        const DeepCollectionEquality().hash(_leftSlideShortcut),
        const DeepCollectionEquality().hash(_rightSlideShortcut),
        const DeepCollectionEquality().hash(_newConditionTexts),
        const DeepCollectionEquality().hash(newConditionTextIndex),
        const DeepCollectionEquality().hash(_usedConditionTexts),
        const DeepCollectionEquality().hash(usedConditionTextIndex)
      ]);

  @JsonKey(ignore: true)
  @override
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
          final int usedConditionTextIndex}) = _$_GeneralSettings;

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
      _$ReadAloudPatternCopyWithImpl<$Res>;
  $Res call({@HiveField(0) String title, @HiveField(1) String pattern});
}

/// @nodoc
class _$ReadAloudPatternCopyWithImpl<$Res>
    implements $ReadAloudPatternCopyWith<$Res> {
  _$ReadAloudPatternCopyWithImpl(this._value, this._then);

  final ReadAloudPattern _value;
  // ignore: unused_field
  final $Res Function(ReadAloudPattern) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? pattern = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      pattern: pattern == freezed
          ? _value.pattern
          : pattern // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ReadAloudPatternCopyWith<$Res>
    implements $ReadAloudPatternCopyWith<$Res> {
  factory _$$_ReadAloudPatternCopyWith(
          _$_ReadAloudPattern value, $Res Function(_$_ReadAloudPattern) then) =
      __$$_ReadAloudPatternCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) String title, @HiveField(1) String pattern});
}

/// @nodoc
class __$$_ReadAloudPatternCopyWithImpl<$Res>
    extends _$ReadAloudPatternCopyWithImpl<$Res>
    implements _$$_ReadAloudPatternCopyWith<$Res> {
  __$$_ReadAloudPatternCopyWithImpl(
      _$_ReadAloudPattern _value, $Res Function(_$_ReadAloudPattern) _then)
      : super(_value, (v) => _then(v as _$_ReadAloudPattern));

  @override
  _$_ReadAloudPattern get _value => super._value as _$_ReadAloudPattern;

  @override
  $Res call({
    Object? title = freezed,
    Object? pattern = freezed,
  }) {
    return _then(_$_ReadAloudPattern(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      pattern: pattern == freezed
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
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.pattern, pattern));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(pattern));

  @JsonKey(ignore: true)
  @override
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
      _$CustomButtonDetailCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) bool enable,
      @HiveField(1) String title,
      @HiveField(2) String pattern,
      @HiveField(3, defaultValue: "") String id});
}

/// @nodoc
class _$CustomButtonDetailCopyWithImpl<$Res>
    implements $CustomButtonDetailCopyWith<$Res> {
  _$CustomButtonDetailCopyWithImpl(this._value, this._then);

  final CustomButtonDetail _value;
  // ignore: unused_field
  final $Res Function(CustomButtonDetail) _then;

  @override
  $Res call({
    Object? enable = freezed,
    Object? title = freezed,
    Object? pattern = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      enable: enable == freezed
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      pattern: pattern == freezed
          ? _value.pattern
          : pattern // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_CustomButtonDetailCopyWith<$Res>
    implements $CustomButtonDetailCopyWith<$Res> {
  factory _$$_CustomButtonDetailCopyWith(_$_CustomButtonDetail value,
          $Res Function(_$_CustomButtonDetail) then) =
      __$$_CustomButtonDetailCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) bool enable,
      @HiveField(1) String title,
      @HiveField(2) String pattern,
      @HiveField(3, defaultValue: "") String id});
}

/// @nodoc
class __$$_CustomButtonDetailCopyWithImpl<$Res>
    extends _$CustomButtonDetailCopyWithImpl<$Res>
    implements _$$_CustomButtonDetailCopyWith<$Res> {
  __$$_CustomButtonDetailCopyWithImpl(
      _$_CustomButtonDetail _value, $Res Function(_$_CustomButtonDetail) _then)
      : super(_value, (v) => _then(v as _$_CustomButtonDetail));

  @override
  _$_CustomButtonDetail get _value => super._value as _$_CustomButtonDetail;

  @override
  $Res call({
    Object? enable = freezed,
    Object? title = freezed,
    Object? pattern = freezed,
    Object? id = freezed,
  }) {
    return _then(_$_CustomButtonDetail(
      enable: enable == freezed
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      pattern: pattern == freezed
          ? _value.pattern
          : pattern // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
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
            const DeepCollectionEquality().equals(other.enable, enable) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.pattern, pattern) &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(enable),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(pattern),
      const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
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
      _$AlertConditionSetCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) @JsonKey(name: "t") String title,
      @HiveField(2) @JsonKey(name: "c") List<AlertCondition> conditions});
}

/// @nodoc
class _$AlertConditionSetCopyWithImpl<$Res>
    implements $AlertConditionSetCopyWith<$Res> {
  _$AlertConditionSetCopyWithImpl(this._value, this._then);

  final AlertConditionSet _value;
  // ignore: unused_field
  final $Res Function(AlertConditionSet) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? conditions = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      conditions: conditions == freezed
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as List<AlertCondition>,
    ));
  }
}

/// @nodoc
abstract class _$$_AlertConditionSetCopyWith<$Res>
    implements $AlertConditionSetCopyWith<$Res> {
  factory _$$_AlertConditionSetCopyWith(_$_AlertConditionSet value,
          $Res Function(_$_AlertConditionSet) then) =
      __$$_AlertConditionSetCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) @JsonKey(name: "t") String title,
      @HiveField(2) @JsonKey(name: "c") List<AlertCondition> conditions});
}

/// @nodoc
class __$$_AlertConditionSetCopyWithImpl<$Res>
    extends _$AlertConditionSetCopyWithImpl<$Res>
    implements _$$_AlertConditionSetCopyWith<$Res> {
  __$$_AlertConditionSetCopyWithImpl(
      _$_AlertConditionSet _value, $Res Function(_$_AlertConditionSet) _then)
      : super(_value, (v) => _then(v as _$_AlertConditionSet));

  @override
  _$_AlertConditionSet get _value => super._value as _$_AlertConditionSet;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? conditions = freezed,
  }) {
    return _then(_$_AlertConditionSet(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      conditions: conditions == freezed
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
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other._conditions, _conditions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(_conditions));

  @JsonKey(ignore: true)
  @override
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
      _$ShortcutDetailCopyWithImpl<$Res>;
  $Res call({@HiveField(0) ShortcutType type, @HiveField(1) String param});
}

/// @nodoc
class _$ShortcutDetailCopyWithImpl<$Res>
    implements $ShortcutDetailCopyWith<$Res> {
  _$ShortcutDetailCopyWithImpl(this._value, this._then);

  final ShortcutDetail _value;
  // ignore: unused_field
  final $Res Function(ShortcutDetail) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? param = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ShortcutType,
      param: param == freezed
          ? _value.param
          : param // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ShortcutDetailCopyWith<$Res>
    implements $ShortcutDetailCopyWith<$Res> {
  factory _$$_ShortcutDetailCopyWith(
          _$_ShortcutDetail value, $Res Function(_$_ShortcutDetail) then) =
      __$$_ShortcutDetailCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) ShortcutType type, @HiveField(1) String param});
}

/// @nodoc
class __$$_ShortcutDetailCopyWithImpl<$Res>
    extends _$ShortcutDetailCopyWithImpl<$Res>
    implements _$$_ShortcutDetailCopyWith<$Res> {
  __$$_ShortcutDetailCopyWithImpl(
      _$_ShortcutDetail _value, $Res Function(_$_ShortcutDetail) _then)
      : super(_value, (v) => _then(v as _$_ShortcutDetail));

  @override
  _$_ShortcutDetail get _value => super._value as _$_ShortcutDetail;

  @override
  $Res call({
    Object? type = freezed,
    Object? param = freezed,
  }) {
    return _then(_$_ShortcutDetail(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ShortcutType,
      param: param == freezed
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
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.param, param));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(param));

  @JsonKey(ignore: true)
  @override
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
