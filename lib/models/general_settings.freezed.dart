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
          "<yyyy><mm><dd>-<asin>-<cond>-<purchasePrice>-<quantity>"}) {
    return _GeneralSettings(
      isDarkMode: isDarkMode,
      enableTargetProfit: enableTargetProfit,
      targetProfitValue: targetProfitValue,
      skuFormat: skuFormat,
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
  String get skuFormat;

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
      @HiveField(3) String skuFormat});
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
      @HiveField(3) String skuFormat});
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
          "<yyyy><mm><dd>-<asin>-<cond>-<purchasePrice>-<quantity>"})
      : assert(isDarkMode != null),
        assert(enableTargetProfit != null),
        assert(targetProfitValue != null),
        assert(skuFormat != null);

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

  @override
  String toString() {
    return 'GeneralSettings(isDarkMode: $isDarkMode, enableTargetProfit: $enableTargetProfit, targetProfitValue: $targetProfitValue, skuFormat: $skuFormat)';
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
                    .equals(other.skuFormat, skuFormat)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isDarkMode) ^
      const DeepCollectionEquality().hash(enableTargetProfit) ^
      const DeepCollectionEquality().hash(targetProfitValue) ^
      const DeepCollectionEquality().hash(skuFormat);

  @override
  _$GeneralSettingsCopyWith<_GeneralSettings> get copyWith =>
      __$GeneralSettingsCopyWithImpl<_GeneralSettings>(this, _$identity);
}

abstract class _GeneralSettings implements GeneralSettings {
  const factory _GeneralSettings(
      {@HiveField(0) bool isDarkMode,
      @HiveField(1) bool enableTargetProfit,
      @HiveField(2) int targetProfitValue,
      @HiveField(3) String skuFormat}) = _$_GeneralSettings;

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
  @override
  _$GeneralSettingsCopyWith<_GeneralSettings> get copyWith;
}
