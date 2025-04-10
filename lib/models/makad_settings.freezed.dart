// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'makad_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MakadSettings {
  @HiveField(0)
  MakadReviseRule get newRule => throw _privateConstructorUsedError;
  @HiveField(1)
  MakadReviseRule get usedRule => throw _privateConstructorUsedError;
  @HiveField(2)
  RevisePriceStopper get lowestStopperType =>
      throw _privateConstructorUsedError;
  @HiveField(3)
  int get lowestStopperValue => throw _privateConstructorUsedError;
  @HiveField(4)
  MakadPaymentMethod get paymentMethod => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @HiveField(0) MakadReviseRule newRule,
            @HiveField(1) MakadReviseRule usedRule,
            @HiveField(2) RevisePriceStopper lowestStopperType,
            @HiveField(3) int lowestStopperValue,
            @HiveField(4) MakadPaymentMethod paymentMethod)
        $default,
  ) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @HiveField(0) MakadReviseRule newRule,
            @HiveField(1) MakadReviseRule usedRule,
            @HiveField(2) RevisePriceStopper lowestStopperType,
            @HiveField(3) int lowestStopperValue,
            @HiveField(4) MakadPaymentMethod paymentMethod)?
        $default, {
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of MakadSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MakadSettingsCopyWith<MakadSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MakadSettingsCopyWith<$Res> {
  factory $MakadSettingsCopyWith(
          MakadSettings value, $Res Function(MakadSettings) then) =
      _$MakadSettingsCopyWithImpl<$Res, MakadSettings>;
  @useResult
  $Res call(
      {@HiveField(0) MakadReviseRule newRule,
      @HiveField(1) MakadReviseRule usedRule,
      @HiveField(2) RevisePriceStopper lowestStopperType,
      @HiveField(3) int lowestStopperValue,
      @HiveField(4) MakadPaymentMethod paymentMethod});
}

/// @nodoc
class _$MakadSettingsCopyWithImpl<$Res, $Val extends MakadSettings>
    implements $MakadSettingsCopyWith<$Res> {
  _$MakadSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MakadSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newRule = null,
    Object? usedRule = null,
    Object? lowestStopperType = null,
    Object? lowestStopperValue = null,
    Object? paymentMethod = null,
  }) {
    return _then(_value.copyWith(
      newRule: null == newRule
          ? _value.newRule
          : newRule // ignore: cast_nullable_to_non_nullable
              as MakadReviseRule,
      usedRule: null == usedRule
          ? _value.usedRule
          : usedRule // ignore: cast_nullable_to_non_nullable
              as MakadReviseRule,
      lowestStopperType: null == lowestStopperType
          ? _value.lowestStopperType
          : lowestStopperType // ignore: cast_nullable_to_non_nullable
              as RevisePriceStopper,
      lowestStopperValue: null == lowestStopperValue
          ? _value.lowestStopperValue
          : lowestStopperValue // ignore: cast_nullable_to_non_nullable
              as int,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as MakadPaymentMethod,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MakadSettingsImplCopyWith<$Res>
    implements $MakadSettingsCopyWith<$Res> {
  factory _$$MakadSettingsImplCopyWith(
          _$MakadSettingsImpl value, $Res Function(_$MakadSettingsImpl) then) =
      __$$MakadSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) MakadReviseRule newRule,
      @HiveField(1) MakadReviseRule usedRule,
      @HiveField(2) RevisePriceStopper lowestStopperType,
      @HiveField(3) int lowestStopperValue,
      @HiveField(4) MakadPaymentMethod paymentMethod});
}

/// @nodoc
class __$$MakadSettingsImplCopyWithImpl<$Res>
    extends _$MakadSettingsCopyWithImpl<$Res, _$MakadSettingsImpl>
    implements _$$MakadSettingsImplCopyWith<$Res> {
  __$$MakadSettingsImplCopyWithImpl(
      _$MakadSettingsImpl _value, $Res Function(_$MakadSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of MakadSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newRule = null,
    Object? usedRule = null,
    Object? lowestStopperType = null,
    Object? lowestStopperValue = null,
    Object? paymentMethod = null,
  }) {
    return _then(_$MakadSettingsImpl(
      newRule: null == newRule
          ? _value.newRule
          : newRule // ignore: cast_nullable_to_non_nullable
              as MakadReviseRule,
      usedRule: null == usedRule
          ? _value.usedRule
          : usedRule // ignore: cast_nullable_to_non_nullable
              as MakadReviseRule,
      lowestStopperType: null == lowestStopperType
          ? _value.lowestStopperType
          : lowestStopperType // ignore: cast_nullable_to_non_nullable
              as RevisePriceStopper,
      lowestStopperValue: null == lowestStopperValue
          ? _value.lowestStopperValue
          : lowestStopperValue // ignore: cast_nullable_to_non_nullable
              as int,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as MakadPaymentMethod,
    ));
  }
}

