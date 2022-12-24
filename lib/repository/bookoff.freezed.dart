// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookoff.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookoffResponse _$BookoffResponseFromJson(Map<String, dynamic> json) {
  return _BookoffResponse.fromJson(json);
}

/// @nodoc
mixin _$BookoffResponse {
  @JsonKey(name: "INSTORECODE")
  String get instoreCode => throw _privateConstructorUsedError;
  @JsonKey(name: "GOODS_NAME1")
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: "GOODS_NAME2")
  String? get subtitle => throw _privateConstructorUsedError;
  @JsonKey(name: "JAN")
  String get jan => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookoffResponseCopyWith<BookoffResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookoffResponseCopyWith<$Res> {
  factory $BookoffResponseCopyWith(
          BookoffResponse value, $Res Function(BookoffResponse) then) =
      _$BookoffResponseCopyWithImpl<$Res, BookoffResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "INSTORECODE") String instoreCode,
      @JsonKey(name: "GOODS_NAME1") String title,
      @JsonKey(name: "GOODS_NAME2") String? subtitle,
      @JsonKey(name: "JAN") String jan});
}

/// @nodoc
class _$BookoffResponseCopyWithImpl<$Res, $Val extends BookoffResponse>
    implements $BookoffResponseCopyWith<$Res> {
  _$BookoffResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instoreCode = null,
    Object? title = null,
    Object? subtitle = freezed,
    Object? jan = null,
  }) {
    return _then(_value.copyWith(
      instoreCode: null == instoreCode
          ? _value.instoreCode
          : instoreCode // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      jan: null == jan
          ? _value.jan
          : jan // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookoffResponseCopyWith<$Res>
    implements $BookoffResponseCopyWith<$Res> {
  factory _$$_BookoffResponseCopyWith(
          _$_BookoffResponse value, $Res Function(_$_BookoffResponse) then) =
      __$$_BookoffResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "INSTORECODE") String instoreCode,
      @JsonKey(name: "GOODS_NAME1") String title,
      @JsonKey(name: "GOODS_NAME2") String? subtitle,
      @JsonKey(name: "JAN") String jan});
}

/// @nodoc
class __$$_BookoffResponseCopyWithImpl<$Res>
    extends _$BookoffResponseCopyWithImpl<$Res, _$_BookoffResponse>
    implements _$$_BookoffResponseCopyWith<$Res> {
  __$$_BookoffResponseCopyWithImpl(
      _$_BookoffResponse _value, $Res Function(_$_BookoffResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instoreCode = null,
    Object? title = null,
    Object? subtitle = freezed,
    Object? jan = null,
  }) {
    return _then(_$_BookoffResponse(
      instoreCode: null == instoreCode
          ? _value.instoreCode
          : instoreCode // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      jan: null == jan
          ? _value.jan
          : jan // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_BookoffResponse implements _BookoffResponse {
  const _$_BookoffResponse(
      {@JsonKey(name: "INSTORECODE") required this.instoreCode,
      @JsonKey(name: "GOODS_NAME1") required this.title,
      @JsonKey(name: "GOODS_NAME2") this.subtitle,
      @JsonKey(name: "JAN") this.jan = ""});

  factory _$_BookoffResponse.fromJson(Map<String, dynamic> json) =>
      _$$_BookoffResponseFromJson(json);

  @override
  @JsonKey(name: "INSTORECODE")
  final String instoreCode;
  @override
  @JsonKey(name: "GOODS_NAME1")
  final String title;
  @override
  @JsonKey(name: "GOODS_NAME2")
  final String? subtitle;
  @override
  @JsonKey(name: "JAN")
  final String jan;

  @override
  String toString() {
    return 'BookoffResponse(instoreCode: $instoreCode, title: $title, subtitle: $subtitle, jan: $jan)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookoffResponse &&
            (identical(other.instoreCode, instoreCode) ||
                other.instoreCode == instoreCode) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.jan, jan) || other.jan == jan));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, instoreCode, title, subtitle, jan);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookoffResponseCopyWith<_$_BookoffResponse> get copyWith =>
      __$$_BookoffResponseCopyWithImpl<_$_BookoffResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookoffResponseToJson(
      this,
    );
  }
}

abstract class _BookoffResponse implements BookoffResponse {
  const factory _BookoffResponse(
      {@JsonKey(name: "INSTORECODE") required final String instoreCode,
      @JsonKey(name: "GOODS_NAME1") required final String title,
      @JsonKey(name: "GOODS_NAME2") final String? subtitle,
      @JsonKey(name: "JAN") final String jan}) = _$_BookoffResponse;

  factory _BookoffResponse.fromJson(Map<String, dynamic> json) =
      _$_BookoffResponse.fromJson;

  @override
  @JsonKey(name: "INSTORECODE")
  String get instoreCode;
  @override
  @JsonKey(name: "GOODS_NAME1")
  String get title;
  @override
  @JsonKey(name: "GOODS_NAME2")
  String? get subtitle;
  @override
  @JsonKey(name: "JAN")
  String get jan;
  @override
  @JsonKey(ignore: true)
  _$$_BookoffResponseCopyWith<_$_BookoffResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
