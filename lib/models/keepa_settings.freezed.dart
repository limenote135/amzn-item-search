// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'keepa_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
  @HiveField(4, defaultValue: "")
  String get extraParam => throw _privateConstructorUsedError;
  @HiveField(5, defaultValue: true)
  bool get showBuyBox => throw _privateConstructorUsedError;
  @HiveField(6, defaultValue: false)
  bool get showFba => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $KeepaSettingsCopyWith<KeepaSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeepaSettingsCopyWith<$Res> {
  factory $KeepaSettingsCopyWith(
          KeepaSettings value, $Res Function(KeepaSettings) then) =
      _$KeepaSettingsCopyWithImpl<$Res, KeepaSettings>;
  @useResult
  $Res call(
      {@HiveField(0, defaultValue: true) bool showNew,
      @HiveField(1, defaultValue: true) bool showUsed,
      @HiveField(2, defaultValue: true) bool showAmazon,
      @HiveField(3, defaultValue: KeepaShowPeriod.month) KeepaShowPeriod period,
      @HiveField(4, defaultValue: "") String extraParam,
      @HiveField(5, defaultValue: true) bool showBuyBox,
      @HiveField(6, defaultValue: false) bool showFba});
}

/// @nodoc
class _$KeepaSettingsCopyWithImpl<$Res, $Val extends KeepaSettings>
    implements $KeepaSettingsCopyWith<$Res> {
  _$KeepaSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showNew = null,
    Object? showUsed = null,
    Object? showAmazon = null,
    Object? period = null,
    Object? extraParam = null,
    Object? showBuyBox = null,
    Object? showFba = null,
  }) {
    return _then(_value.copyWith(
      showNew: null == showNew
          ? _value.showNew
          : showNew // ignore: cast_nullable_to_non_nullable
              as bool,
      showUsed: null == showUsed
          ? _value.showUsed
          : showUsed // ignore: cast_nullable_to_non_nullable
              as bool,
      showAmazon: null == showAmazon
          ? _value.showAmazon
          : showAmazon // ignore: cast_nullable_to_non_nullable
              as bool,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as KeepaShowPeriod,
      extraParam: null == extraParam
          ? _value.extraParam
          : extraParam // ignore: cast_nullable_to_non_nullable
              as String,
      showBuyBox: null == showBuyBox
          ? _value.showBuyBox
          : showBuyBox // ignore: cast_nullable_to_non_nullable
              as bool,
      showFba: null == showFba
          ? _value.showFba
          : showFba // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_KeepaSettingsCopyWith<$Res>
    implements $KeepaSettingsCopyWith<$Res> {
  factory _$$_KeepaSettingsCopyWith(
          _$_KeepaSettings value, $Res Function(_$_KeepaSettings) then) =
      __$$_KeepaSettingsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0, defaultValue: true) bool showNew,
      @HiveField(1, defaultValue: true) bool showUsed,
      @HiveField(2, defaultValue: true) bool showAmazon,
      @HiveField(3, defaultValue: KeepaShowPeriod.month) KeepaShowPeriod period,
      @HiveField(4, defaultValue: "") String extraParam,
      @HiveField(5, defaultValue: true) bool showBuyBox,
      @HiveField(6, defaultValue: false) bool showFba});
}

