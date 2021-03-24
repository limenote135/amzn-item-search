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
      @HiveField(10)
          List<CustomButtonDetail> customButtons = defaultCustomButtons,
      @HiveField(11)
          List<CsvColumn> csvOrder = _defaultCsvOrder,
      @HiveField(12)
          int minProfit = 0,
      @HiveField(13)
          bool getStocks = false}) {
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
    );
  }
}

/// @nodoc
const $GeneralSettings = _$GeneralSettingsTearOff();

/// @nodoc
mixin _$GeneralSettings {
  @HiveField(0)
  bool get isDarkMode => throw _privateConstructorUsedError; // 目標利益率設定
  @HiveField(1)
  bool get enableTargetProfit => throw _privateConstructorUsedError;
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
  double? get readAloudSpeed => throw _privateConstructorUsedError;
  @HiveField(10)
  List<CustomButtonDetail> get customButtons =>
      throw _privateConstructorUsedError;
  @HiveField(11)
  List<CsvColumn> get csvOrder => throw _privateConstructorUsedError;
  @HiveField(12)
  int get minProfit => throw _privateConstructorUsedError;
  @HiveField(13)
  bool get getStocks => throw _privateConstructorUsedError;

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
      {@HiveField(0) bool isDarkMode,
      @HiveField(1) bool enableTargetProfit,
      @HiveField(2) int targetProfitValue,
      @HiveField(3) String skuFormat,
      @HiveField(4) List<String> retailers,
      @HiveField(5) bool enableReadAloud,
      @HiveField(6) int patternIndex,
      @HiveField(7) List<ReadAloudPattern> readAloudPatterns,
      @HiveField(8) double readAloudVolume,
      @HiveField(9) double? readAloudSpeed,
      @HiveField(10) List<CustomButtonDetail> customButtons,
      @HiveField(11) List<CsvColumn> csvOrder,
      @HiveField(12) int minProfit,
      @HiveField(13) bool getStocks});
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
    ));
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
      {@HiveField(0) bool isDarkMode,
      @HiveField(1) bool enableTargetProfit,
      @HiveField(2) int targetProfitValue,
      @HiveField(3) String skuFormat,
      @HiveField(4) List<String> retailers,
      @HiveField(5) bool enableReadAloud,
      @HiveField(6) int patternIndex,
      @HiveField(7) List<ReadAloudPattern> readAloudPatterns,
      @HiveField(8) double readAloudVolume,
      @HiveField(9) double? readAloudSpeed,
      @HiveField(10) List<CustomButtonDetail> customButtons,
      @HiveField(11) List<CsvColumn> csvOrder,
      @HiveField(12) int minProfit,
      @HiveField(13) bool getStocks});
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
    ));
  }
}

@HiveType(typeId: generalSettingsTypeId)

/// @nodoc
class _$_GeneralSettings implements _GeneralSettings {
  const _$_GeneralSettings(
      {@HiveField(0) this.isDarkMode = false,
      @HiveField(1) this.enableTargetProfit = false,
      @HiveField(2) this.targetProfitValue = 10,
      @HiveField(3) this.skuFormat = _defaultSkuFormat,
      @HiveField(4) this.retailers = const <String>[],
      @HiveField(5) this.enableReadAloud = false,
      @HiveField(6) this.patternIndex = 0,
      @HiveField(7) this.readAloudPatterns = _defaultReadAloudPatterns,
      @HiveField(8) this.readAloudVolume = 1.0,
      @HiveField(9) this.readAloudSpeed,
      @HiveField(10) this.customButtons = defaultCustomButtons,
      @HiveField(11) this.csvOrder = _defaultCsvOrder,
      @HiveField(12) this.minProfit = 0,
      @HiveField(13) this.getStocks = false});

  @JsonKey(defaultValue: false)
  @override
  @HiveField(0)
  final bool isDarkMode;
  @JsonKey(defaultValue: false)
  @override // 目標利益率設定
  @HiveField(1)
  final bool enableTargetProfit;
  @JsonKey(defaultValue: 10)
  @override
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
  @override
  @HiveField(10)
  final List<CustomButtonDetail> customButtons;
  @JsonKey(defaultValue: _defaultCsvOrder)
  @override
  @HiveField(11)
  final List<CsvColumn> csvOrder;
  @JsonKey(defaultValue: 0)
  @override
  @HiveField(12)
  final int minProfit;
  @JsonKey(defaultValue: false)
  @override
  @HiveField(13)
  final bool getStocks;

