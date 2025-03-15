// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fee_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FeeInfo _$FeeInfoFromJson(Map<String, dynamic> json) {
  return _FeeInfo.fromJson(json);
}

/// @nodoc
mixin _$FeeInfo {
  @HiveField(0)
  @JsonKey(name: "fee_rate")
  double get referralFeeRate => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: "closing_fee")
  int get variableClosingFee => throw _privateConstructorUsedError;
  @HiveField(2)
  int get fbaFee => throw _privateConstructorUsedError;
  @HiveField(3)
  FeeExpression? get feeExp => throw _privateConstructorUsedError;
  @HiveField(4, defaultValue: 0)
  int get fbaLowPriceFee => throw _privateConstructorUsedError;
  @HiveField(5, defaultValue: 0)
  double get referralFeeLowPriceRate => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @HiveField(0) @JsonKey(name: "fee_rate") double referralFeeRate,
            @HiveField(1) @JsonKey(name: "closing_fee") int variableClosingFee,
            @HiveField(2) int fbaFee,
            @HiveField(3) FeeExpression? feeExp,
            @HiveField(4, defaultValue: 0) int fbaLowPriceFee,
            @HiveField(5, defaultValue: 0) double referralFeeLowPriceRate)
        $default,
  ) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @HiveField(0) @JsonKey(name: "fee_rate") double referralFeeRate,
            @HiveField(1) @JsonKey(name: "closing_fee") int variableClosingFee,
            @HiveField(2) int fbaFee,
            @HiveField(3) FeeExpression? feeExp,
            @HiveField(4, defaultValue: 0) int fbaLowPriceFee,
            @HiveField(5, defaultValue: 0) double referralFeeLowPriceRate)?
        $default, {
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this FeeInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeeInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeeInfoCopyWith<FeeInfo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeeInfoCopyWith<$Res> {
  factory $FeeInfoCopyWith(FeeInfo value, $Res Function(FeeInfo) then) =
      _$FeeInfoCopyWithImpl<$Res, FeeInfo>;
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: "fee_rate") double referralFeeRate,
      @HiveField(1) @JsonKey(name: "closing_fee") int variableClosingFee,
      @HiveField(2) int fbaFee,
      @HiveField(3) FeeExpression? feeExp,
      @HiveField(4, defaultValue: 0) int fbaLowPriceFee,
      @HiveField(5, defaultValue: 0) double referralFeeLowPriceRate});

  $FeeExpressionCopyWith<$Res>? get feeExp;
}

