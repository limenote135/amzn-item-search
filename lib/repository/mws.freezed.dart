// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mws.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetProductByIdResponse _$GetProductByIdResponseFromJson(
    Map<String, dynamic> json) {
  return _GetProductByIdResponse.fromJson(json);
}

/// @nodoc
mixin _$GetProductByIdResponse {
  String get code => throw _privateConstructorUsedError;
  List<AsinData> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetProductByIdResponseCopyWith<GetProductByIdResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetProductByIdResponseCopyWith<$Res> {
  factory $GetProductByIdResponseCopyWith(GetProductByIdResponse value,
          $Res Function(GetProductByIdResponse) then) =
      _$GetProductByIdResponseCopyWithImpl<$Res>;
  $Res call({String code, List<AsinData> items});
}

/// @nodoc
class _$GetProductByIdResponseCopyWithImpl<$Res>
    implements $GetProductByIdResponseCopyWith<$Res> {
  _$GetProductByIdResponseCopyWithImpl(this._value, this._then);

  final GetProductByIdResponse _value;
  // ignore: unused_field
  final $Res Function(GetProductByIdResponse) _then;

  @override
  $Res call({
    Object? code = freezed,
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<AsinData>,
    ));
  }
}

/// @nodoc
abstract class _$$_GetProductByIdResponseCopyWith<$Res>
    implements $GetProductByIdResponseCopyWith<$Res> {
  factory _$$_GetProductByIdResponseCopyWith(_$_GetProductByIdResponse value,
          $Res Function(_$_GetProductByIdResponse) then) =
      __$$_GetProductByIdResponseCopyWithImpl<$Res>;
  @override
  $Res call({String code, List<AsinData> items});
}