  @override
  String toString() {
    return 'GeneralSettings(isDarkMode: $isDarkMode, enableTargetProfit: $enableTargetProfit, targetProfitValue: $targetProfitValue, skuFormat: $skuFormat, retailers: $retailers, enableReadAloud: $enableReadAloud, patternIndex: $patternIndex, readAloudPatterns: $readAloudPatterns, readAloudVolume: $readAloudVolume, readAloudSpeed: $readAloudSpeed, customButtons: $customButtons, csvOrder: $csvOrder, minProfit: $minProfit, getStocks: $getStocks)';
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
                    .equals(other.getStocks, getStocks)));
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
      const DeepCollectionEquality().hash(getStocks);

  @JsonKey(ignore: true)
  @override
  _$GeneralSettingsCopyWith<_GeneralSettings> get copyWith =>
      __$GeneralSettingsCopyWithImpl<_GeneralSettings>(this, _$identity);
}

abstract class _GeneralSettings implements GeneralSettings {
  const factory _GeneralSettings(
      {@HiveField(0) bool isDarkMode,
      @HiveField(1) bool enableTargetProfit,
      @HiveField(2) int targetProfitValue,
      @HiveField(3) String skuFormat,
      @HiveField(4) List<String> retailers,
      @HiveField(5) bool enableReadAloud,
      @HiveField(6) int patternIndex,
      @HiveField(7) List<ReadAloudPattern> readAloudPatterns,
      @HiveField(8) double readAloudVolume,
      @HiveField(9) double? readAloudSpeed,
      @HiveField(10) List<CustomButtonDetail> customButtons,
      @HiveField(11) List<CsvColumn> csvOrder,
      @HiveField(12) int minProfit,
      @HiveField(13) bool getStocks}) = _$_GeneralSettings;

  @override
  @HiveField(0)
  bool get isDarkMode => throw _privateConstructorUsedError;
  @override // 目標利益率設定
  @HiveField(1)
  bool get enableTargetProfit => throw _privateConstructorUsedError;
  @override
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
  @override
  @HiveField(10)
  List<CustomButtonDetail> get customButtons =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(11)
  List<CsvColumn> get csvOrder => throw _privateConstructorUsedError;
  @override
  @HiveField(12)
  int get minProfit => throw _privateConstructorUsedError;
  @override
  @HiveField(13)
  bool get getStocks => throw _privateConstructorUsedError;
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

@HiveType(typeId: readAloudPatternTypeId)

/// @nodoc
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
      @HiveField(2) required String pattern}) {
    return _CustomButtonDetail(
      enable: enable,
      title: title,
      pattern: pattern,
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
      @HiveField(2) String pattern});
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
      @HiveField(2) String pattern});
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
    ));
  }
}

@HiveType(typeId: customButtonDetailTypeId)

/// @nodoc
class _$_CustomButtonDetail implements _CustomButtonDetail {
  const _$_CustomButtonDetail(
      {@HiveField(0) required this.enable,
      @HiveField(1) required this.title,
      @HiveField(2) required this.pattern});

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
  String toString() {
    return 'CustomButtonDetail(enable: $enable, title: $title, pattern: $pattern)';
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
                const DeepCollectionEquality().equals(other.pattern, pattern)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(enable) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(pattern);

  @JsonKey(ignore: true)
  @override
  _$CustomButtonDetailCopyWith<_CustomButtonDetail> get copyWith =>
      __$CustomButtonDetailCopyWithImpl<_CustomButtonDetail>(this, _$identity);
}

abstract class _CustomButtonDetail implements CustomButtonDetail {
  const factory _CustomButtonDetail(
      {@HiveField(0) required bool enable,
      @HiveField(1) required String title,
      @HiveField(2) required String pattern}) = _$_CustomButtonDetail;

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
  @JsonKey(ignore: true)
  _$CustomButtonDetailCopyWith<_CustomButtonDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
