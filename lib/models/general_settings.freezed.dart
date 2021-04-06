// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'general_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GeneralSettingsTearOff {
  const _$GeneralSettingsTearOff();

  _GeneralSettings call(
      {@HiveField(0)
          bool isDarkMode = false,
      @HiveField(1)
          bool enableTargetProfit = false,
      @HiveField(2)
          int targetProfitValue = 10,
      @HiveField(3)
          String skuFormat = _defaultSkuFormat,
      @HiveField(4)
          List<String> retailers = const <String>[],
      @HiveField(5)
          bool enableReadAloud = false,
      @HiveField(6)
          int patternIndex = 0,
      @HiveField(7)
          List<ReadAloudPattern> readAloudPatterns = _defaultReadAloudPatterns,
      @HiveField(8)
          double readAloudVolume = 1.0,
      @HiveField(9)
          double? readAloudSpeed,
      @HiveField(10, defaultValue: defaultCustomButtons)
          List<CustomButtonDetail> customButtons = defaultCustomButtons,
      @HiveField(11, defaultValue: _defaultCsvOrder)
          List<CsvColumn> csvOrder = _defaultCsvOrder,
      @HiveField(12, defaultValue: 0)
          int minProfit = 0,
      @HiveField(13, defaultValue: false)
          bool getStocks = false,
      @HiveField(14, defaultValue: true)
          bool enableAlert = true,
      @HiveField(15, defaultValue: _defaultAlert)
          List<AlertConditionSet> alerts = _defaultAlert,
      @HiveField(16, defaultValue: false)
          bool enableAlertVibration = false,
      @HiveField(17, defaultValue: true)
          bool isMajorCustomer = true,
      @HiveField(18, defaultValue: _defaultKeepaSettings)
          KeepaSettings keepaSettings = _defaultKeepaSettings}) {
    return _GeneralSettings(
      isDarkMode: isDarkMode,
      enableTargetProfit: enableTargetProfit,
      targetProfitValue: targetProfitValue,
      skuFormat: skuFormat,
      retailers: retailers,
      enableReadAloud: enableReadAloud,
      patternIndex: patternIndex,
      readAloudPatterns: readAloudPatterns,
      readAloudVolume: readAloudVolume,
      readAloudSpeed: readAloudSpeed,
      customButtons: customButtons,
      csvOrder: csvOrder,
      minProfit: minProfit,
      getStocks: getStocks,
      enableAlert: enableAlert,
      alerts: alerts,
      enableAlertVibration: enableAlertVibration,
      isMajorCustomer: isMajorCustomer,
      keepaSettings: keepaSettings,
    );
  }
}