/// @nodoc
class __$$_GetProductByIdResponseCopyWithImpl<$Res>
    extends _$GetProductByIdResponseCopyWithImpl<$Res>
    implements _$$_GetProductByIdResponseCopyWith<$Res> {
  __$$_GetProductByIdResponseCopyWithImpl(_$_GetProductByIdResponse _value,
      $Res Function(_$_GetProductByIdResponse) _then)
      : super(_value, (v) => _then(v as _$_GetProductByIdResponse));

  @override
  _$_GetProductByIdResponse get _value =>
      super._value as _$_GetProductByIdResponse;

  @override
  $Res call({
    Object? code = freezed,
    Object? items = freezed,
  }) {
    return _then(_$_GetProductByIdResponse(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      items: items == freezed
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<AsinData>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_GetProductByIdResponse implements _GetProductByIdResponse {
  const _$_GetProductByIdResponse(
      {required this.code, final List<AsinData> items = const <AsinData>[]})
      : _items = items;

  factory _$_GetProductByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GetProductByIdResponseFromJson(json);

  @override
  final String code;
  final List<AsinData> _items;
  @override
  @JsonKey()
  List<AsinData> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'GetProductByIdResponse(code: $code, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetProductByIdResponse &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  _$$_GetProductByIdResponseCopyWith<_$_GetProductByIdResponse> get copyWith =>
      __$$_GetProductByIdResponseCopyWithImpl<_$_GetProductByIdResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetProductByIdResponseToJson(
      this,
    );
  }
}

abstract class _GetProductByIdResponse implements GetProductByIdResponse {
  const factory _GetProductByIdResponse(
      {required final String code,
      final List<AsinData> items}) = _$_GetProductByIdResponse;

  factory _GetProductByIdResponse.fromJson(Map<String, dynamic> json) =
      _$_GetProductByIdResponse.fromJson;

  @override
  String get code;
  @override
  List<AsinData> get items;
  @override
  @JsonKey(ignore: true)
  _$$_GetProductByIdResponseCopyWith<_$_GetProductByIdResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$QueryItemsRequest {
  String get query => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QueryItemsRequestCopyWith<QueryItemsRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueryItemsRequestCopyWith<$Res> {
  factory $QueryItemsRequestCopyWith(
          QueryItemsRequest value, $Res Function(QueryItemsRequest) then) =
      _$QueryItemsRequestCopyWithImpl<$Res>;
  $Res call({String query, String category});
}

/// @nodoc
class _$QueryItemsRequestCopyWithImpl<$Res>
    implements $QueryItemsRequestCopyWith<$Res> {
  _$QueryItemsRequestCopyWithImpl(this._value, this._then);

  final QueryItemsRequest _value;
  // ignore: unused_field
  final $Res Function(QueryItemsRequest) _then;

  @override
  $Res call({
    Object? query = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_QueryItemsRequestCopyWith<$Res>
    implements $QueryItemsRequestCopyWith<$Res> {
  factory _$$_QueryItemsRequestCopyWith(_$_QueryItemsRequest value,
          $Res Function(_$_QueryItemsRequest) then) =
      __$$_QueryItemsRequestCopyWithImpl<$Res>;
  @override
  $Res call({String query, String category});
}

/// @nodoc
class __$$_QueryItemsRequestCopyWithImpl<$Res>
    extends _$QueryItemsRequestCopyWithImpl<$Res>
    implements _$$_QueryItemsRequestCopyWith<$Res> {
  __$$_QueryItemsRequestCopyWithImpl(
      _$_QueryItemsRequest _value, $Res Function(_$_QueryItemsRequest) _then)
      : super(_value, (v) => _then(v as _$_QueryItemsRequest));

  @override
  _$_QueryItemsRequest get _value => super._value as _$_QueryItemsRequest;

  @override
  $Res call({
    Object? query = freezed,
    Object? category = freezed,
  }) {
    return _then(_$_QueryItemsRequest(
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_QueryItemsRequest implements _QueryItemsRequest {
  const _$_QueryItemsRequest({required this.query, required this.category});

  @override
  final String query;
  @override
  final String category;

  @override
  String toString() {
    return 'QueryItemsRequest(query: $query, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QueryItemsRequest &&
            const DeepCollectionEquality().equals(other.query, query) &&
            const DeepCollectionEquality().equals(other.category, category));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(query),
      const DeepCollectionEquality().hash(category));

  @JsonKey(ignore: true)
  @override
  _$$_QueryItemsRequestCopyWith<_$_QueryItemsRequest> get copyWith =>
      __$$_QueryItemsRequestCopyWithImpl<_$_QueryItemsRequest>(
          this, _$identity);
}

abstract class _QueryItemsRequest implements QueryItemsRequest {
  const factory _QueryItemsRequest(
      {required final String query,
      required final String category}) = _$_QueryItemsRequest;

  @override
  String get query;
  @override
  String get category;
  @override
  @JsonKey(ignore: true)
  _$$_QueryItemsRequestCopyWith<_$_QueryItemsRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

QueryItemsResponse _$QueryItemsResponseFromJson(Map<String, dynamic> json) {
  return _QueryItemsResponse.fromJson(json);
}

/// @nodoc
mixin _$QueryItemsResponse {
  List<String> get asins => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QueryItemsResponseCopyWith<QueryItemsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueryItemsResponseCopyWith<$Res> {
  factory $QueryItemsResponseCopyWith(
          QueryItemsResponse value, $Res Function(QueryItemsResponse) then) =
      _$QueryItemsResponseCopyWithImpl<$Res>;
  $Res call({List<String> asins});
}

/// @nodoc
class _$QueryItemsResponseCopyWithImpl<$Res>
    implements $QueryItemsResponseCopyWith<$Res> {
  _$QueryItemsResponseCopyWithImpl(this._value, this._then);

  final QueryItemsResponse _value;
  // ignore: unused_field
  final $Res Function(QueryItemsResponse) _then;

  @override
  $Res call({
    Object? asins = freezed,
  }) {
    return _then(_value.copyWith(
      asins: asins == freezed
          ? _value.asins
          : asins // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$$_QueryItemsResponseCopyWith<$Res>
    implements $QueryItemsResponseCopyWith<$Res> {
  factory _$$_QueryItemsResponseCopyWith(_$_QueryItemsResponse value,
          $Res Function(_$_QueryItemsResponse) then) =
      __$$_QueryItemsResponseCopyWithImpl<$Res>;
  @override
  $Res call({List<String> asins});
}

/// @nodoc
class __$$_QueryItemsResponseCopyWithImpl<$Res>
    extends _$QueryItemsResponseCopyWithImpl<$Res>
    implements _$$_QueryItemsResponseCopyWith<$Res> {
  __$$_QueryItemsResponseCopyWithImpl(
      _$_QueryItemsResponse _value, $Res Function(_$_QueryItemsResponse) _then)
      : super(_value, (v) => _then(v as _$_QueryItemsResponse));

  @override
  _$_QueryItemsResponse get _value => super._value as _$_QueryItemsResponse;

  @override
  $Res call({
    Object? asins = freezed,
  }) {
    return _then(_$_QueryItemsResponse(
      asins: asins == freezed
          ? _value._asins
          : asins // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_QueryItemsResponse implements _QueryItemsResponse {
  const _$_QueryItemsResponse({required final List<String> asins})
      : _asins = asins;

  factory _$_QueryItemsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_QueryItemsResponseFromJson(json);

  final List<String> _asins;
  @override
  List<String> get asins {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_asins);
  }

  @override
  String toString() {
    return 'QueryItemsResponse(asins: $asins)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QueryItemsResponse &&
            const DeepCollectionEquality().equals(other._asins, _asins));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_asins));

  @JsonKey(ignore: true)
  @override
  _$$_QueryItemsResponseCopyWith<_$_QueryItemsResponse> get copyWith =>
      __$$_QueryItemsResponseCopyWithImpl<_$_QueryItemsResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QueryItemsResponseToJson(
      this,
    );
  }
}

abstract class _QueryItemsResponse implements QueryItemsResponse {
  const factory _QueryItemsResponse({required final List<String> asins}) =
      _$_QueryItemsResponse;

  factory _QueryItemsResponse.fromJson(Map<String, dynamic> json) =
      _$_QueryItemsResponse.fromJson;

  @override
  List<String> get asins;
  @override
  @JsonKey(ignore: true)
  _$$_QueryItemsResponseCopyWith<_$_QueryItemsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

BatchGetAsinDataResponse _$BatchGetAsinDataResponseFromJson(
    Map<String, dynamic> json) {
  return _BatchGetAsinDataResponse.fromJson(json);
}

/// @nodoc
mixin _$BatchGetAsinDataResponse {
  List<AsinData> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BatchGetAsinDataResponseCopyWith<BatchGetAsinDataResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BatchGetAsinDataResponseCopyWith<$Res> {
  factory $BatchGetAsinDataResponseCopyWith(BatchGetAsinDataResponse value,
          $Res Function(BatchGetAsinDataResponse) then) =
      _$BatchGetAsinDataResponseCopyWithImpl<$Res>;
  $Res call({List<AsinData> data});
}

/// @nodoc
class _$BatchGetAsinDataResponseCopyWithImpl<$Res>
    implements $BatchGetAsinDataResponseCopyWith<$Res> {
  _$BatchGetAsinDataResponseCopyWithImpl(this._value, this._then);

  final BatchGetAsinDataResponse _value;
  // ignore: unused_field
  final $Res Function(BatchGetAsinDataResponse) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<AsinData>,
    ));
  }
}

/// @nodoc
abstract class _$$_BatchGetAsinDataResponseCopyWith<$Res>
    implements $BatchGetAsinDataResponseCopyWith<$Res> {
  factory _$$_BatchGetAsinDataResponseCopyWith(
          _$_BatchGetAsinDataResponse value,
          $Res Function(_$_BatchGetAsinDataResponse) then) =
      __$$_BatchGetAsinDataResponseCopyWithImpl<$Res>;
  @override
  $Res call({List<AsinData> data});
}

/// @nodoc
class __$$_BatchGetAsinDataResponseCopyWithImpl<$Res>
    extends _$BatchGetAsinDataResponseCopyWithImpl<$Res>
    implements _$$_BatchGetAsinDataResponseCopyWith<$Res> {
  __$$_BatchGetAsinDataResponseCopyWithImpl(_$_BatchGetAsinDataResponse _value,
      $Res Function(_$_BatchGetAsinDataResponse) _then)
      : super(_value, (v) => _then(v as _$_BatchGetAsinDataResponse));

  @override
  _$_BatchGetAsinDataResponse get _value =>
      super._value as _$_BatchGetAsinDataResponse;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_BatchGetAsinDataResponse(
      data: data == freezed
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<AsinData>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_BatchGetAsinDataResponse implements _BatchGetAsinDataResponse {
  const _$_BatchGetAsinDataResponse({required final List<AsinData> data})
      : _data = data;

  factory _$_BatchGetAsinDataResponse.fromJson(Map<String, dynamic> json) =>
      _$$_BatchGetAsinDataResponseFromJson(json);

  final List<AsinData> _data;
  @override
  List<AsinData> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'BatchGetAsinDataResponse(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BatchGetAsinDataResponse &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  _$$_BatchGetAsinDataResponseCopyWith<_$_BatchGetAsinDataResponse>
      get copyWith => __$$_BatchGetAsinDataResponseCopyWithImpl<
          _$_BatchGetAsinDataResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BatchGetAsinDataResponseToJson(
      this,
    );
  }
}

abstract class _BatchGetAsinDataResponse implements BatchGetAsinDataResponse {
  const factory _BatchGetAsinDataResponse(
      {required final List<AsinData> data}) = _$_BatchGetAsinDataResponse;

  factory _BatchGetAsinDataResponse.fromJson(Map<String, dynamic> json) =
      _$_BatchGetAsinDataResponse.fromJson;

  @override
  List<AsinData> get data;
  @override
  @JsonKey(ignore: true)
  _$$_BatchGetAsinDataResponseCopyWith<_$_BatchGetAsinDataResponse>
      get copyWith => throw _privateConstructorUsedError;
}
