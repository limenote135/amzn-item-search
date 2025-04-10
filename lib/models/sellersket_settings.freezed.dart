// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sellersket_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SellerSketSettings {
  @HiveField(0)
  SellerSketReviseRule get newRule => throw _privateConstructorUsedError;
  @HiveField(1)
  SellerSketReviseRule get usedRule => throw _privateConstructorUsedError;
  @HiveField(2)
  RevisePriceStopper get lowestStopperType =>
      throw _privateConstructorUsedError;
  @HiveField(3)
  int get lowestStopperValue => throw _privateConstructorUsedError;
  @HiveField(4)
  RevisePriceStopper get highestStopperType =>
      throw _privateConstructorUsedError;
  @HiveField(5)
  int get highestStopperValue => throw _privateConstructorUsedError;
  @HiveField(6)
  String get shippingPattern => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @HiveField(0) SellerSketReviseRule newRule,
            @HiveField(1) SellerSketReviseRule usedRule,
            @HiveField(2) RevisePriceStopper lowestStopperType,
            @HiveField(3) int lowestStopperValue,
            @HiveField(4) RevisePriceStopper highestStopperType,
            @HiveField(5) int highestStopperValue,
            @HiveField(6) String shippingPattern)
        $default,
  ) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @HiveField(0) SellerSketReviseRule newRule,
            @HiveField(1) SellerSketReviseRule usedRule,
            @HiveField(2) RevisePriceStopper lowestStopperType,
            @HiveField(3) int lowestStopperValue,
            @HiveField(4) RevisePriceStopper highestStopperType,
            @HiveField(5) int highestStopperValue,
            @HiveField(6) String shippingPattern)?
        $default, {
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of SellerSketSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SellerSketSettingsCopyWith<SellerSketSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellerSketSettingsCopyWith<$Res> {
  factory $SellerSketSettingsCopyWith(
          SellerSketSettings value, $Res Function(SellerSketSettings) then) =
      _$SellerSketSettingsCopyWithImpl<$Res, SellerSketSettings>;
  @useResult
  $Res call(
      {@HiveField(0) SellerSketReviseRule newRule,
      @HiveField(1) SellerSketReviseRule usedRule,
      @HiveField(2) RevisePriceStopper lowestStopperType,
      @HiveField(3) int lowestStopperValue,
      @HiveField(4) RevisePriceStopper highestStopperType,
      @HiveField(5) int highestStopperValue,
      @HiveField(6) String shippingPattern});
}

/// @nodoc
class _$SellerSketSettingsCopyWithImpl<$Res, $Val extends SellerSketSettings>
    implements $SellerSketSettingsCopyWith<$Res> {
  _$SellerSketSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SellerSketSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newRule = null,
    Object? usedRule = null,
    Object? lowestStopperType = null,
    Object? lowestStopperValue = null,
    Object? highestStopperType = null,
    Object? highestStopperValue = null,
    Object? shippingPattern = null,
  }) {
    return _then(_value.copyWith(
      newRule: null == newRule
          ? _value.newRule
          : newRule // ignore: cast_nullable_to_non_nullable
              as SellerSketReviseRule,
      usedRule: null == usedRule
          ? _value.usedRule
          : usedRule // ignore: cast_nullable_to_non_nullable
              as SellerSketReviseRule,
      lowestStopperType: null == lowestStopperType
          ? _value.lowestStopperType
          : lowestStopperType // ignore: cast_nullable_to_non_nullable
              as RevisePriceStopper,
      lowestStopperValue: null == lowestStopperValue
          ? _value.lowestStopperValue
          : lowestStopperValue // ignore: cast_nullable_to_non_nullable
              as int,
      highestStopperType: null == highestStopperType
          ? _value.highestStopperType
          : highestStopperType // ignore: cast_nullable_to_non_nullable
              as RevisePriceStopper,
      highestStopperValue: null == highestStopperValue
          ? _value.highestStopperValue
          : highestStopperValue // ignore: cast_nullable_to_non_nullable
              as int,
      shippingPattern: null == shippingPattern
          ? _value.shippingPattern
          : shippingPattern // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SellerSketSettingsImplCopyWith<$Res>
    implements $SellerSketSettingsCopyWith<$Res> {
  factory _$$SellerSketSettingsImplCopyWith(_$SellerSketSettingsImpl value,
          $Res Function(_$SellerSketSettingsImpl) then) =
      __$$SellerSketSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) SellerSketReviseRule newRule,
      @HiveField(1) SellerSketReviseRule usedRule,
      @HiveField(2) RevisePriceStopper lowestStopperType,
      @HiveField(3) int lowestStopperValue,
      @HiveField(4) RevisePriceStopper highestStopperType,
      @HiveField(5) int highestStopperValue,
      @HiveField(6) String shippingPattern});
}