/// @nodoc

@HiveType(typeId: makadSettingsTypeId)
class _$MakadSettingsImpl implements _MakadSettings {
  const _$MakadSettingsImpl(
      {@HiveField(0) this.newRule = MakadReviseRule.cart,
      @HiveField(1) this.usedRule = MakadReviseRule.usedFbaSameCondition,
      @HiveField(2) this.lowestStopperType = RevisePriceStopper.profitValue,
      @HiveField(3) this.lowestStopperValue = 1,
      @HiveField(4) this.paymentMethod = MakadPaymentMethod.all});

  @override
  @JsonKey()
  @HiveField(0)
  final MakadReviseRule newRule;
  @override
  @JsonKey()
  @HiveField(1)
  final MakadReviseRule usedRule;
  @override
  @JsonKey()
  @HiveField(2)
  final RevisePriceStopper lowestStopperType;
  @override
  @JsonKey()
  @HiveField(3)
  final int lowestStopperValue;
  @override
  @JsonKey()
  @HiveField(4)
  final MakadPaymentMethod paymentMethod;

  @override
  String toString() {
    return 'MakadSettings(newRule: $newRule, usedRule: $usedRule, lowestStopperType: $lowestStopperType, lowestStopperValue: $lowestStopperValue, paymentMethod: $paymentMethod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MakadSettingsImpl &&
            (identical(other.newRule, newRule) || other.newRule == newRule) &&
            (identical(other.usedRule, usedRule) ||
                other.usedRule == usedRule) &&
            (identical(other.lowestStopperType, lowestStopperType) ||
                other.lowestStopperType == lowestStopperType) &&
            (identical(other.lowestStopperValue, lowestStopperValue) ||
                other.lowestStopperValue == lowestStopperValue) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newRule, usedRule,
      lowestStopperType, lowestStopperValue, paymentMethod);

  /// Create a copy of MakadSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MakadSettingsImplCopyWith<_$MakadSettingsImpl> get copyWith =>
      __$$MakadSettingsImplCopyWithImpl<_$MakadSettingsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @HiveField(0) MakadReviseRule newRule,
            @HiveField(1) MakadReviseRule usedRule,
            @HiveField(2) RevisePriceStopper lowestStopperType,
            @HiveField(3) int lowestStopperValue,
            @HiveField(4) MakadPaymentMethod paymentMethod)
        $default,
  ) {
    return $default(newRule, usedRule, lowestStopperType, lowestStopperValue,
        paymentMethod);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @HiveField(0) MakadReviseRule newRule,
            @HiveField(1) MakadReviseRule usedRule,
            @HiveField(2) RevisePriceStopper lowestStopperType,
            @HiveField(3) int lowestStopperValue,
            @HiveField(4) MakadPaymentMethod paymentMethod)?
        $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(newRule, usedRule, lowestStopperType, lowestStopperValue,
          paymentMethod);
    }
    return orElse();
  }
}

abstract class _MakadSettings implements MakadSettings {
  const factory _MakadSettings(
          {@HiveField(0) final MakadReviseRule newRule,
          @HiveField(1) final MakadReviseRule usedRule,
          @HiveField(2) final RevisePriceStopper lowestStopperType,
          @HiveField(3) final int lowestStopperValue,
          @HiveField(4) final MakadPaymentMethod paymentMethod}) =
      _$MakadSettingsImpl;

  @override
  @HiveField(0)
  MakadReviseRule get newRule;
  @override
  @HiveField(1)
  MakadReviseRule get usedRule;
  @override
  @HiveField(2)
  RevisePriceStopper get lowestStopperType;
  @override
  @HiveField(3)
  int get lowestStopperValue;
  @override
  @HiveField(4)
  MakadPaymentMethod get paymentMethod;

  /// Create a copy of MakadSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MakadSettingsImplCopyWith<_$MakadSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
