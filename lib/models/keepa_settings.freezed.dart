// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'keepa_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$KeepaSettingsTearOff {
  const _$KeepaSettingsTearOff();

  _KeepaSettings call(
      {@HiveField(0, defaultValue: true)
          bool showNew = true,
      @HiveField(1, defaultValue: true)
          bool showUsed = true,
      @HiveField(2, defaultValue: true)
          bool showAmazon = true,
      @HiveField(3, defaultValue: KeepaShowPeriod.month)
          KeepaShowPeriod period = KeepaShowPeriod.month}) {
    return _KeepaSettings(
      showNew: showNew,
      showUsed: showUsed,
      showAmazon: showAmazon,
      period: period,
    );
  }
}

/// @nodoc
const $KeepaSettings = _$KeepaSettingsTearOff();

/// @nodoc
mixin _$KeepaSettings {
  @HiveField(0, defaultValue: true)
  bool get showNew => throw _privateConstructorUsedError;
  @HiveField(1, defaultValue: true)
  bool get showUsed => throw _privateConstructorUsedError;
  @HiveField(2, defaultValue: true)
  bool get showAmazon => throw _privateConstructorUsedError;
  @HiveField(3, defaultValue: KeepaShowPeriod.month)
  KeepaShowPeriod get period => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $KeepaSettingsCopyWith<KeepaSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeepaSettingsCopyWith<$Res> {
  factory $KeepaSettingsCopyWith(
          KeepaSettings value, $Res Function(KeepaSettings) then) =
      _$KeepaSettingsCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0, defaultValue: true)
          bool showNew,
      @HiveField(1, defaultValue: true)
          bool showUsed,
      @HiveField(2, defaultValue: true)
          bool showAmazon,
      @HiveField(3, defaultValue: KeepaShowPeriod.month)
          KeepaShowPeriod period});
}

/// @nodoc
class _$KeepaSettingsCopyWithImpl<$Res>
    implements $KeepaSettingsCopyWith<$Res> {
  _$KeepaSettingsCopyWithImpl(this._value, this._then);

  final KeepaSettings _value;
  // ignore: unused_field
  final $Res Function(KeepaSettings) _then;

  @override
  $Res call({
    Object? showNew = freezed,
    Object? showUsed = freezed,
    Object? showAmazon = freezed,
    Object? period = freezed,
  }) {
    return _then(_value.copyWith(
      showNew: showNew == freezed
          ? _value.showNew
          : showNew // ignore: cast_nullable_to_non_nullable
              as bool,
      showUsed: showUsed == freezed
          ? _value.showUsed
          : showUsed // ignore: cast_nullable_to_non_nullable
              as bool,
      showAmazon: showAmazon == freezed
          ? _value.showAmazon
          : showAmazon // ignore: cast_nullable_to_non_nullable
              as bool,
      period: period == freezed
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as KeepaShowPeriod,
    ));
  }
}

/// @nodoc
abstract class _$KeepaSettingsCopyWith<$Res>
    implements $KeepaSettingsCopyWith<$Res> {
  factory _$KeepaSettingsCopyWith(
          _KeepaSettings value, $Res Function(_KeepaSettings) then) =
      __$KeepaSettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0, defaultValue: true)
          bool showNew,
      @HiveField(1, defaultValue: true)
          bool showUsed,
      @HiveField(2, defaultValue: true)
          bool showAmazon,
      @HiveField(3, defaultValue: KeepaShowPeriod.month)
          KeepaShowPeriod period});
}

