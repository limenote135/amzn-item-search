// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'geo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$GeoResponseTearOff {
  const _$GeoResponseTearOff();

// ignore: unused_element
  _GeoResponse call({@required String code, String jan = ""}) {
    return _GeoResponse(
      code: code,
      jan: jan,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $GeoResponse = _$GeoResponseTearOff();

/// @nodoc
mixin _$GeoResponse {
  String get code;
  String get jan;

  @JsonKey(ignore: true)
  $GeoResponseCopyWith<GeoResponse> get copyWith;
}

/// @nodoc
abstract class $GeoResponseCopyWith<$Res> {
  factory $GeoResponseCopyWith(
          GeoResponse value, $Res Function(GeoResponse) then) =
      _$GeoResponseCopyWithImpl<$Res>;
  $Res call({String code, String jan});
}

/// @nodoc
class _$GeoResponseCopyWithImpl<$Res> implements $GeoResponseCopyWith<$Res> {
  _$GeoResponseCopyWithImpl(this._value, this._then);

  final GeoResponse _value;
  // ignore: unused_field
  final $Res Function(GeoResponse) _then;

  @override
  $Res call({
    Object code = freezed,
    Object jan = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed ? _value.code : code as String,
      jan: jan == freezed ? _value.jan : jan as String,
    ));
  }
}

/// @nodoc
abstract class _$GeoResponseCopyWith<$Res>
    implements $GeoResponseCopyWith<$Res> {
  factory _$GeoResponseCopyWith(
          _GeoResponse value, $Res Function(_GeoResponse) then) =
      __$GeoResponseCopyWithImpl<$Res>;
  @override
  $Res call({String code, String jan});
}

/// @nodoc
class __$GeoResponseCopyWithImpl<$Res> extends _$GeoResponseCopyWithImpl<$Res>
    implements _$GeoResponseCopyWith<$Res> {
  __$GeoResponseCopyWithImpl(
      _GeoResponse _value, $Res Function(_GeoResponse) _then)
      : super(_value, (v) => _then(v as _GeoResponse));

  @override
  _GeoResponse get _value => super._value as _GeoResponse;

  @override
  $Res call({
    Object code = freezed,
    Object jan = freezed,
  }) {
    return _then(_GeoResponse(
      code: code == freezed ? _value.code : code as String,
      jan: jan == freezed ? _value.jan : jan as String,
    ));
  }
}

/// @nodoc
class _$_GeoResponse implements _GeoResponse {
  const _$_GeoResponse({@required this.code, this.jan = ""})
      : assert(code != null),
        assert(jan != null);

  @override
  final String code;
  @JsonKey(defaultValue: "")
  @override
  final String jan;

  @override
  String toString() {
    return 'GeoResponse(code: $code, jan: $jan)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GeoResponse &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.jan, jan) ||
                const DeepCollectionEquality().equals(other.jan, jan)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(jan);

  @JsonKey(ignore: true)
  @override
  _$GeoResponseCopyWith<_GeoResponse> get copyWith =>
      __$GeoResponseCopyWithImpl<_GeoResponse>(this, _$identity);
}

abstract class _GeoResponse implements GeoResponse {
  const factory _GeoResponse({@required String code, String jan}) =
      _$_GeoResponse;

  @override
  String get code;
  @override
  String get jan;
  @override
  @JsonKey(ignore: true)
  _$GeoResponseCopyWith<_GeoResponse> get copyWith;
}