/// @nodoc
class __$$_KeepaSettingsCopyWithImpl<$Res>
    extends _$KeepaSettingsCopyWithImpl<$Res, _$_KeepaSettings>
    implements _$$_KeepaSettingsCopyWith<$Res> {
  __$$_KeepaSettingsCopyWithImpl(
      _$_KeepaSettings _value, $Res Function(_$_KeepaSettings) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showNew = null,
    Object? showUsed = null,
    Object? showAmazon = null,
    Object? period = null,
    Object? extraParam = null,
    Object? showBuyBox = null,
    Object? showFba = null,
  }) {
    return _then(_$_KeepaSettings(
      showNew: null == showNew
          ? _value.showNew
          : showNew // ignore: cast_nullable_to_non_nullable
              as bool,
      showUsed: null == showUsed
          ? _value.showUsed
          : showUsed // ignore: cast_nullable_to_non_nullable
              as bool,
      showAmazon: null == showAmazon
          ? _value.showAmazon
          : showAmazon // ignore: cast_nullable_to_non_nullable
              as bool,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as KeepaShowPeriod,
      extraParam: null == extraParam
          ? _value.extraParam
          : extraParam // ignore: cast_nullable_to_non_nullable
              as String,
      showBuyBox: null == showBuyBox
          ? _value.showBuyBox
          : showBuyBox // ignore: cast_nullable_to_non_nullable
              as bool,
      showFba: null == showFba
          ? _value.showFba
          : showFba // ignore: cast_nullable_to_non_nullable
              as bool,
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
          this.period = KeepaShowPeriod.month,
      @HiveField(4, defaultValue: "")
          this.extraParam = "",
      @HiveField(5, defaultValue: true)
          this.showBuyBox = true,
      @HiveField(6, defaultValue: false)
          this.showFba = false});

  @override
  @JsonKey()
  @HiveField(0, defaultValue: true)
  final bool showNew;
  @override
  @JsonKey()
  @HiveField(1, defaultValue: true)
  final bool showUsed;
  @override
  @JsonKey()
  @HiveField(2, defaultValue: true)
  final bool showAmazon;
  @override
  @JsonKey()
  @HiveField(3, defaultValue: KeepaShowPeriod.month)
  final KeepaShowPeriod period;
  @override
  @JsonKey()
  @HiveField(4, defaultValue: "")
  final String extraParam;
  @override
  @JsonKey()
  @HiveField(5, defaultValue: true)
  final bool showBuyBox;
  @override
  @JsonKey()
  @HiveField(6, defaultValue: false)
  final bool showFba;

  @override
  String toString() {
    return 'KeepaSettings(showNew: $showNew, showUsed: $showUsed, showAmazon: $showAmazon, period: $period, extraParam: $extraParam, showBuyBox: $showBuyBox, showFba: $showFba)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KeepaSettings &&
            (identical(other.showNew, showNew) || other.showNew == showNew) &&
            (identical(other.showUsed, showUsed) ||
                other.showUsed == showUsed) &&
            (identical(other.showAmazon, showAmazon) ||
                other.showAmazon == showAmazon) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.extraParam, extraParam) ||
                other.extraParam == extraParam) &&
            (identical(other.showBuyBox, showBuyBox) ||
                other.showBuyBox == showBuyBox) &&
            (identical(other.showFba, showFba) || other.showFba == showFba));
  }

  @override
  int get hashCode => Object.hash(runtimeType, showNew, showUsed, showAmazon,
      period, extraParam, showBuyBox, showFba);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KeepaSettingsCopyWith<_$_KeepaSettings> get copyWith =>
      __$$_KeepaSettingsCopyWithImpl<_$_KeepaSettings>(this, _$identity);
}

abstract class _KeepaSettings implements KeepaSettings {
  const factory _KeepaSettings(
      {@HiveField(0, defaultValue: true)
          final bool showNew,
      @HiveField(1, defaultValue: true)
          final bool showUsed,
      @HiveField(2, defaultValue: true)
          final bool showAmazon,
      @HiveField(3, defaultValue: KeepaShowPeriod.month)
          final KeepaShowPeriod period,
      @HiveField(4, defaultValue: "")
          final String extraParam,
      @HiveField(5, defaultValue: true)
          final bool showBuyBox,
      @HiveField(6, defaultValue: false)
          final bool showFba}) = _$_KeepaSettings;

  @override
  @HiveField(0, defaultValue: true)
  bool get showNew;
  @override
  @HiveField(1, defaultValue: true)
  bool get showUsed;
  @override
  @HiveField(2, defaultValue: true)
  bool get showAmazon;
  @override
  @HiveField(3, defaultValue: KeepaShowPeriod.month)
  KeepaShowPeriod get period;
  @override
  @HiveField(4, defaultValue: "")
  String get extraParam;
  @override
  @HiveField(5, defaultValue: true)
  bool get showBuyBox;
  @override
  @HiveField(6, defaultValue: false)
  bool get showFba;
  @override
  @JsonKey(ignore: true)
  _$$_KeepaSettingsCopyWith<_$_KeepaSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