/// @nodoc
const $GeneralSettings = _$GeneralSettingsTearOff();

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
  @HiveField(11, defaultValue: _defaultCsvOrder)
  List<CsvColumn> get csvOrder => throw _privateConstructorUsedError; // 最低利益額
  @HiveField(12, defaultValue: 0)
  int get minProfit => throw _privateConstructorUsedError; // 在庫の取得設定
  @HiveField(13, defaultValue: false)
  bool get getStocks => throw _privateConstructorUsedError; // アラート設定
  @HiveField(14, defaultValue: true)
  bool get enableAlert => throw _privateConstructorUsedError;
  @HiveField(15, defaultValue: _defaultAlert)
  List<AlertConditionSet> get alerts => throw _privateConstructorUsedError;
  @HiveField(16, defaultValue: false)
  bool get enableAlertVibration => throw _privateConstructorUsedError;
  @HiveField(17, defaultValue: true)
  bool get isMajorCustomer => throw _privateConstructorUsedError;
  @HiveField(18, defaultValue: _defaultKeepaSettings)
  KeepaSettings get keepaSettings => throw _privateConstructorUsedError;

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
      @HiveField(11, defaultValue: _defaultCsvOrder)
          List<CsvColumn> csvOrder,
      @HiveField(12, defaultValue: 0)
          int minProfit,
      @HiveField(13, defaultValue: false)
          bool getStocks,
      @HiveField(14, defaultValue: true)
          bool enableAlert,
      @HiveField(15, defaultValue: _defaultAlert)
          List<AlertConditionSet> alerts,
      @HiveField(16, defaultValue: false)
          bool enableAlertVibration,
      @HiveField(17, defaultValue: true)
          bool isMajorCustomer,
      @HiveField(18, defaultValue: _defaultKeepaSettings)
          KeepaSettings keepaSettings});

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
abstract class _$GeneralSettingsCopyWith<$Res>
    implements $GeneralSettingsCopyWith<$Res> {
  factory _$GeneralSettingsCopyWith(
          _GeneralSettings value, $Res Function(_GeneralSettings) then) =
      __$GeneralSettingsCopyWithImpl<$Res>;
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
      @HiveField(11, defaultValue: _defaultCsvOrder)
          List<CsvColumn> csvOrder,
      @HiveField(12, defaultValue: 0)
          int minProfit,
      @HiveField(13, defaultValue: false)
          bool getStocks,
      @HiveField(14, defaultValue: true)
          bool enableAlert,
      @HiveField(15, defaultValue: _defaultAlert)
          List<AlertConditionSet> alerts,
      @HiveField(16, defaultValue: false)
          bool enableAlertVibration,
      @HiveField(17, defaultValue: true)
          bool isMajorCustomer,
      @HiveField(18, defaultValue: _defaultKeepaSettings)
          KeepaSettings keepaSettings});

  @override
  $KeepaSettingsCopyWith<$Res> get keepaSettings;
}

