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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: "INSTORECODE") String instoreCode,
            @JsonKey(name: "GOODS_NAME1") String title,
            @JsonKey(name: "GOODS_NAME2") String? subtitle,
            @JsonKey(name: "JAN") String jan)
        $default,
  ) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: "INSTORECODE") String instoreCode,
            @JsonKey(name: "GOODS_NAME1") String title,
            @JsonKey(name: "GOODS_NAME2") String? subtitle,
            @JsonKey(name: "JAN") String jan)?
        $default, {
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this BookoffResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BookoffResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of BookoffResponse
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$BookoffResponseImplCopyWith<$Res>
    implements $BookoffResponseCopyWith<$Res> {
  factory _$$BookoffResponseImplCopyWith(_$BookoffResponseImpl value,
          $Res Function(_$BookoffResponseImpl) then) =
      __$$BookoffResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "INSTORECODE") String instoreCode,
      @JsonKey(name: "GOODS_NAME1") String title,
      @JsonKey(name: "GOODS_NAME2") String? subtitle,
      @JsonKey(name: "JAN") String jan});
}

/// @nodoc
class __$$BookoffResponseImplCopyWithImpl<$Res>
    extends _$BookoffResponseCopyWithImpl<$Res, _$BookoffResponseImpl>
    implements _$$BookoffResponseImplCopyWith<$Res> {
  __$$BookoffResponseImplCopyWithImpl(
      _$BookoffResponseImpl _value, $Res Function(_$BookoffResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookoffResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instoreCode = null,
    Object? title = null,
    Object? subtitle = freezed,
    Object? jan = null,
  }) {
    return _then(_$BookoffResponseImpl(
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
class _$BookoffResponseImpl implements _BookoffResponse {
  const _$BookoffResponseImpl(
      {@JsonKey(name: "INSTORECODE") required this.instoreCode,
      @JsonKey(name: "GOODS_NAME1") required this.title,
      @JsonKey(name: "GOODS_NAME2") this.subtitle,
      @JsonKey(name: "JAN") this.jan = ""});

  factory _$BookoffResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookoffResponseImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookoffResponseImpl &&
            (identical(other.instoreCode, instoreCode) ||
                other.instoreCode == instoreCode) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.jan, jan) || other.jan == jan));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, instoreCode, title, subtitle, jan);

  /// Create a copy of BookoffResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookoffResponseImplCopyWith<_$BookoffResponseImpl> get copyWith =>
      __$$BookoffResponseImplCopyWithImpl<_$BookoffResponseImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: "INSTORECODE") String instoreCode,
            @JsonKey(name: "GOODS_NAME1") String title,
            @JsonKey(name: "GOODS_NAME2") String? subtitle,
            @JsonKey(name: "JAN") String jan)
        $default,
  ) {
    return $default(instoreCode, title, subtitle, jan);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: "INSTORECODE") String instoreCode,
            @JsonKey(name: "GOODS_NAME1") String title,
            @JsonKey(name: "GOODS_NAME2") String? subtitle,
            @JsonKey(name: "JAN") String jan)?
        $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(instoreCode, title, subtitle, jan);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$BookoffResponseImplToJson(
      this,
    );
  }
}

abstract class _BookoffResponse implements BookoffResponse {
  const factory _BookoffResponse(
      {@JsonKey(name: "INSTORECODE") required final String instoreCode,
      @JsonKey(name: "GOODS_NAME1") required final String title,
      @JsonKey(name: "GOODS_NAME2") final String? subtitle,
      @JsonKey(name: "JAN") final String jan}) = _$BookoffResponseImpl;

  factory _BookoffResponse.fromJson(Map<String, dynamic> json) =
      _$BookoffResponseImpl.fromJson;

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

  /// Create a copy of BookoffResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookoffResponseImplCopyWith<_$BookoffResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
