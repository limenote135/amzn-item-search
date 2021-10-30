// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fee_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FeeInfo _$FeeInfoFromJson(Map<String, dynamic> json) {
  return _FeeInfo.fromJson(json);
}

/// @nodoc
class _$FeeInfoTearOff {
  const _$FeeInfoTearOff();

  _FeeInfo call(
      {@HiveField(0)
      @JsonKey(name: "fee_rate")
          required double referralFeeRate,
      @HiveField(1)
      @JsonKey(name: "closing_fee")
          required int variableClosingFee,
      @HiveField(2)
          required int fbaFee}) {
    return _FeeInfo(
      referralFeeRate: referralFeeRate,
      variableClosingFee: variableClosingFee,
      fbaFee: fbaFee,
    );
  }

  FeeInfo fromJson(Map<String, Object?> json) {
    return FeeInfo.fromJson(json);
  }
}

/// @nodoc
const $FeeInfo = _$FeeInfoTearOff();

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
      _$FeeInfoCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) @JsonKey(name: "fee_rate") double referralFeeRate,
      @HiveField(1) @JsonKey(name: "closing_fee") int variableClosingFee,
      @HiveField(2) int fbaFee});
}

/// @nodoc
class _$FeeInfoCopyWithImpl<$Res> implements $FeeInfoCopyWith<$Res> {
  _$FeeInfoCopyWithImpl(this._value, this._then);

  final FeeInfo _value;
  // ignore: unused_field
  final $Res Function(FeeInfo) _then;

  @override
  $Res call({
    Object? referralFeeRate = freezed,
    Object? variableClosingFee = freezed,
    Object? fbaFee = freezed,
  }) {
    return _then(_value.copyWith(
      referralFeeRate: referralFeeRate == freezed
          ? _value.referralFeeRate
          : referralFeeRate // ignore: cast_nullable_to_non_nullable
              as double,
      variableClosingFee: variableClosingFee == freezed
          ? _value.variableClosingFee
          : variableClosingFee // ignore: cast_nullable_to_non_nullable
              as int,
      fbaFee: fbaFee == freezed
          ? _value.fbaFee
          : fbaFee // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$FeeInfoCopyWith<$Res> implements $FeeInfoCopyWith<$Res> {
  factory _$FeeInfoCopyWith(_FeeInfo value, $Res Function(_FeeInfo) then) =
      __$FeeInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) @JsonKey(name: "fee_rate") double referralFeeRate,
      @HiveField(1) @JsonKey(name: "closing_fee") int variableClosingFee,
      @HiveField(2) int fbaFee});
}

/// @nodoc
class __$FeeInfoCopyWithImpl<$Res> extends _$FeeInfoCopyWithImpl<$Res>
    implements _$FeeInfoCopyWith<$Res> {
  __$FeeInfoCopyWithImpl(_FeeInfo _value, $Res Function(_FeeInfo) _then)
      : super(_value, (v) => _then(v as _FeeInfo));

  @override
  _FeeInfo get _value => super._value as _FeeInfo;

  @override
  $Res call({
    Object? referralFeeRate = freezed,
    Object? variableClosingFee = freezed,
    Object? fbaFee = freezed,
  }) {
    return _then(_FeeInfo(
      referralFeeRate: referralFeeRate == freezed
          ? _value.referralFeeRate
          : referralFeeRate // ignore: cast_nullable_to_non_nullable
              as double,
      variableClosingFee: variableClosingFee == freezed
          ? _value.variableClosingFee
          : variableClosingFee // ignore: cast_nullable_to_non_nullable
              as int,
      fbaFee: fbaFee == freezed
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
      {@HiveField(0)
      @JsonKey(name: "fee_rate")
          required this.referralFeeRate,
      @HiveField(1)
      @JsonKey(name: "closing_fee")
          required this.variableClosingFee,
      @HiveField(2)
          required this.fbaFee});

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
            other is _FeeInfo &&
            (identical(other.referralFeeRate, referralFeeRate) ||
                other.referralFeeRate == referralFeeRate) &&
            (identical(other.variableClosingFee, variableClosingFee) ||
                other.variableClosingFee == variableClosingFee) &&
            (identical(other.fbaFee, fbaFee) || other.fbaFee == fbaFee));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, referralFeeRate, variableClosingFee, fbaFee);

  @JsonKey(ignore: true)
  @override
  _$FeeInfoCopyWith<_FeeInfo> get copyWith =>
      __$FeeInfoCopyWithImpl<_FeeInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FeeInfoToJson(this);
  }
}

abstract class _FeeInfo implements FeeInfo {
  const factory _FeeInfo(
      {@HiveField(0)
      @JsonKey(name: "fee_rate")
          required double referralFeeRate,
      @HiveField(1)
      @JsonKey(name: "closing_fee")
          required int variableClosingFee,
      @HiveField(2)
          required int fbaFee}) = _$_FeeInfo;

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
  _$FeeInfoCopyWith<_FeeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
