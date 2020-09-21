// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'fee_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$FeeInfoTearOff {
  const _$FeeInfoTearOff();

// ignore: unused_element
  _FeeInfo call(
      {@required double referralFeeRate,
      @required int variableClosingFee,
      @required int fbaFee}) {
    return _FeeInfo(
      referralFeeRate: referralFeeRate,
      variableClosingFee: variableClosingFee,
      fbaFee: fbaFee,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $FeeInfo = _$FeeInfoTearOff();

/// @nodoc
mixin _$FeeInfo {
  double get referralFeeRate;
  int get variableClosingFee;
  int get fbaFee;

  $FeeInfoCopyWith<FeeInfo> get copyWith;
}

/// @nodoc
abstract class $FeeInfoCopyWith<$Res> {
  factory $FeeInfoCopyWith(FeeInfo value, $Res Function(FeeInfo) then) =
      _$FeeInfoCopyWithImpl<$Res>;
  $Res call({double referralFeeRate, int variableClosingFee, int fbaFee});
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
  $Res call({double referralFeeRate, int variableClosingFee, int fbaFee});
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

/// @nodoc
class _$_FeeInfo implements _FeeInfo {
  const _$_FeeInfo(
      {@required this.referralFeeRate,
      @required this.variableClosingFee,
      @required this.fbaFee})
      : assert(referralFeeRate != null),
        assert(variableClosingFee != null),
        assert(fbaFee != null);

  @override
  final double referralFeeRate;
  @override
  final int variableClosingFee;
  @override
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

  @override
  _$FeeInfoCopyWith<_FeeInfo> get copyWith =>
      __$FeeInfoCopyWithImpl<_FeeInfo>(this, _$identity);
}

abstract class _FeeInfo implements FeeInfo {
  const factory _FeeInfo(
      {@required double referralFeeRate,
      @required int variableClosingFee,
      @required int fbaFee}) = _$_FeeInfo;

  @override
  double get referralFeeRate;
  @override
  int get variableClosingFee;
  @override
  int get fbaFee;
  @override
  _$FeeInfoCopyWith<_FeeInfo> get copyWith;
}
