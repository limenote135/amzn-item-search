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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      @HiveField(4, defaultValue: 0) int fbaLowPriceFee});

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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referralFeeRate = null,
    Object? variableClosingFee = null,
    Object? fbaFee = null,
    Object? feeExp = freezed,
    Object? fbaLowPriceFee = null,
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
    ) as $Val);
  }

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
      @HiveField(4, defaultValue: 0) int fbaLowPriceFee});

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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referralFeeRate = null,
    Object? variableClosingFee = null,
    Object? fbaFee = null,
    Object? feeExp = freezed,
    Object? fbaLowPriceFee = null,
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
      @HiveField(4, defaultValue: 0) this.fbaLowPriceFee = 0});

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
  String toString() {
    return 'FeeInfo(referralFeeRate: $referralFeeRate, variableClosingFee: $variableClosingFee, fbaFee: $fbaFee, feeExp: $feeExp, fbaLowPriceFee: $fbaLowPriceFee)';
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
                other.fbaLowPriceFee == fbaLowPriceFee));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, referralFeeRate,
      variableClosingFee, fbaFee, feeExp, fbaLowPriceFee);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeeInfoImplCopyWith<_$FeeInfoImpl> get copyWith =>
      __$$FeeInfoImplCopyWithImpl<_$FeeInfoImpl>(this, _$identity);

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
      @HiveField(4, defaultValue: 0) final int fbaLowPriceFee}) = _$FeeInfoImpl;

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
  @JsonKey(ignore: true)
  _$$FeeInfoImplCopyWith<_$FeeInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
