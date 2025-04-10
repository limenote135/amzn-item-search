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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
  @HiveField(7, defaultValue: false)
  bool get useApiKey => throw _privateConstructorUsedError;
  @HiveField(8, defaultValue: "")
  String get apiKey => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @HiveField(0, defaultValue: true) bool showNew,
            @HiveField(1, defaultValue: true) bool showUsed,
            @HiveField(2, defaultValue: true) bool showAmazon,
            @HiveField(3, defaultValue: KeepaShowPeriod.month)
            KeepaShowPeriod period,
            @HiveField(4, defaultValue: "") String extraParam,
            @HiveField(5, defaultValue: true) bool showBuyBox,
            @HiveField(6, defaultValue: false) bool showFba,
            @HiveField(7, defaultValue: false) bool useApiKey,
            @HiveField(8, defaultValue: "") String apiKey)
        $default,
  ) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @HiveField(0, defaultValue: true) bool showNew,
            @HiveField(1, defaultValue: true) bool showUsed,
            @HiveField(2, defaultValue: true) bool showAmazon,
            @HiveField(3, defaultValue: KeepaShowPeriod.month)
            KeepaShowPeriod period,
            @HiveField(4, defaultValue: "") String extraParam,
            @HiveField(5, defaultValue: true) bool showBuyBox,
            @HiveField(6, defaultValue: false) bool showFba,
            @HiveField(7, defaultValue: false) bool useApiKey,
            @HiveField(8, defaultValue: "") String apiKey)?
        $default, {
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of KeepaSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      @HiveField(6, defaultValue: false) bool showFba,
      @HiveField(7, defaultValue: false) bool useApiKey,
      @HiveField(8, defaultValue: "") String apiKey});
}

/// @nodoc
class _$KeepaSettingsCopyWithImpl<$Res, $Val extends KeepaSettings>
    implements $KeepaSettingsCopyWith<$Res> {
  _$KeepaSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KeepaSettings
  /// with the given fields replaced by the non-null parameter values.
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
    Object? useApiKey = null,
    Object? apiKey = null,
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
      useApiKey: null == useApiKey
          ? _value.useApiKey
          : useApiKey // ignore: cast_nullable_to_non_nullable
              as bool,
      apiKey: null == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KeepaSettingsImplCopyWith<$Res>
    implements $KeepaSettingsCopyWith<$Res> {
  factory _$$KeepaSettingsImplCopyWith(
          _$KeepaSettingsImpl value, $Res Function(_$KeepaSettingsImpl) then) =
      __$$KeepaSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0, defaultValue: true) bool showNew,
      @HiveField(1, defaultValue: true) bool showUsed,
      @HiveField(2, defaultValue: true) bool showAmazon,
      @HiveField(3, defaultValue: KeepaShowPeriod.month) KeepaShowPeriod period,
      @HiveField(4, defaultValue: "") String extraParam,
      @HiveField(5, defaultValue: true) bool showBuyBox,
      @HiveField(6, defaultValue: false) bool showFba,
      @HiveField(7, defaultValue: false) bool useApiKey,
      @HiveField(8, defaultValue: "") String apiKey});
}