/// @nodoc
class _$FeeInfoCopyWithImpl<$Res, $Val extends FeeInfo>
    implements $FeeInfoCopyWith<$Res> {
  _$FeeInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeeInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referralFeeRate = null,
    Object? variableClosingFee = null,
    Object? fbaFee = null,
    Object? feeExp = freezed,
    Object? fbaLowPriceFee = null,
    Object? referralFeeLowPriceRate = null,
  }) {
    return _then(_value.copyWith(
      referralFeeRate: null == referralFeeRate
          ? _value.referralFeeRate
          : referralFeeRate // ignore: cast_nullable_to_non_nullable
              as double,
      variableClosingFee: null == variableClosingFee
          ? _value.variableClosingFee
          : variableClosingFee // ignore: cast_nullable_to_non_nullable
              as int,
      fbaFee: null == fbaFee
          ? _value.fbaFee
          : fbaFee // ignore: cast_nullable_to_non_nullable
              as int,
      feeExp: freezed == feeExp
          ? _value.feeExp
          : feeExp // ignore: cast_nullable_to_non_nullable
              as FeeExpression?,
      fbaLowPriceFee: null == fbaLowPriceFee
          ? _value.fbaLowPriceFee
          : fbaLowPriceFee // ignore: cast_nullable_to_non_nullable
              as int,
      referralFeeLowPriceRate: null == referralFeeLowPriceRate
          ? _value.referralFeeLowPriceRate
          : referralFeeLowPriceRate // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  /// Create a copy of FeeInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FeeExpressionCopyWith<$Res>? get feeExp {
    if (_value.feeExp == null) {
      return null;
    }

    return $FeeExpressionCopyWith<$Res>(_value.feeExp!, (value) {
      return _then(_value.copyWith(feeExp: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FeeInfoImplCopyWith<$Res> implements $FeeInfoCopyWith<$Res> {
  factory _$$FeeInfoImplCopyWith(
          _$FeeInfoImpl value, $Res Function(_$FeeInfoImpl) then) =
      __$$FeeInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: "fee_rate") double referralFeeRate,
      @HiveField(1) @JsonKey(name: "closing_fee") int variableClosingFee,
      @HiveField(2) int fbaFee,
      @HiveField(3) FeeExpression? feeExp,
      @HiveField(4, defaultValue: 0) int fbaLowPriceFee,
      @HiveField(5, defaultValue: 0) double referralFeeLowPriceRate});

  @override
  $FeeExpressionCopyWith<$Res>? get feeExp;
}

/// @nodoc
class __$$FeeInfoImplCopyWithImpl<$Res>
    extends _$FeeInfoCopyWithImpl<$Res, _$FeeInfoImpl>
    implements _$$FeeInfoImplCopyWith<$Res> {
  __$$FeeInfoImplCopyWithImpl(
      _$FeeInfoImpl _value, $Res Function(_$FeeInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of FeeInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referralFeeRate = null,
    Object? variableClosingFee = null,
    Object? fbaFee = null,
    Object? feeExp = freezed,
    Object? fbaLowPriceFee = null,
    Object? referralFeeLowPriceRate = null,
  }) {
    return _then(_$FeeInfoImpl(
      referralFeeRate: null == referralFeeRate
          ? _value.referralFeeRate
          : referralFeeRate // ignore: cast_nullable_to_non_nullable
              as double,
      variableClosingFee: null == variableClosingFee
          ? _value.variableClosingFee
          : variableClosingFee // ignore: cast_nullable_to_non_nullable
              as int,
      fbaFee: null == fbaFee
          ? _value.fbaFee
          : fbaFee // ignore: cast_nullable_to_non_nullable
              as int,
      feeExp: freezed == feeExp
          ? _value.feeExp
          : feeExp // ignore: cast_nullable_to_non_nullable
              as FeeExpression?,
      fbaLowPriceFee: null == fbaLowPriceFee
          ? _value.fbaLowPriceFee
          : fbaLowPriceFee // ignore: cast_nullable_to_non_nullable
              as int,
      referralFeeLowPriceRate: null == referralFeeLowPriceRate
          ? _value.referralFeeLowPriceRate
          : referralFeeLowPriceRate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
@HiveType(typeId: feeInfoTypeId)
class _$FeeInfoImpl implements _FeeInfo {
  const _$FeeInfoImpl(
      {@HiveField(0) @JsonKey(name: "fee_rate") this.referralFeeRate = 0,
      @HiveField(1) @JsonKey(name: "closing_fee") this.variableClosingFee = 0,
      @HiveField(2) this.fbaFee = -1,
      @HiveField(3) this.feeExp,
      @HiveField(4, defaultValue: 0) this.fbaLowPriceFee = 0,
      @HiveField(5, defaultValue: 0) this.referralFeeLowPriceRate = 0});

  factory _$FeeInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeeInfoImplFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: "fee_rate")
  final double referralFeeRate;
  @override
  @HiveField(1)
  @JsonKey(name: "closing_fee")
  final int variableClosingFee;
  @override
  @JsonKey()
  @HiveField(2)
  final int fbaFee;
  @override
  @HiveField(3)
  final FeeExpression? feeExp;
  @override
  @JsonKey()
  @HiveField(4, defaultValue: 0)
  final int fbaLowPriceFee;
  @override
  @JsonKey()
  @HiveField(5, defaultValue: 0)
  final double referralFeeLowPriceRate;

  @override
  String toString() {
    return 'FeeInfo(referralFeeRate: $referralFeeRate, variableClosingFee: $variableClosingFee, fbaFee: $fbaFee, feeExp: $feeExp, fbaLowPriceFee: $fbaLowPriceFee, referralFeeLowPriceRate: $referralFeeLowPriceRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeeInfoImpl &&
            (identical(other.referralFeeRate, referralFeeRate) ||
                other.referralFeeRate == referralFeeRate) &&
            (identical(other.variableClosingFee, variableClosingFee) ||
                other.variableClosingFee == variableClosingFee) &&
            (identical(other.fbaFee, fbaFee) || other.fbaFee == fbaFee) &&
            (identical(other.feeExp, feeExp) || other.feeExp == feeExp) &&
            (identical(other.fbaLowPriceFee, fbaLowPriceFee) ||
                other.fbaLowPriceFee == fbaLowPriceFee) &&
            (identical(
                    other.referralFeeLowPriceRate, referralFeeLowPriceRate) ||
                other.referralFeeLowPriceRate == referralFeeLowPriceRate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      referralFeeRate,
      variableClosingFee,
      fbaFee,
      feeExp,
      fbaLowPriceFee,
      referralFeeLowPriceRate);

  /// Create a copy of FeeInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeeInfoImplCopyWith<_$FeeInfoImpl> get copyWith =>
      __$$FeeInfoImplCopyWithImpl<_$FeeInfoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @HiveField(0) @JsonKey(name: "fee_rate") double referralFeeRate,
            @HiveField(1) @JsonKey(name: "closing_fee") int variableClosingFee,
            @HiveField(2) int fbaFee,
            @HiveField(3) FeeExpression? feeExp,
            @HiveField(4, defaultValue: 0) int fbaLowPriceFee,
            @HiveField(5, defaultValue: 0) double referralFeeLowPriceRate)
        $default,
  ) {
    return $default(referralFeeRate, variableClosingFee, fbaFee, feeExp,
        fbaLowPriceFee, referralFeeLowPriceRate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @HiveField(0) @JsonKey(name: "fee_rate") double referralFeeRate,
            @HiveField(1) @JsonKey(name: "closing_fee") int variableClosingFee,
            @HiveField(2) int fbaFee,
            @HiveField(3) FeeExpression? feeExp,
            @HiveField(4, defaultValue: 0) int fbaLowPriceFee,
            @HiveField(5, defaultValue: 0) double referralFeeLowPriceRate)?
        $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(referralFeeRate, variableClosingFee, fbaFee, feeExp,
          fbaLowPriceFee, referralFeeLowPriceRate);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FeeInfoImplToJson(
      this,
    );
  }
}

abstract class _FeeInfo implements FeeInfo {
  const factory _FeeInfo(
      {@HiveField(0) @JsonKey(name: "fee_rate") final double referralFeeRate,
      @HiveField(1) @JsonKey(name: "closing_fee") final int variableClosingFee,
      @HiveField(2) final int fbaFee,
      @HiveField(3) final FeeExpression? feeExp,
      @HiveField(4, defaultValue: 0) final int fbaLowPriceFee,
      @HiveField(5, defaultValue: 0)
      final double referralFeeLowPriceRate}) = _$FeeInfoImpl;

  factory _FeeInfo.fromJson(Map<String, dynamic> json) = _$FeeInfoImpl.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: "fee_rate")
  double get referralFeeRate;
  @override
  @HiveField(1)
  @JsonKey(name: "closing_fee")
  int get variableClosingFee;
  @override
  @HiveField(2)
  int get fbaFee;
  @override
  @HiveField(3)
  FeeExpression? get feeExp;
  @override
  @HiveField(4, defaultValue: 0)
  int get fbaLowPriceFee;
  @override
  @HiveField(5, defaultValue: 0)
  double get referralFeeLowPriceRate;

  /// Create a copy of FeeInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeeInfoImplCopyWith<_$FeeInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