/// @nodoc
class __$GeneralSettingsCopyWithImpl<$Res>
    extends _$GeneralSettingsCopyWithImpl<$Res>
    implements _$GeneralSettingsCopyWith<$Res> {
  __$GeneralSettingsCopyWithImpl(
      _GeneralSettings _value, $Res Function(_GeneralSettings) _then)
      : super(_value, (v) => _then(v as _GeneralSettings));

  @override
  _GeneralSettings get _value => super._value as _GeneralSettings;

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
  }) {
    return _then(_GeneralSettings(
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
          this.skuFormat = _defaultSkuFormat,
      @HiveField(4)
          this.retailers = const <String>[],
      @HiveField(5)
          this.enableReadAloud = false,
      @HiveField(6)
          this.patternIndex = 0,
      @HiveField(7)
          this.readAloudPatterns = _defaultReadAloudPatterns,
      @HiveField(8)
          this.readAloudVolume = 1.0,
      @HiveField(9)
          this.readAloudSpeed,
      @HiveField(10, defaultValue: defaultCustomButtons)
          this.customButtons = defaultCustomButtons,
      @HiveField(11, defaultValue: _defaultCsvOrder)
          this.csvOrder = _defaultCsvOrder,
      @HiveField(12, defaultValue: 0)
          this.minProfit = 0,
      @HiveField(13, defaultValue: false)
          this.getStocks = false,
      @HiveField(14, defaultValue: true)
          this.enableAlert = true,
      @HiveField(15, defaultValue: _defaultAlert)
          this.alerts = _defaultAlert,
      @HiveField(16, defaultValue: false)
          this.enableAlertVibration = false,
      @HiveField(17, defaultValue: true)
          this.isMajorCustomer = true,
      @HiveField(18, defaultValue: _defaultKeepaSettings)
          this.keepaSettings = _defaultKeepaSettings});

  @JsonKey(defaultValue: false)
  @override // ダークモード
  @HiveField(0)
  final bool isDarkMode;
  @JsonKey(defaultValue: false)
  @override // 目標利益率設定
  @HiveField(1)
  final bool enableTargetProfit;
  @JsonKey(defaultValue: 10)
  @override // 目標利益率
  @HiveField(2)
  final int targetProfitValue;
  @JsonKey(defaultValue: _defaultSkuFormat)
  @override // SKU 設定
  @HiveField(3)
  final String skuFormat;
  @JsonKey(defaultValue: const <String>[])
  @override // 仕入れ先設定
  @HiveField(4)
  final List<String> retailers;
  @JsonKey(defaultValue: false)
  @override // 読み上げ設定
  @HiveField(5)
  final bool enableReadAloud;
  @JsonKey(defaultValue: 0)
  @override
  @HiveField(6)
  final int patternIndex;
  @JsonKey(defaultValue: _defaultReadAloudPatterns)
  @override
  @HiveField(7)
  final List<ReadAloudPattern> readAloudPatterns;
  @JsonKey(defaultValue: 1.0)
  @override
  @HiveField(8)
  final double readAloudVolume;
  @override
  @HiveField(9)
  final double? readAloudSpeed;
  @JsonKey(defaultValue: defaultCustomButtons)
  @override // カスタムボタン設定
  @HiveField(10, defaultValue: defaultCustomButtons)
  final List<CustomButtonDetail> customButtons;
  @JsonKey(defaultValue: _defaultCsvOrder)
  @override // CSV の並び順
  @HiveField(11, defaultValue: _defaultCsvOrder)
  final List<CsvColumn> csvOrder;
  @JsonKey(defaultValue: 0)
  @override // 最低利益額
  @HiveField(12, defaultValue: 0)
  final int minProfit;
  @JsonKey(defaultValue: false)
  @override // 在庫の取得設定
  @HiveField(13, defaultValue: false)
  final bool getStocks;
  @JsonKey(defaultValue: true)
  @override // アラート設定
  @HiveField(14, defaultValue: true)
  final bool enableAlert;
  @JsonKey(defaultValue: _defaultAlert)
  @override
  @HiveField(15, defaultValue: _defaultAlert)
  final List<AlertConditionSet> alerts;
  @JsonKey(defaultValue: false)
  @override
  @HiveField(16, defaultValue: false)
  final bool enableAlertVibration;
  @JsonKey(defaultValue: true)
  @override
  @HiveField(17, defaultValue: true)
  final bool isMajorCustomer;
  @JsonKey(defaultValue: _defaultKeepaSettings)
  @override
  @HiveField(18, defaultValue: _defaultKeepaSettings)
  final KeepaSettings keepaSettings;

  @override
  String toString() {
    return 'GeneralSettings(isDarkMode: $isDarkMode, enableTargetProfit: $enableTargetProfit, targetProfitValue: $targetProfitValue, skuFormat: $skuFormat, retailers: $retailers, enableReadAloud: $enableReadAloud, patternIndex: $patternIndex, readAloudPatterns: $readAloudPatterns, readAloudVolume: $readAloudVolume, readAloudSpeed: $readAloudSpeed, customButtons: $customButtons, csvOrder: $csvOrder, minProfit: $minProfit, getStocks: $getStocks, enableAlert: $enableAlert, alerts: $alerts, enableAlertVibration: $enableAlertVibration, isMajorCustomer: $isMajorCustomer, keepaSettings: $keepaSettings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GeneralSettings &&
            (identical(other.isDarkMode, isDarkMode) ||
                const DeepCollectionEquality()
                    .equals(other.isDarkMode, isDarkMode)) &&
            (identical(other.enableTargetProfit, enableTargetProfit) ||
                const DeepCollectionEquality()
                    .equals(other.enableTargetProfit, enableTargetProfit)) &&
            (identical(other.targetProfitValue, targetProfitValue) ||
                const DeepCollectionEquality()
                    .equals(other.targetProfitValue, targetProfitValue)) &&
            (identical(other.skuFormat, skuFormat) ||
                const DeepCollectionEquality()
                    .equals(other.skuFormat, skuFormat)) &&
            (identical(other.retailers, retailers) ||
                const DeepCollectionEquality()
                    .equals(other.retailers, retailers)) &&
            (identical(other.enableReadAloud, enableReadAloud) ||
                const DeepCollectionEquality()
                    .equals(other.enableReadAloud, enableReadAloud)) &&
            (identical(other.patternIndex, patternIndex) ||
                const DeepCollectionEquality()
                    .equals(other.patternIndex, patternIndex)) &&
            (identical(other.readAloudPatterns, readAloudPatterns) ||
                const DeepCollectionEquality()
                    .equals(other.readAloudPatterns, readAloudPatterns)) &&
            (identical(other.readAloudVolume, readAloudVolume) ||
                const DeepCollectionEquality()
                    .equals(other.readAloudVolume, readAloudVolume)) &&
            (identical(other.readAloudSpeed, readAloudSpeed) ||
                const DeepCollectionEquality()
                    .equals(other.readAloudSpeed, readAloudSpeed)) &&
            (identical(other.customButtons, customButtons) ||
                const DeepCollectionEquality()
                    .equals(other.customButtons, customButtons)) &&
            (identical(other.csvOrder, csvOrder) ||
                const DeepCollectionEquality()
                    .equals(other.csvOrder, csvOrder)) &&
            (identical(other.minProfit, minProfit) ||
                const DeepCollectionEquality()
                    .equals(other.minProfit, minProfit)) &&
            (identical(other.getStocks, getStocks) ||
                const DeepCollectionEquality()
                    .equals(other.getStocks, getStocks)) &&
            (identical(other.enableAlert, enableAlert) ||
                const DeepCollectionEquality()
                    .equals(other.enableAlert, enableAlert)) &&
            (identical(other.alerts, alerts) ||
                const DeepCollectionEquality().equals(other.alerts, alerts)) &&
            (identical(other.enableAlertVibration, enableAlertVibration) ||
                const DeepCollectionEquality().equals(
                    other.enableAlertVibration, enableAlertVibration)) &&
            (identical(other.isMajorCustomer, isMajorCustomer) ||
                const DeepCollectionEquality()
                    .equals(other.isMajorCustomer, isMajorCustomer)) &&
            (identical(other.keepaSettings, keepaSettings) ||
                const DeepCollectionEquality()
                    .equals(other.keepaSettings, keepaSettings)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isDarkMode) ^
      const DeepCollectionEquality().hash(enableTargetProfit) ^
      const DeepCollectionEquality().hash(targetProfitValue) ^
      const DeepCollectionEquality().hash(skuFormat) ^
      const DeepCollectionEquality().hash(retailers) ^
      const DeepCollectionEquality().hash(enableReadAloud) ^
      const DeepCollectionEquality().hash(patternIndex) ^
      const DeepCollectionEquality().hash(readAloudPatterns) ^
      const DeepCollectionEquality().hash(readAloudVolume) ^
      const DeepCollectionEquality().hash(readAloudSpeed) ^
      const DeepCollectionEquality().hash(customButtons) ^
      const DeepCollectionEquality().hash(csvOrder) ^
      const DeepCollectionEquality().hash(minProfit) ^
      const DeepCollectionEquality().hash(getStocks) ^
      const DeepCollectionEquality().hash(enableAlert) ^
      const DeepCollectionEquality().hash(alerts) ^
      const DeepCollectionEquality().hash(enableAlertVibration) ^
      const DeepCollectionEquality().hash(isMajorCustomer) ^
      const DeepCollectionEquality().hash(keepaSettings);

  @JsonKey(ignore: true)
  @override
  _$GeneralSettingsCopyWith<_GeneralSettings> get copyWith =>
      __$GeneralSettingsCopyWithImpl<_GeneralSettings>(this, _$identity);
}

abstract class _GeneralSettings implements GeneralSettings {
  const factory _GeneralSettings(
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
      @HiveField(11, defaultValue: _defaultCsvOrder)
          List<CsvColumn> csvOrder,
      @HiveField(12, defaultValue: 0)
          int minProfit,
      @HiveField(13, defaultValue: false)
          bool getStocks,
      @HiveField(14, defaultValue: true)
          bool enableAlert,
      @HiveField(15, defaultValue: _defaultAlert)
          List<AlertConditionSet> alerts,
      @HiveField(16, defaultValue: false)
          bool enableAlertVibration,
      @HiveField(17, defaultValue: true)
          bool isMajorCustomer,
      @HiveField(18, defaultValue: _defaultKeepaSettings)
          KeepaSettings keepaSettings}) = _$_GeneralSettings;

  @override // ダークモード
  @HiveField(0)
  bool get isDarkMode => throw _privateConstructorUsedError;
  @override // 目標利益率設定
  @HiveField(1)
  bool get enableTargetProfit => throw _privateConstructorUsedError;
  @override // 目標利益率
  @HiveField(2)
  int get targetProfitValue => throw _privateConstructorUsedError;
  @override // SKU 設定
  @HiveField(3)
  String get skuFormat => throw _privateConstructorUsedError;
  @override // 仕入れ先設定
  @HiveField(4)
  List<String> get retailers => throw _privateConstructorUsedError;
  @override // 読み上げ設定
  @HiveField(5)
  bool get enableReadAloud => throw _privateConstructorUsedError;
  @override
  @HiveField(6)
  int get patternIndex => throw _privateConstructorUsedError;
  @override
  @HiveField(7)
  List<ReadAloudPattern> get readAloudPatterns =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(8)
  double get readAloudVolume => throw _privateConstructorUsedError;
  @override
  @HiveField(9)
  double? get readAloudSpeed => throw _privateConstructorUsedError;
  @override // カスタムボタン設定
  @HiveField(10, defaultValue: defaultCustomButtons)
  List<CustomButtonDetail> get customButtons =>
      throw _privateConstructorUsedError;
  @override // CSV の並び順
  @HiveField(11, defaultValue: _defaultCsvOrder)
  List<CsvColumn> get csvOrder => throw _privateConstructorUsedError;
  @override // 最低利益額
  @HiveField(12, defaultValue: 0)
  int get minProfit => throw _privateConstructorUsedError;
  @override // 在庫の取得設定
  @HiveField(13, defaultValue: false)
  bool get getStocks => throw _privateConstructorUsedError;
  @override // アラート設定
  @HiveField(14, defaultValue: true)
  bool get enableAlert => throw _privateConstructorUsedError;
  @override
  @HiveField(15, defaultValue: _defaultAlert)
  List<AlertConditionSet> get alerts => throw _privateConstructorUsedError;
  @override
  @HiveField(16, defaultValue: false)
  bool get enableAlertVibration => throw _privateConstructorUsedError;
  @override
  @HiveField(17, defaultValue: true)
  bool get isMajorCustomer => throw _privateConstructorUsedError;
  @override
  @HiveField(18, defaultValue: _defaultKeepaSettings)
  KeepaSettings get keepaSettings => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GeneralSettingsCopyWith<_GeneralSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ReadAloudPatternTearOff {
  const _$ReadAloudPatternTearOff();

  _ReadAloudPattern call(
      {@HiveField(0) required String title,
      @HiveField(1) required String pattern}) {
    return _ReadAloudPattern(
      title: title,
      pattern: pattern,
    );
  }
}

/// @nodoc
const $ReadAloudPattern = _$ReadAloudPatternTearOff();

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
abstract class _$ReadAloudPatternCopyWith<$Res>
    implements $ReadAloudPatternCopyWith<$Res> {
  factory _$ReadAloudPatternCopyWith(
          _ReadAloudPattern value, $Res Function(_ReadAloudPattern) then) =
      __$ReadAloudPatternCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) String title, @HiveField(1) String pattern});
}

