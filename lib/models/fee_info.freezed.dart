// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'fee_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
FeeInfo _$FeeInfoFromJson(Map<String, dynamic> json) {
  return _FeeInfo.fromJson(json);
}

/// @nodoc
class _$FeeInfoTearOff {
  const _$FeeInfoTearOff();

// ignore: unused_element
  _FeeInfo call(
      {@required
      @HiveField(0)
      @JsonKey(name: "fee_rate")
          double referralFeeRate,
      @required
      @HiveField(1)
      @JsonKey(name: "closing_fee")
          int variableClosingFee,
      @required
      @HiveField(2)
          int fbaFee}) {
    return _FeeInfo(
      referralFeeRate: referralFeeRate,
      variableClosingFee: variableClosingFee,
      fbaFee: fbaFee,
    );
  }

// ignore: unused_element
  FeeInfo fromJson(Map<String, Object> json) {
    return FeeInfo.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $FeeInfo = _$FeeInfoTearOff();

/// @nodoc
mixin _$FeeInfo {
  @HiveField(0)
  @JsonKey(name: "fee_rate")
  double get referralFeeRate;
  @HiveField(1)
  @JsonKey(name: "closing_fee")
  int get variableClosingFee;
  @HiveField(2)
  int get fbaFee;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $FeeInfoCopyWith<FeeInfo> get copyWith;
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
    Object referralFeeRate = freezed,
    Object variableClosingFee = freezed,
    Object fbaFee = freezed,
  }) {
    return _then(_value.copyWith(
      referralFeeRate: referralFeeRate == freezed
          ? _value.referralFeeRate
          : referralFeeRate as double,
      variableClosingFee: variableClosingFee == freezed
          ? _value.variableClosingFee
          : variableClosingFee as int,
      fbaFee: fbaFee == freezed ? _value.fbaFee : fbaFee as int,
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
    Object referralFeeRate = freezed,
    Object variableClosingFee = freezed,
    Object fbaFee = freezed,
  }) {
    return _then(_FeeInfo(
      referralFeeRate: referralFeeRate == freezed
          ? _value.referralFeeRate
          : referralFeeRate as double,
      variableClosingFee: variableClosingFee == freezed
          ? _value.variableClosingFee
          : variableClosingFee as int,
      fbaFee: fbaFee == freezed ? _value.fbaFee : fbaFee as int,
    ));
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
@HiveType(typeId: feeInfoTypeId)

/// @nodoc
class _$_FeeInfo implements _FeeInfo {
  const _$_FeeInfo(
      {@required
      @HiveField(0)
      @JsonKey(name: "fee_rate")
          this.referralFeeRate,
      @required
      @HiveField(1)
      @JsonKey(name: "closing_fee")
          this.variableClosingFee,
      @required
      @HiveField(2)
          this.fbaFee})
      : assert(referralFeeRate != null),
        assert(variableClosingFee != null),
        assert(fbaFee != null);

  factory _$_FeeInfo.fromJson(Map<String, dynamic> json) =>
      _$_$_FeeInfoFromJson(json);

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
        (other is _FeeInfo &&
            (identical(other.referralFeeRate, referralFeeRate) ||
                const DeepCollectionEquality()
                    .equals(other.referralFeeRate, referralFeeRate)) &&
            (identical(other.variableClosingFee, variableClosingFee) ||
                const DeepCollectionEquality()
                    .equals(other.variableClosingFee, variableClosingFee)) &&
            (identical(other.fbaFee, fbaFee) ||
                const DeepCollectionEquality().equals(other.fbaFee, fbaFee)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(referralFeeRate) ^
      const DeepCollectionEquality().hash(variableClosingFee) ^
      const DeepCollectionEquality().hash(fbaFee);

  @JsonKey(ignore: true)
  @override
  _$FeeInfoCopyWith<_FeeInfo> get copyWith =>
      __$FeeInfoCopyWithImpl<_FeeInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FeeInfoToJson(this);
  }
}

abstract class _FeeInfo implements FeeInfo {
  const factory _FeeInfo(
      {@required
      @HiveField(0)
      @JsonKey(name: "fee_rate")
          double referralFeeRate,
      @required
      @HiveField(1)
      @JsonKey(name: "closing_fee")
          int variableClosingFee,
      @required
      @HiveField(2)
          int fbaFee}) = _$_FeeInfo;

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
  _$FeeInfoCopyWith<_FeeInfo> get copyWith;
}
