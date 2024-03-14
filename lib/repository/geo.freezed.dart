// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$GeoResponseImplCopyWith<$Res>
    implements $GeoResponseCopyWith<$Res> {
  factory _$$GeoResponseImplCopyWith(
          _$GeoResponseImpl value, $Res Function(_$GeoResponseImpl) then) =
      __$$GeoResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String jan});
}

/// @nodoc
class __$$GeoResponseImplCopyWithImpl<$Res>
    extends _$GeoResponseCopyWithImpl<$Res, _$GeoResponseImpl>
    implements _$$GeoResponseImplCopyWith<$Res> {
  __$$GeoResponseImplCopyWithImpl(
      _$GeoResponseImpl _value, $Res Function(_$GeoResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? jan = null,
  }) {
    return _then(_$GeoResponseImpl(
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
class _$GeoResponseImpl implements _GeoResponse {
  const _$GeoResponseImpl({required this.code, this.jan = ""});

  factory _$GeoResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeoResponseImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeoResponseImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.jan, jan) || other.jan == jan));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, jan);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeoResponseImplCopyWith<_$GeoResponseImpl> get copyWith =>
      __$$GeoResponseImplCopyWithImpl<_$GeoResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeoResponseImplToJson(
      this,
    );
  }
}

abstract class _GeoResponse implements GeoResponse {
  const factory _GeoResponse({required final String code, final String jan}) =
      _$GeoResponseImpl;

  factory _GeoResponse.fromJson(Map<String, dynamic> json) =
      _$GeoResponseImpl.fromJson;

  @override
  String get code;
  @override
  String get jan;
  @override
  @JsonKey(ignore: true)
  _$$GeoResponseImplCopyWith<_$GeoResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
