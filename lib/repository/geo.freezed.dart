// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'geo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GeoResponse _$GeoResponseFromJson(Map<String, dynamic> json) {
  return _GeoResponse.fromJson(json);
}

/// @nodoc
mixin _$GeoResponse {
  String get code => throw _privateConstructorUsedError;
  String get jan => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeoResponseCopyWith<GeoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoResponseCopyWith<$Res> {
  factory $GeoResponseCopyWith(
          GeoResponse value, $Res Function(GeoResponse) then) =
      _$GeoResponseCopyWithImpl<$Res, GeoResponse>;
  @useResult
  $Res call({String code, String jan});
}

/// @nodoc
class _$GeoResponseCopyWithImpl<$Res, $Val extends GeoResponse>
    implements $GeoResponseCopyWith<$Res> {
  _$GeoResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? jan = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      jan: null == jan
          ? _value.jan
          : jan // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GeoResponseCopyWith<$Res>
    implements $GeoResponseCopyWith<$Res> {
  factory _$$_GeoResponseCopyWith(
          _$_GeoResponse value, $Res Function(_$_GeoResponse) then) =
      __$$_GeoResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String jan});
}

/// @nodoc
class __$$_GeoResponseCopyWithImpl<$Res>
    extends _$GeoResponseCopyWithImpl<$Res, _$_GeoResponse>
    implements _$$_GeoResponseCopyWith<$Res> {
  __$$_GeoResponseCopyWithImpl(
      _$_GeoResponse _value, $Res Function(_$_GeoResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? jan = null,
  }) {
    return _then(_$_GeoResponse(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      jan: null == jan
          ? _value.jan
          : jan // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GeoResponse implements _GeoResponse {
  const _$_GeoResponse({required this.code, this.jan = ""});

  factory _$_GeoResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GeoResponseFromJson(json);

  @override
  final String code;
  @override
  @JsonKey()
  final String jan;

  @override
  String toString() {
    return 'GeoResponse(code: $code, jan: $jan)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GeoResponse &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.jan, jan) || other.jan == jan));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, jan);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GeoResponseCopyWith<_$_GeoResponse> get copyWith =>
      __$$_GeoResponseCopyWithImpl<_$_GeoResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GeoResponseToJson(
      this,
    );
  }
}

abstract class _GeoResponse implements GeoResponse {
  const factory _GeoResponse({required final String code, final String jan}) =
      _$_GeoResponse;

  factory _GeoResponse.fromJson(Map<String, dynamic> json) =
      _$_GeoResponse.fromJson;

  @override
  String get code;
  @override
  String get jan;
  @override
  @JsonKey(ignore: true)
  _$$_GeoResponseCopyWith<_$_GeoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
