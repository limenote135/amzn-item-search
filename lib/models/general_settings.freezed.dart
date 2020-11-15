// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'general_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$GeneralSettingsTearOff {
  const _$GeneralSettingsTearOff();

// ignore: unused_element
  _GeneralSettings call(
      {@HiveField(0) bool isDarkMode = false,
      @HiveField(1) bool enableTargetProfit = false,
      @HiveField(2) int targetProfitValue = 10,
      @HiveField(3) String skuFormat =
          "<yyyy><mm><dd>-<asin>-<cond>-<purchasePrice>-<quantity>",
      @HiveField(4) List<String> retailers = const <String>[],
      @HiveField(5) bool enableReadAloud = false,
      @HiveField(6) int patternIndex = 0,
      @HiveField(7) List<ReadAloudPattern> readAloudPatterns = const [
        const ReadAloudPattern(title: "パターン1", pattern: _readAloudPattern1),
        const ReadAloudPattern(title: "パターン2", pattern: _readAloudPattern2),
        const ReadAloudPattern(title: "パターン3", pattern: _readAloudPattern3)
      ],
      @HiveField(8) double readAloudVolume = 1.0,
      @HiveField(9) @nullable double readAloudSpeed}) {
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
    );
  }
}

/// @nodoc
// ignore: unused_element
const $GeneralSettings = _$GeneralSettingsTearOff();

/// @nodoc
mixin _$GeneralSettings {
  @HiveField(0)
  bool get isDarkMode; // 目標利益率設定
  @HiveField(1)
  bool get enableTargetProfit;
  @HiveField(2)
  int get targetProfitValue; // SKU 設定
  @HiveField(3)
  String get skuFormat; // 仕入れ先設定
  @HiveField(4)
  List<String> get retailers; // 読み上げ設定
  @HiveField(5)
  bool get enableReadAloud;
  @HiveField(6)
  int get patternIndex;
  @HiveField(7)
  List<ReadAloudPattern> get readAloudPatterns;
  @HiveField(8)
  double get readAloudVolume;
  @HiveField(9)
  @nullable
  double get readAloudSpeed;

  $GeneralSettingsCopyWith<GeneralSettings> get copyWith;
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
      @HiveField(9) @nullable double readAloudSpeed});
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
    Object isDarkMode = freezed,
    Object enableTargetProfit = freezed,
    Object targetProfitValue = freezed,
    Object skuFormat = freezed,
    Object retailers = freezed,
    Object enableReadAloud = freezed,
    Object patternIndex = freezed,
    Object readAloudPatterns = freezed,
    Object readAloudVolume = freezed,
    Object readAloudSpeed = freezed,
  }) {
    return _then(_value.copyWith(
      isDarkMode:
          isDarkMode == freezed ? _value.isDarkMode : isDarkMode as bool,
      enableTargetProfit: enableTargetProfit == freezed
          ? _value.enableTargetProfit
          : enableTargetProfit as bool,
      targetProfitValue: targetProfitValue == freezed
          ? _value.targetProfitValue
          : targetProfitValue as int,
      skuFormat: skuFormat == freezed ? _value.skuFormat : skuFormat as String,
      retailers:
          retailers == freezed ? _value.retailers : retailers as List<String>,
      enableReadAloud: enableReadAloud == freezed
          ? _value.enableReadAloud
          : enableReadAloud as bool,
      patternIndex:
          patternIndex == freezed ? _value.patternIndex : patternIndex as int,
      readAloudPatterns: readAloudPatterns == freezed
          ? _value.readAloudPatterns
          : readAloudPatterns as List<ReadAloudPattern>,
      readAloudVolume: readAloudVolume == freezed
          ? _value.readAloudVolume
          : readAloudVolume as double,
      readAloudSpeed: readAloudSpeed == freezed
          ? _value.readAloudSpeed
          : readAloudSpeed as double,
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
      @HiveField(9) @nullable double readAloudSpeed});
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
    Object isDarkMode = freezed,
    Object enableTargetProfit = freezed,
    Object targetProfitValue = freezed,
    Object skuFormat = freezed,
    Object retailers = freezed,
    Object enableReadAloud = freezed,
    Object patternIndex = freezed,
    Object readAloudPatterns = freezed,
    Object readAloudVolume = freezed,
    Object readAloudSpeed = freezed,
  }) {
    return _then(_GeneralSettings(
      isDarkMode:
          isDarkMode == freezed ? _value.isDarkMode : isDarkMode as bool,
      enableTargetProfit: enableTargetProfit == freezed
          ? _value.enableTargetProfit
          : enableTargetProfit as bool,
      targetProfitValue: targetProfitValue == freezed
          ? _value.targetProfitValue
          : targetProfitValue as int,
      skuFormat: skuFormat == freezed ? _value.skuFormat : skuFormat as String,
      retailers:
          retailers == freezed ? _value.retailers : retailers as List<String>,
      enableReadAloud: enableReadAloud == freezed
          ? _value.enableReadAloud
          : enableReadAloud as bool,
      patternIndex:
          patternIndex == freezed ? _value.patternIndex : patternIndex as int,
      readAloudPatterns: readAloudPatterns == freezed
          ? _value.readAloudPatterns
          : readAloudPatterns as List<ReadAloudPattern>,
      readAloudVolume: readAloudVolume == freezed
          ? _value.readAloudVolume
          : readAloudVolume as double,
      readAloudSpeed: readAloudSpeed == freezed
          ? _value.readAloudSpeed
          : readAloudSpeed as double,
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
      @HiveField(3) this.skuFormat =
          "<yyyy><mm><dd>-<asin>-<cond>-<purchasePrice>-<quantity>",
      @HiveField(4) this.retailers = const <String>[],
      @HiveField(5) this.enableReadAloud = false,
      @HiveField(6) this.patternIndex = 0,
      @HiveField(7) this.readAloudPatterns = const [
        const ReadAloudPattern(title: "パターン1", pattern: _readAloudPattern1),
        const ReadAloudPattern(title: "パターン2", pattern: _readAloudPattern2),
        const ReadAloudPattern(title: "パターン3", pattern: _readAloudPattern3)
      ],
      @HiveField(8) this.readAloudVolume = 1.0,
      @HiveField(9) @nullable this.readAloudSpeed})
      : assert(isDarkMode != null),
        assert(enableTargetProfit != null),
        assert(targetProfitValue != null),
        assert(skuFormat != null),
        assert(retailers != null),
        assert(enableReadAloud != null),
        assert(patternIndex != null),
        assert(readAloudPatterns != null),
        assert(readAloudVolume != null);

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
  @JsonKey(
      defaultValue: "<yyyy><mm><dd>-<asin>-<cond>-<purchasePrice>-<quantity>")
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
  @JsonKey(defaultValue: const [
    const ReadAloudPattern(title: "パターン1", pattern: _readAloudPattern1),
    const ReadAloudPattern(title: "パターン2", pattern: _readAloudPattern2),
    const ReadAloudPattern(title: "パターン3", pattern: _readAloudPattern3)
  ])
  @override
  @HiveField(7)
  final List<ReadAloudPattern> readAloudPatterns;
  @JsonKey(defaultValue: 1.0)
  @override
  @HiveField(8)
  final double readAloudVolume;
  @override
  @HiveField(9)
  @nullable
  final double readAloudSpeed;

  @override
  String toString() {
    return 'GeneralSettings(isDarkMode: $isDarkMode, enableTargetProfit: $enableTargetProfit, targetProfitValue: $targetProfitValue, skuFormat: $skuFormat, retailers: $retailers, enableReadAloud: $enableReadAloud, patternIndex: $patternIndex, readAloudPatterns: $readAloudPatterns, readAloudVolume: $readAloudVolume, readAloudSpeed: $readAloudSpeed)';
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
                    .equals(other.readAloudSpeed, readAloudSpeed)));
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
      const DeepCollectionEquality().hash(readAloudSpeed);

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
      @HiveField(9) @nullable double readAloudSpeed}) = _$_GeneralSettings;

  @override
  @HiveField(0)
  bool get isDarkMode;
  @override // 目標利益率設定
  @HiveField(1)
  bool get enableTargetProfit;
  @override
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
  @nullable
  double get readAloudSpeed;
  @override
  _$GeneralSettingsCopyWith<_GeneralSettings> get copyWith;
}