/// @nodoc
class __$$KeepaSettingsImplCopyWithImpl<$Res>
    extends _$KeepaSettingsCopyWithImpl<$Res, _$KeepaSettingsImpl>
    implements _$$KeepaSettingsImplCopyWith<$Res> {
  __$$KeepaSettingsImplCopyWithImpl(
      _$KeepaSettingsImpl _value, $Res Function(_$KeepaSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of KeepaSettings
  /// with the given fields replaced by the non-null parameter values.
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
    Object? useApiKey = null,
    Object? apiKey = null,
  }) {
    return _then(_$KeepaSettingsImpl(
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
      useApiKey: null == useApiKey
          ? _value.useApiKey
          : useApiKey // ignore: cast_nullable_to_non_nullable
              as bool,
      apiKey: null == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@HiveType(typeId: keepaSettingsTypeId)
class _$KeepaSettingsImpl implements _KeepaSettings {
  const _$KeepaSettingsImpl(
      {@HiveField(0, defaultValue: true) this.showNew = true,
      @HiveField(1, defaultValue: true) this.showUsed = true,
      @HiveField(2, defaultValue: true) this.showAmazon = true,
      @HiveField(3, defaultValue: KeepaShowPeriod.month)
      this.period = KeepaShowPeriod.month,
      @HiveField(4, defaultValue: "") this.extraParam = "",
      @HiveField(5, defaultValue: true) this.showBuyBox = true,
      @HiveField(6, defaultValue: false) this.showFba = false,
      @HiveField(7, defaultValue: false) this.useApiKey = false,
      @HiveField(8, defaultValue: "") this.apiKey = ""});

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
  @JsonKey()
  @HiveField(7, defaultValue: false)
  final bool useApiKey;
  @override
  @JsonKey()
  @HiveField(8, defaultValue: "")
  final String apiKey;

  @override
  String toString() {
    return 'KeepaSettings(showNew: $showNew, showUsed: $showUsed, showAmazon: $showAmazon, period: $period, extraParam: $extraParam, showBuyBox: $showBuyBox, showFba: $showFba, useApiKey: $useApiKey, apiKey: $apiKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KeepaSettingsImpl &&
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
            (identical(other.showFba, showFba) || other.showFba == showFba) &&
            (identical(other.useApiKey, useApiKey) ||
                other.useApiKey == useApiKey) &&
            (identical(other.apiKey, apiKey) || other.apiKey == apiKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, showNew, showUsed, showAmazon,
      period, extraParam, showBuyBox, showFba, useApiKey, apiKey);

  /// Create a copy of KeepaSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KeepaSettingsImplCopyWith<_$KeepaSettingsImpl> get copyWith =>
      __$$KeepaSettingsImplCopyWithImpl<_$KeepaSettingsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @HiveField(0, defaultValue: true) bool showNew,
            @HiveField(1, defaultValue: true) bool showUsed,
            @HiveField(2, defaultValue: true) bool showAmazon,
            @HiveField(3, defaultValue: KeepaShowPeriod.month)
            KeepaShowPeriod period,
            @HiveField(4, defaultValue: "") String extraParam,
            @HiveField(5, defaultValue: true) bool showBuyBox,
            @HiveField(6, defaultValue: false) bool showFba,
            @HiveField(7, defaultValue: false) bool useApiKey,
            @HiveField(8, defaultValue: "") String apiKey)
        $default,
  ) {
    return $default(showNew, showUsed, showAmazon, period, extraParam,
        showBuyBox, showFba, useApiKey, apiKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @HiveField(0, defaultValue: true) bool showNew,
            @HiveField(1, defaultValue: true) bool showUsed,
            @HiveField(2, defaultValue: true) bool showAmazon,
            @HiveField(3, defaultValue: KeepaShowPeriod.month)
            KeepaShowPeriod period,
            @HiveField(4, defaultValue: "") String extraParam,
            @HiveField(5, defaultValue: true) bool showBuyBox,
            @HiveField(6, defaultValue: false) bool showFba,
            @HiveField(7, defaultValue: false) bool useApiKey,
            @HiveField(8, defaultValue: "") String apiKey)?
        $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(showNew, showUsed, showAmazon, period, extraParam,
          showBuyBox, showFba, useApiKey, apiKey);
    }
    return orElse();
  }
}

abstract class _KeepaSettings implements KeepaSettings {
  const factory _KeepaSettings(
          {@HiveField(0, defaultValue: true) final bool showNew,
          @HiveField(1, defaultValue: true) final bool showUsed,
          @HiveField(2, defaultValue: true) final bool showAmazon,
          @HiveField(3, defaultValue: KeepaShowPeriod.month)
          final KeepaShowPeriod period,
          @HiveField(4, defaultValue: "") final String extraParam,
          @HiveField(5, defaultValue: true) final bool showBuyBox,
          @HiveField(6, defaultValue: false) final bool showFba,
          @HiveField(7, defaultValue: false) final bool useApiKey,
          @HiveField(8, defaultValue: "") final String apiKey}) =
      _$KeepaSettingsImpl;

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
  @HiveField(7, defaultValue: false)
  bool get useApiKey;
  @override
  @HiveField(8, defaultValue: "")
  String get apiKey;

  /// Create a copy of KeepaSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KeepaSettingsImplCopyWith<_$KeepaSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