/// @nodoc
class __$$SellerSketSettingsImplCopyWithImpl<$Res>
    extends _$SellerSketSettingsCopyWithImpl<$Res, _$SellerSketSettingsImpl>
    implements _$$SellerSketSettingsImplCopyWith<$Res> {
  __$$SellerSketSettingsImplCopyWithImpl(_$SellerSketSettingsImpl _value,
      $Res Function(_$SellerSketSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SellerSketSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newRule = null,
    Object? usedRule = null,
    Object? lowestStopperType = null,
    Object? lowestStopperValue = null,
    Object? highestStopperType = null,
    Object? highestStopperValue = null,
    Object? shippingPattern = null,
  }) {
    return _then(_$SellerSketSettingsImpl(
      newRule: null == newRule
          ? _value.newRule
          : newRule // ignore: cast_nullable_to_non_nullable
              as SellerSketReviseRule,
      usedRule: null == usedRule
          ? _value.usedRule
          : usedRule // ignore: cast_nullable_to_non_nullable
              as SellerSketReviseRule,
      lowestStopperType: null == lowestStopperType
          ? _value.lowestStopperType
          : lowestStopperType // ignore: cast_nullable_to_non_nullable
              as RevisePriceStopper,
      lowestStopperValue: null == lowestStopperValue
          ? _value.lowestStopperValue
          : lowestStopperValue // ignore: cast_nullable_to_non_nullable
              as int,
      highestStopperType: null == highestStopperType
          ? _value.highestStopperType
          : highestStopperType // ignore: cast_nullable_to_non_nullable
              as RevisePriceStopper,
      highestStopperValue: null == highestStopperValue
          ? _value.highestStopperValue
          : highestStopperValue // ignore: cast_nullable_to_non_nullable
              as int,
      shippingPattern: null == shippingPattern
          ? _value.shippingPattern
          : shippingPattern // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@HiveType(typeId: sellerSketSettingsTypeId)
class _$SellerSketSettingsImpl implements _SellerSketSettings {
  const _$SellerSketSettingsImpl(
      {@HiveField(0) this.newRule = SellerSketReviseRule.cart,
      @HiveField(1) this.usedRule = SellerSketReviseRule.fbaSameCondition,
      @HiveField(2) this.lowestStopperType = RevisePriceStopper.profitValue,
      @HiveField(3) this.lowestStopperValue = 1,
      @HiveField(4) this.highestStopperType = RevisePriceStopper.nothing,
      @HiveField(5) this.highestStopperValue = 0,
      @HiveField(6) this.shippingPattern = "移行された配送パターン"});

  @override
  @JsonKey()
  @HiveField(0)
  final SellerSketReviseRule newRule;
  @override
  @JsonKey()
  @HiveField(1)
  final SellerSketReviseRule usedRule;
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
  final RevisePriceStopper highestStopperType;
  @override
  @JsonKey()
  @HiveField(5)
  final int highestStopperValue;
  @override
  @JsonKey()
  @HiveField(6)
  final String shippingPattern;

  @override
  String toString() {
    return 'SellerSketSettings(newRule: $newRule, usedRule: $usedRule, lowestStopperType: $lowestStopperType, lowestStopperValue: $lowestStopperValue, highestStopperType: $highestStopperType, highestStopperValue: $highestStopperValue, shippingPattern: $shippingPattern)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SellerSketSettingsImpl &&
            (identical(other.newRule, newRule) || other.newRule == newRule) &&
            (identical(other.usedRule, usedRule) ||
                other.usedRule == usedRule) &&
            (identical(other.lowestStopperType, lowestStopperType) ||
                other.lowestStopperType == lowestStopperType) &&
            (identical(other.lowestStopperValue, lowestStopperValue) ||
                other.lowestStopperValue == lowestStopperValue) &&
            (identical(other.highestStopperType, highestStopperType) ||
                other.highestStopperType == highestStopperType) &&
            (identical(other.highestStopperValue, highestStopperValue) ||
                other.highestStopperValue == highestStopperValue) &&
            (identical(other.shippingPattern, shippingPattern) ||
                other.shippingPattern == shippingPattern));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      newRule,
      usedRule,
      lowestStopperType,
      lowestStopperValue,
      highestStopperType,
      highestStopperValue,
      shippingPattern);

  /// Create a copy of SellerSketSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SellerSketSettingsImplCopyWith<_$SellerSketSettingsImpl> get copyWith =>
      __$$SellerSketSettingsImplCopyWithImpl<_$SellerSketSettingsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @HiveField(0) SellerSketReviseRule newRule,
            @HiveField(1) SellerSketReviseRule usedRule,
            @HiveField(2) RevisePriceStopper lowestStopperType,
            @HiveField(3) int lowestStopperValue,
            @HiveField(4) RevisePriceStopper highestStopperType,
            @HiveField(5) int highestStopperValue,
            @HiveField(6) String shippingPattern)
        $default,
  ) {
    return $default(newRule, usedRule, lowestStopperType, lowestStopperValue,
        highestStopperType, highestStopperValue, shippingPattern);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @HiveField(0) SellerSketReviseRule newRule,
            @HiveField(1) SellerSketReviseRule usedRule,
            @HiveField(2) RevisePriceStopper lowestStopperType,
            @HiveField(3) int lowestStopperValue,
            @HiveField(4) RevisePriceStopper highestStopperType,
            @HiveField(5) int highestStopperValue,
            @HiveField(6) String shippingPattern)?
        $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(newRule, usedRule, lowestStopperType, lowestStopperValue,
          highestStopperType, highestStopperValue, shippingPattern);
    }
    return orElse();
  }
}

abstract class _SellerSketSettings implements SellerSketSettings {
  const factory _SellerSketSettings(
      {@HiveField(0) final SellerSketReviseRule newRule,
      @HiveField(1) final SellerSketReviseRule usedRule,
      @HiveField(2) final RevisePriceStopper lowestStopperType,
      @HiveField(3) final int lowestStopperValue,
      @HiveField(4) final RevisePriceStopper highestStopperType,
      @HiveField(5) final int highestStopperValue,
      @HiveField(6) final String shippingPattern}) = _$SellerSketSettingsImpl;

  @override
  @HiveField(0)
  SellerSketReviseRule get newRule;
  @override
  @HiveField(1)
  SellerSketReviseRule get usedRule;
  @override
  @HiveField(2)
  RevisePriceStopper get lowestStopperType;
  @override
  @HiveField(3)
  int get lowestStopperValue;
  @override
  @HiveField(4)
  RevisePriceStopper get highestStopperType;
  @override
  @HiveField(5)
  int get highestStopperValue;
  @override
  @HiveField(6)
  String get shippingPattern;

  /// Create a copy of SellerSketSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SellerSketSettingsImplCopyWith<_$SellerSketSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
