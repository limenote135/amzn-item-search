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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      @HiveField(2) int fbaFee});
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FeeInfoCopyWith<$Res> implements $FeeInfoCopyWith<$Res> {
  factory _$$_FeeInfoCopyWith(
          _$_FeeInfo value, $Res Function(_$_FeeInfo) then) =
      __$$_FeeInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: "fee_rate") double referralFeeRate,
      @HiveField(1) @JsonKey(name: "closing_fee") int variableClosingFee,
      @HiveField(2) int fbaFee});
}

/// @nodoc
class __$$_FeeInfoCopyWithImpl<$Res>
    extends _$FeeInfoCopyWithImpl<$Res, _$_FeeInfo>
    implements _$$_FeeInfoCopyWith<$Res> {
  __$$_FeeInfoCopyWithImpl(_$_FeeInfo _value, $Res Function(_$_FeeInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referralFeeRate = null,
    Object? variableClosingFee = null,
    Object? fbaFee = null,
  }) {
    return _then(_$_FeeInfo(
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
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
@HiveType(typeId: feeInfoTypeId)
class _$_FeeInfo implements _FeeInfo {
  const _$_FeeInfo(
      {@HiveField(0) @JsonKey(name: "fee_rate") this.referralFeeRate = 0,
      @HiveField(1) @JsonKey(name: "closing_fee") this.variableClosingFee = 0,
      @HiveField(2) this.fbaFee = -1});

  factory _$_FeeInfo.fromJson(Map<String, dynamic> json) =>
      _$$_FeeInfoFromJson(json);

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
  String toString() {
    return 'FeeInfo(referralFeeRate: $referralFeeRate, variableClosingFee: $variableClosingFee, fbaFee: $fbaFee)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FeeInfo &&
            (identical(other.referralFeeRate, referralFeeRate) ||
                other.referralFeeRate == referralFeeRate) &&
            (identical(other.variableClosingFee, variableClosingFee) ||
                other.variableClosingFee == variableClosingFee) &&
            (identical(other.fbaFee, fbaFee) || other.fbaFee == fbaFee));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, referralFeeRate, variableClosingFee, fbaFee);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FeeInfoCopyWith<_$_FeeInfo> get copyWith =>
      __$$_FeeInfoCopyWithImpl<_$_FeeInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FeeInfoToJson(
      this,
    );
  }
}

abstract class _FeeInfo implements FeeInfo {
  const factory _FeeInfo(
      {@HiveField(0) @JsonKey(name: "fee_rate") final double referralFeeRate,
      @HiveField(1) @JsonKey(name: "closing_fee") final int variableClosingFee,
      @HiveField(2) final int fbaFee}) = _$_FeeInfo;

  factory _FeeInfo.fromJson(Map<String, dynamic> json) = _$_FeeInfo.fromJson;

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
  @JsonKey(ignore: true)
  _$$_FeeInfoCopyWith<_$_FeeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
