// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'bookoff.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookoffResponse _$BookoffResponseFromJson(Map<String, dynamic> json) {
  return _BookoffResponse.fromJson(json);
}

/// @nodoc
class _$BookoffResponseTearOff {
  const _$BookoffResponseTearOff();

  _BookoffResponse call(
      {@JsonKey(name: "INSTORECODE") required String instoreCode,
      @JsonKey(name: "GOODS_NAME1") required String title,
      @JsonKey(name: "GOODS_NAME2") required String subtitle,
      @JsonKey(name: "JAN") required String jan}) {
    return _BookoffResponse(
      instoreCode: instoreCode,
      title: title,
      subtitle: subtitle,
      jan: jan,
    );
  }

  BookoffResponse fromJson(Map<String, Object> json) {
    return BookoffResponse.fromJson(json);
  }
}

/// @nodoc
const $BookoffResponse = _$BookoffResponseTearOff();

/// @nodoc
mixin _$BookoffResponse {
  @JsonKey(name: "INSTORECODE")
  String get instoreCode => throw _privateConstructorUsedError;
  @JsonKey(name: "GOODS_NAME1")
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: "GOODS_NAME2")
  String get subtitle => throw _privateConstructorUsedError;
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
      _$BookoffResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "INSTORECODE") String instoreCode,
      @JsonKey(name: "GOODS_NAME1") String title,
      @JsonKey(name: "GOODS_NAME2") String subtitle,
      @JsonKey(name: "JAN") String jan});
}

/// @nodoc
class _$BookoffResponseCopyWithImpl<$Res>
    implements $BookoffResponseCopyWith<$Res> {
  _$BookoffResponseCopyWithImpl(this._value, this._then);

  final BookoffResponse _value;
  // ignore: unused_field
  final $Res Function(BookoffResponse) _then;

  @override
  $Res call({
    Object? instoreCode = freezed,
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? jan = freezed,
  }) {
    return _then(_value.copyWith(
      instoreCode: instoreCode == freezed
          ? _value.instoreCode
          : instoreCode // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: subtitle == freezed
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      jan: jan == freezed
          ? _value.jan
          : jan // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$BookoffResponseCopyWith<$Res>
    implements $BookoffResponseCopyWith<$Res> {
  factory _$BookoffResponseCopyWith(
          _BookoffResponse value, $Res Function(_BookoffResponse) then) =
      __$BookoffResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "INSTORECODE") String instoreCode,
      @JsonKey(name: "GOODS_NAME1") String title,
      @JsonKey(name: "GOODS_NAME2") String subtitle,
      @JsonKey(name: "JAN") String jan});
}

/// @nodoc
class __$BookoffResponseCopyWithImpl<$Res>
    extends _$BookoffResponseCopyWithImpl<$Res>
    implements _$BookoffResponseCopyWith<$Res> {
  __$BookoffResponseCopyWithImpl(
      _BookoffResponse _value, $Res Function(_BookoffResponse) _then)
      : super(_value, (v) => _then(v as _BookoffResponse));

  @override
  _BookoffResponse get _value => super._value as _BookoffResponse;

  @override
  $Res call({
    Object? instoreCode = freezed,
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? jan = freezed,
  }) {
    return _then(_BookoffResponse(
      instoreCode: instoreCode == freezed
          ? _value.instoreCode
          : instoreCode // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: subtitle == freezed
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      jan: jan == freezed
          ? _value.jan
          : jan // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)

/// @nodoc
class _$_BookoffResponse implements _BookoffResponse {
  const _$_BookoffResponse(
      {@JsonKey(name: "INSTORECODE") required this.instoreCode,
      @JsonKey(name: "GOODS_NAME1") required this.title,
      @JsonKey(name: "GOODS_NAME2") required this.subtitle,
      @JsonKey(name: "JAN") required this.jan});

  factory _$_BookoffResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_BookoffResponseFromJson(json);

  @override
  @JsonKey(name: "INSTORECODE")
  final String instoreCode;
  @override
  @JsonKey(name: "GOODS_NAME1")
  final String title;
  @override
  @JsonKey(name: "GOODS_NAME2")
  final String subtitle;
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
        (other is _BookoffResponse &&
            (identical(other.instoreCode, instoreCode) ||
                const DeepCollectionEquality()
                    .equals(other.instoreCode, instoreCode)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.subtitle, subtitle) ||
                const DeepCollectionEquality()
                    .equals(other.subtitle, subtitle)) &&
            (identical(other.jan, jan) ||
                const DeepCollectionEquality().equals(other.jan, jan)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(instoreCode) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(subtitle) ^
      const DeepCollectionEquality().hash(jan);

  @JsonKey(ignore: true)
  @override
  _$BookoffResponseCopyWith<_BookoffResponse> get copyWith =>
      __$BookoffResponseCopyWithImpl<_BookoffResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BookoffResponseToJson(this);
  }
}

abstract class _BookoffResponse implements BookoffResponse {
  const factory _BookoffResponse(
      {@JsonKey(name: "INSTORECODE") required String instoreCode,
      @JsonKey(name: "GOODS_NAME1") required String title,
      @JsonKey(name: "GOODS_NAME2") required String subtitle,
      @JsonKey(name: "JAN") required String jan}) = _$_BookoffResponse;

  factory _BookoffResponse.fromJson(Map<String, dynamic> json) =
      _$_BookoffResponse.fromJson;

  @override
  @JsonKey(name: "INSTORECODE")
  String get instoreCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "GOODS_NAME1")
  String get title => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "GOODS_NAME2")
  String get subtitle => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "JAN")
  String get jan => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BookoffResponseCopyWith<_BookoffResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