/// @nodoc
class _$ReadAloudPatternTearOff {
  const _$ReadAloudPatternTearOff();

// ignore: unused_element
  _ReadAloudPattern call(
      {@required @HiveField(0) String title,
      @required @HiveField(1) String pattern}) {
    return _ReadAloudPattern(
      title: title,
      pattern: pattern,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ReadAloudPattern = _$ReadAloudPatternTearOff();

/// @nodoc
mixin _$ReadAloudPattern {
  @HiveField(0)
  String get title;
  @HiveField(1)
  String get pattern;

  $ReadAloudPatternCopyWith<ReadAloudPattern> get copyWith;
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
    Object title = freezed,
    Object pattern = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed ? _value.title : title as String,
      pattern: pattern == freezed ? _value.pattern : pattern as String,
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
    Object title = freezed,
    Object pattern = freezed,
  }) {
    return _then(_ReadAloudPattern(
      title: title == freezed ? _value.title : title as String,
      pattern: pattern == freezed ? _value.pattern : pattern as String,
    ));
  }
}

@HiveType(typeId: readAloudPatternTypeId)

/// @nodoc
class _$_ReadAloudPattern implements _ReadAloudPattern {
  const _$_ReadAloudPattern(
      {@required @HiveField(0) this.title,
      @required @HiveField(1) this.pattern})
      : assert(title != null),
        assert(pattern != null);

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

  @override
  _$ReadAloudPatternCopyWith<_ReadAloudPattern> get copyWith =>
      __$ReadAloudPatternCopyWithImpl<_ReadAloudPattern>(this, _$identity);
}

abstract class _ReadAloudPattern implements ReadAloudPattern {
  const factory _ReadAloudPattern(
      {@required @HiveField(0) String title,
      @required @HiveField(1) String pattern}) = _$_ReadAloudPattern;

  @override
  @HiveField(0)
  String get title;
  @override
  @HiveField(1)
  String get pattern;
  @override
  _$ReadAloudPatternCopyWith<_ReadAloudPattern> get copyWith;
}
