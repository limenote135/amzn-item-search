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
  _GeneralSettings call({@HiveField(0) bool isDarkMode = false}) {
    return _GeneralSettings(
      isDarkMode: isDarkMode,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $GeneralSettings = _$GeneralSettingsTearOff();

/// @nodoc
mixin _$GeneralSettings {
  @HiveField(0)
  bool get isDarkMode;

  $GeneralSettingsCopyWith<GeneralSettings> get copyWith;
}

/// @nodoc
abstract class $GeneralSettingsCopyWith<$Res> {
  factory $GeneralSettingsCopyWith(
          GeneralSettings value, $Res Function(GeneralSettings) then) =
      _$GeneralSettingsCopyWithImpl<$Res>;
  $Res call({@HiveField(0) bool isDarkMode});
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
  }) {
    return _then(_value.copyWith(
      isDarkMode:
          isDarkMode == freezed ? _value.isDarkMode : isDarkMode as bool,
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
  $Res call({@HiveField(0) bool isDarkMode});
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
  }) {
    return _then(_GeneralSettings(
      isDarkMode:
          isDarkMode == freezed ? _value.isDarkMode : isDarkMode as bool,
    ));
  }
}

@HiveType(typeId: generalSettingsTypeId)

/// @nodoc
class _$_GeneralSettings implements _GeneralSettings {
  const _$_GeneralSettings({@HiveField(0) this.isDarkMode = false})
      : assert(isDarkMode != null);

  @JsonKey(defaultValue: false)
  @override
  @HiveField(0)
  final bool isDarkMode;

  @override
  String toString() {
    return 'GeneralSettings(isDarkMode: $isDarkMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GeneralSettings &&
            (identical(other.isDarkMode, isDarkMode) ||
                const DeepCollectionEquality()
                    .equals(other.isDarkMode, isDarkMode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(isDarkMode);

  @override
  _$GeneralSettingsCopyWith<_GeneralSettings> get copyWith =>
      __$GeneralSettingsCopyWithImpl<_GeneralSettings>(this, _$identity);
}

abstract class _GeneralSettings implements GeneralSettings {
  const factory _GeneralSettings({@HiveField(0) bool isDarkMode}) =
      _$_GeneralSettings;

  @override
  @HiveField(0)
  bool get isDarkMode;
  @override
  _$GeneralSettingsCopyWith<_GeneralSettings> get copyWith;
}