/// @nodoc
class __$ReadAloudPatternCopyWithImpl<$Res>
    extends _$ReadAloudPatternCopyWithImpl<$Res>
    implements _$ReadAloudPatternCopyWith<$Res> {
  __$ReadAloudPatternCopyWithImpl(
      _ReadAloudPattern _value, $Res Function(_ReadAloudPattern) _then)
      : super(_value, (v) => _then(v as _ReadAloudPattern));

  @override
  _ReadAloudPattern get _value => super._value as _ReadAloudPattern;

  @override
  $Res call({
    Object? title = freezed,
    Object? pattern = freezed,
  }) {
    return _then(_ReadAloudPattern(
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
        (other is _ReadAloudPattern &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.pattern, pattern) ||
                const DeepCollectionEquality().equals(other.pattern, pattern)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(pattern);

  @JsonKey(ignore: true)
  @override
  _$ReadAloudPatternCopyWith<_ReadAloudPattern> get copyWith =>
      __$ReadAloudPatternCopyWithImpl<_ReadAloudPattern>(this, _$identity);
}

abstract class _ReadAloudPattern implements ReadAloudPattern {
  const factory _ReadAloudPattern(
      {@HiveField(0) required String title,
      @HiveField(1) required String pattern}) = _$_ReadAloudPattern;

  @override
  @HiveField(0)
  String get title => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String get pattern => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ReadAloudPatternCopyWith<_ReadAloudPattern> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$CustomButtonDetailTearOff {
  const _$CustomButtonDetailTearOff();

  _CustomButtonDetail call(
      {@HiveField(0) required bool enable,
      @HiveField(1) required String title,
      @HiveField(2) required String pattern,
      @HiveField(3, defaultValue: "") required String id}) {
    return _CustomButtonDetail(
      enable: enable,
      title: title,
      pattern: pattern,
      id: id,
    );
  }
}

/// @nodoc
const $CustomButtonDetail = _$CustomButtonDetailTearOff();

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
abstract class _$CustomButtonDetailCopyWith<$Res>
    implements $CustomButtonDetailCopyWith<$Res> {
  factory _$CustomButtonDetailCopyWith(
          _CustomButtonDetail value, $Res Function(_CustomButtonDetail) then) =
      __$CustomButtonDetailCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) bool enable,
      @HiveField(1) String title,
      @HiveField(2) String pattern,
      @HiveField(3, defaultValue: "") String id});
}

/// @nodoc
class __$CustomButtonDetailCopyWithImpl<$Res>
    extends _$CustomButtonDetailCopyWithImpl<$Res>
    implements _$CustomButtonDetailCopyWith<$Res> {
  __$CustomButtonDetailCopyWithImpl(
      _CustomButtonDetail _value, $Res Function(_CustomButtonDetail) _then)
      : super(_value, (v) => _then(v as _CustomButtonDetail));

  @override
  _CustomButtonDetail get _value => super._value as _CustomButtonDetail;

  @override
  $Res call({
    Object? enable = freezed,
    Object? title = freezed,
    Object? pattern = freezed,
    Object? id = freezed,
  }) {
    return _then(_CustomButtonDetail(
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
        (other is _CustomButtonDetail &&
            (identical(other.enable, enable) ||
                const DeepCollectionEquality().equals(other.enable, enable)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.pattern, pattern) ||
                const DeepCollectionEquality()
                    .equals(other.pattern, pattern)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(enable) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(pattern) ^
      const DeepCollectionEquality().hash(id);

  @JsonKey(ignore: true)
  @override
  _$CustomButtonDetailCopyWith<_CustomButtonDetail> get copyWith =>
      __$CustomButtonDetailCopyWithImpl<_CustomButtonDetail>(this, _$identity);
}

abstract class _CustomButtonDetail implements CustomButtonDetail {
  const factory _CustomButtonDetail(
          {@HiveField(0) required bool enable,
          @HiveField(1) required String title,
          @HiveField(2) required String pattern,
          @HiveField(3, defaultValue: "") required String id}) =
      _$_CustomButtonDetail;

  @override
  @HiveField(0)
  bool get enable => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  String get pattern => throw _privateConstructorUsedError;
  @override
  @HiveField(3, defaultValue: "")
  String get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CustomButtonDetailCopyWith<_CustomButtonDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

AlertConditionSet _$AlertConditionSetFromJson(Map<String, dynamic> json) {
  return _AlertConditionSet.fromJson(json);
}

/// @nodoc
class _$AlertConditionSetTearOff {
  const _$AlertConditionSetTearOff();

  _AlertConditionSet call(
      {@HiveField(0)
          required String id,
      @HiveField(1)
      @JsonKey(name: "t")
          required String title,
      @HiveField(2)
      @JsonKey(name: "c")
          List<AlertCondition> conditions = const <AlertCondition>[]}) {
    return _AlertConditionSet(
      id: id,
      title: title,
      conditions: conditions,
    );
  }

  AlertConditionSet fromJson(Map<String, Object> json) {
    return AlertConditionSet.fromJson(json);
  }
}

/// @nodoc
const $AlertConditionSet = _$AlertConditionSetTearOff();

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
abstract class _$AlertConditionSetCopyWith<$Res>
    implements $AlertConditionSetCopyWith<$Res> {
  factory _$AlertConditionSetCopyWith(
          _AlertConditionSet value, $Res Function(_AlertConditionSet) then) =
      __$AlertConditionSetCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) @JsonKey(name: "t") String title,
      @HiveField(2) @JsonKey(name: "c") List<AlertCondition> conditions});
}

/// @nodoc
class __$AlertConditionSetCopyWithImpl<$Res>
    extends _$AlertConditionSetCopyWithImpl<$Res>
    implements _$AlertConditionSetCopyWith<$Res> {
  __$AlertConditionSetCopyWithImpl(
      _AlertConditionSet _value, $Res Function(_AlertConditionSet) _then)
      : super(_value, (v) => _then(v as _AlertConditionSet));

  @override
  _AlertConditionSet get _value => super._value as _AlertConditionSet;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? conditions = freezed,
  }) {
    return _then(_AlertConditionSet(
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
          this.conditions = const <AlertCondition>[]});

  factory _$_AlertConditionSet.fromJson(Map<String, dynamic> json) =>
      _$_$_AlertConditionSetFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  @JsonKey(name: "t")
  final String title;
  @override
  @HiveField(2)
  @JsonKey(name: "c")
  final List<AlertCondition> conditions;

  @override
  String toString() {
    return 'AlertConditionSet(id: $id, title: $title, conditions: $conditions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AlertConditionSet &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.conditions, conditions) ||
                const DeepCollectionEquality()
                    .equals(other.conditions, conditions)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(conditions);

  @JsonKey(ignore: true)
  @override
  _$AlertConditionSetCopyWith<_AlertConditionSet> get copyWith =>
      __$AlertConditionSetCopyWithImpl<_AlertConditionSet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AlertConditionSetToJson(this);
  }
}

abstract class _AlertConditionSet implements AlertConditionSet {
  const factory _AlertConditionSet(
          {@HiveField(0) required String id,
          @HiveField(1) @JsonKey(name: "t") required String title,
          @HiveField(2) @JsonKey(name: "c") List<AlertCondition> conditions}) =
      _$_AlertConditionSet;

  factory _AlertConditionSet.fromJson(Map<String, dynamic> json) =
      _$_AlertConditionSet.fromJson;

  @override
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  @JsonKey(name: "t")
  String get title => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  @JsonKey(name: "c")
  List<AlertCondition> get conditions => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AlertConditionSetCopyWith<_AlertConditionSet> get copyWith =>
      throw _privateConstructorUsedError;
}