/// @nodoc
class __$KeepaSettingsCopyWithImpl<$Res>
    extends _$KeepaSettingsCopyWithImpl<$Res>
    implements _$KeepaSettingsCopyWith<$Res> {
  __$KeepaSettingsCopyWithImpl(
      _KeepaSettings _value, $Res Function(_KeepaSettings) _then)
      : super(_value, (v) => _then(v as _KeepaSettings));

  @override
  _KeepaSettings get _value => super._value as _KeepaSettings;

  @override
  $Res call({
    Object? showNew = freezed,
    Object? showUsed = freezed,
    Object? showAmazon = freezed,
    Object? period = freezed,
  }) {
    return _then(_KeepaSettings(
      showNew: showNew == freezed
          ? _value.showNew
          : showNew // ignore: cast_nullable_to_non_nullable
              as bool,
      showUsed: showUsed == freezed
          ? _value.showUsed
          : showUsed // ignore: cast_nullable_to_non_nullable
              as bool,
      showAmazon: showAmazon == freezed
          ? _value.showAmazon
          : showAmazon // ignore: cast_nullable_to_non_nullable
              as bool,
      period: period == freezed
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as KeepaShowPeriod,
    ));
  }
}

/// @nodoc

@HiveType(typeId: keepaSettingsTypeId)
class _$_KeepaSettings implements _KeepaSettings {
  const _$_KeepaSettings(
      {@HiveField(0, defaultValue: true)
          this.showNew = true,
      @HiveField(1, defaultValue: true)
          this.showUsed = true,
      @HiveField(2, defaultValue: true)
          this.showAmazon = true,
      @HiveField(3, defaultValue: KeepaShowPeriod.month)
          this.period = KeepaShowPeriod.month});

  @JsonKey(defaultValue: true)
  @override
  @HiveField(0, defaultValue: true)
  final bool showNew;
  @JsonKey(defaultValue: true)
  @override
  @HiveField(1, defaultValue: true)
  final bool showUsed;
  @JsonKey(defaultValue: true)
  @override
  @HiveField(2, defaultValue: true)
  final bool showAmazon;
  @JsonKey(defaultValue: KeepaShowPeriod.month)
  @override
  @HiveField(3, defaultValue: KeepaShowPeriod.month)
  final KeepaShowPeriod period;

  @override
  String toString() {
    return 'KeepaSettings(showNew: $showNew, showUsed: $showUsed, showAmazon: $showAmazon, period: $period)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _KeepaSettings &&
            (identical(other.showNew, showNew) ||
                const DeepCollectionEquality()
                    .equals(other.showNew, showNew)) &&
            (identical(other.showUsed, showUsed) ||
                const DeepCollectionEquality()
                    .equals(other.showUsed, showUsed)) &&
            (identical(other.showAmazon, showAmazon) ||
                const DeepCollectionEquality()
                    .equals(other.showAmazon, showAmazon)) &&
            (identical(other.period, period) ||
                const DeepCollectionEquality().equals(other.period, period)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(showNew) ^
      const DeepCollectionEquality().hash(showUsed) ^
      const DeepCollectionEquality().hash(showAmazon) ^
      const DeepCollectionEquality().hash(period);

  @JsonKey(ignore: true)
  @override
  _$KeepaSettingsCopyWith<_KeepaSettings> get copyWith =>
      __$KeepaSettingsCopyWithImpl<_KeepaSettings>(this, _$identity);
}

abstract class _KeepaSettings implements KeepaSettings {
  const factory _KeepaSettings(
      {@HiveField(0, defaultValue: true)
          bool showNew,
      @HiveField(1, defaultValue: true)
          bool showUsed,
      @HiveField(2, defaultValue: true)
          bool showAmazon,
      @HiveField(3, defaultValue: KeepaShowPeriod.month)
          KeepaShowPeriod period}) = _$_KeepaSettings;

  @override
  @HiveField(0, defaultValue: true)
  bool get showNew => throw _privateConstructorUsedError;
  @override
  @HiveField(1, defaultValue: true)
  bool get showUsed => throw _privateConstructorUsedError;
  @override
  @HiveField(2, defaultValue: true)
  bool get showAmazon => throw _privateConstructorUsedError;
  @override
  @HiveField(3, defaultValue: KeepaShowPeriod.month)
  KeepaShowPeriod get period => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$KeepaSettingsCopyWith<_KeepaSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
