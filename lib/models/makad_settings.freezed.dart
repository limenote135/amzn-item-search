// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'makad_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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

  @JsonKey(ignore: true)
  $MakadSettingsCopyWith<MakadSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MakadSettingsCopyWith<$Res> {
  factory $MakadSettingsCopyWith(
          MakadSettings value, $Res Function(MakadSettings) then) =
      _$MakadSettingsCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) MakadReviseRule newRule,
      @HiveField(1) MakadReviseRule usedRule,
      @HiveField(2) RevisePriceStopper lowestStopperType,
      @HiveField(3) int lowestStopperValue,
      @HiveField(4) MakadPaymentMethod paymentMethod});
}

/// @nodoc
class _$MakadSettingsCopyWithImpl<$Res>
    implements $MakadSettingsCopyWith<$Res> {
  _$MakadSettingsCopyWithImpl(this._value, this._then);

  final MakadSettings _value;
  // ignore: unused_field
  final $Res Function(MakadSettings) _then;

  @override
  $Res call({
    Object? newRule = freezed,
    Object? usedRule = freezed,
    Object? lowestStopperType = freezed,
    Object? lowestStopperValue = freezed,
    Object? paymentMethod = freezed,
  }) {
    return _then(_value.copyWith(
      newRule: newRule == freezed
          ? _value.newRule
          : newRule // ignore: cast_nullable_to_non_nullable
              as MakadReviseRule,
      usedRule: usedRule == freezed
          ? _value.usedRule
          : usedRule // ignore: cast_nullable_to_non_nullable
              as MakadReviseRule,
      lowestStopperType: lowestStopperType == freezed
          ? _value.lowestStopperType
          : lowestStopperType // ignore: cast_nullable_to_non_nullable
              as RevisePriceStopper,
      lowestStopperValue: lowestStopperValue == freezed
          ? _value.lowestStopperValue
          : lowestStopperValue // ignore: cast_nullable_to_non_nullable
              as int,
      paymentMethod: paymentMethod == freezed
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as MakadPaymentMethod,
    ));
  }
}

/// @nodoc
abstract class _$$_MakadSettingsCopyWith<$Res>
    implements $MakadSettingsCopyWith<$Res> {
  factory _$$_MakadSettingsCopyWith(
          _$_MakadSettings value, $Res Function(_$_MakadSettings) then) =
      __$$_MakadSettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) MakadReviseRule newRule,
      @HiveField(1) MakadReviseRule usedRule,
      @HiveField(2) RevisePriceStopper lowestStopperType,
      @HiveField(3) int lowestStopperValue,
      @HiveField(4) MakadPaymentMethod paymentMethod});
}

/// @nodoc
class __$$_MakadSettingsCopyWithImpl<$Res>
    extends _$MakadSettingsCopyWithImpl<$Res>
    implements _$$_MakadSettingsCopyWith<$Res> {
  __$$_MakadSettingsCopyWithImpl(
      _$_MakadSettings _value, $Res Function(_$_MakadSettings) _then)
      : super(_value, (v) => _then(v as _$_MakadSettings));

  @override
  _$_MakadSettings get _value => super._value as _$_MakadSettings;

  @override
  $Res call({
    Object? newRule = freezed,
    Object? usedRule = freezed,
    Object? lowestStopperType = freezed,
    Object? lowestStopperValue = freezed,
    Object? paymentMethod = freezed,
  }) {
    return _then(_$_MakadSettings(
      newRule: newRule == freezed
          ? _value.newRule
          : newRule // ignore: cast_nullable_to_non_nullable
              as MakadReviseRule,
      usedRule: usedRule == freezed
          ? _value.usedRule
          : usedRule // ignore: cast_nullable_to_non_nullable
              as MakadReviseRule,
      lowestStopperType: lowestStopperType == freezed
          ? _value.lowestStopperType
          : lowestStopperType // ignore: cast_nullable_to_non_nullable
              as RevisePriceStopper,
      lowestStopperValue: lowestStopperValue == freezed
          ? _value.lowestStopperValue
          : lowestStopperValue // ignore: cast_nullable_to_non_nullable
              as int,
      paymentMethod: paymentMethod == freezed
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as MakadPaymentMethod,
    ));
  }
}

/// @nodoc

@HiveType(typeId: makadSettingsTypeId)
class _$_MakadSettings implements _MakadSettings {
  const _$_MakadSettings(
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MakadSettings &&
            const DeepCollectionEquality().equals(other.newRule, newRule) &&
            const DeepCollectionEquality().equals(other.usedRule, usedRule) &&
            const DeepCollectionEquality()
                .equals(other.lowestStopperType, lowestStopperType) &&
            const DeepCollectionEquality()
                .equals(other.lowestStopperValue, lowestStopperValue) &&
            const DeepCollectionEquality()
                .equals(other.paymentMethod, paymentMethod));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(newRule),
      const DeepCollectionEquality().hash(usedRule),
      const DeepCollectionEquality().hash(lowestStopperType),
      const DeepCollectionEquality().hash(lowestStopperValue),
      const DeepCollectionEquality().hash(paymentMethod));

  @JsonKey(ignore: true)
  @override
  _$$_MakadSettingsCopyWith<_$_MakadSettings> get copyWith =>
      __$$_MakadSettingsCopyWithImpl<_$_MakadSettings>(this, _$identity);
}

abstract class _MakadSettings implements MakadSettings {
  const factory _MakadSettings(
      {@HiveField(0) final MakadReviseRule newRule,
      @HiveField(1) final MakadReviseRule usedRule,
      @HiveField(2) final RevisePriceStopper lowestStopperType,
      @HiveField(3) final int lowestStopperValue,
      @HiveField(4) final MakadPaymentMethod paymentMethod}) = _$_MakadSettings;

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
  @override
  @JsonKey(ignore: true)
  _$$_MakadSettingsCopyWith<_$_MakadSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
