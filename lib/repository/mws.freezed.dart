// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mws.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetProductByIdResponse _$GetProductByIdResponseFromJson(
    Map<String, dynamic> json) {
  return _GetProductByIdResponse.fromJson(json);
}

/// @nodoc
mixin _$GetProductByIdResponse {
  String get code => throw _privateConstructorUsedError;
  List<AsinData> get items => throw _privateConstructorUsedError;

  /// Serializes this GetProductByIdResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetProductByIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetProductByIdResponseCopyWith<GetProductByIdResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetProductByIdResponseCopyWith<$Res> {
  factory $GetProductByIdResponseCopyWith(GetProductByIdResponse value,
          $Res Function(GetProductByIdResponse) then) =
      _$GetProductByIdResponseCopyWithImpl<$Res, GetProductByIdResponse>;
  @useResult
  $Res call({String code, List<AsinData> items});
}

/// @nodoc
class _$GetProductByIdResponseCopyWithImpl<$Res,
        $Val extends GetProductByIdResponse>
    implements $GetProductByIdResponseCopyWith<$Res> {
  _$GetProductByIdResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetProductByIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<AsinData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetProductByIdResponseImplCopyWith<$Res>
    implements $GetProductByIdResponseCopyWith<$Res> {
  factory _$$GetProductByIdResponseImplCopyWith(
          _$GetProductByIdResponseImpl value,
          $Res Function(_$GetProductByIdResponseImpl) then) =
      __$$GetProductByIdResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, List<AsinData> items});
}

/// @nodoc
class __$$GetProductByIdResponseImplCopyWithImpl<$Res>
    extends _$GetProductByIdResponseCopyWithImpl<$Res,
        _$GetProductByIdResponseImpl>
    implements _$$GetProductByIdResponseImplCopyWith<$Res> {
  __$$GetProductByIdResponseImplCopyWithImpl(
      _$GetProductByIdResponseImpl _value,
      $Res Function(_$GetProductByIdResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetProductByIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? items = null,
  }) {
    return _then(_$GetProductByIdResponseImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<AsinData>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$GetProductByIdResponseImpl implements _GetProductByIdResponse {
  const _$GetProductByIdResponseImpl(
      {required this.code, final List<AsinData> items = const <AsinData>[]})
      : _items = items;

  factory _$GetProductByIdResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetProductByIdResponseImplFromJson(json);

  @override
  final String code;
  final List<AsinData> _items;
  @override
  @JsonKey()
  List<AsinData> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'GetProductByIdResponse(code: $code, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProductByIdResponseImpl &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, code, const DeepCollectionEquality().hash(_items));

  /// Create a copy of GetProductByIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProductByIdResponseImplCopyWith<_$GetProductByIdResponseImpl>
      get copyWith => __$$GetProductByIdResponseImplCopyWithImpl<
          _$GetProductByIdResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetProductByIdResponseImplToJson(
      this,
    );
  }
}

abstract class _GetProductByIdResponse implements GetProductByIdResponse {
  const factory _GetProductByIdResponse(
      {required final String code,
      final List<AsinData> items}) = _$GetProductByIdResponseImpl;

  factory _GetProductByIdResponse.fromJson(Map<String, dynamic> json) =
      _$GetProductByIdResponseImpl.fromJson;

  @override
  String get code;
  @override
  List<AsinData> get items;

  /// Create a copy of GetProductByIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetProductByIdResponseImplCopyWith<_$GetProductByIdResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$QueryItemsRequest {
  String get query => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;

  /// Create a copy of QueryItemsRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QueryItemsRequestCopyWith<QueryItemsRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueryItemsRequestCopyWith<$Res> {
  factory $QueryItemsRequestCopyWith(
          QueryItemsRequest value, $Res Function(QueryItemsRequest) then) =
      _$QueryItemsRequestCopyWithImpl<$Res, QueryItemsRequest>;
  @useResult
  $Res call({String query, String category});
}

/// @nodoc
class _$QueryItemsRequestCopyWithImpl<$Res, $Val extends QueryItemsRequest>
    implements $QueryItemsRequestCopyWith<$Res> {
  _$QueryItemsRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QueryItemsRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QueryItemsRequestImplCopyWith<$Res>
    implements $QueryItemsRequestCopyWith<$Res> {
  factory _$$QueryItemsRequestImplCopyWith(_$QueryItemsRequestImpl value,
          $Res Function(_$QueryItemsRequestImpl) then) =
      __$$QueryItemsRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String query, String category});
}

/// @nodoc
class __$$QueryItemsRequestImplCopyWithImpl<$Res>
    extends _$QueryItemsRequestCopyWithImpl<$Res, _$QueryItemsRequestImpl>
    implements _$$QueryItemsRequestImplCopyWith<$Res> {
  __$$QueryItemsRequestImplCopyWithImpl(_$QueryItemsRequestImpl _value,
      $Res Function(_$QueryItemsRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of QueryItemsRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? category = null,
  }) {
    return _then(_$QueryItemsRequestImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$QueryItemsRequestImpl implements _QueryItemsRequest {
  const _$QueryItemsRequestImpl({required this.query, required this.category});

  @override
  final String query;
  @override
  final String category;

  @override
  String toString() {
    return 'QueryItemsRequest(query: $query, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueryItemsRequestImpl &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, category);

  /// Create a copy of QueryItemsRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QueryItemsRequestImplCopyWith<_$QueryItemsRequestImpl> get copyWith =>
      __$$QueryItemsRequestImplCopyWithImpl<_$QueryItemsRequestImpl>(
          this, _$identity);
}

abstract class _QueryItemsRequest implements QueryItemsRequest {
  const factory _QueryItemsRequest(
      {required final String query,
      required final String category}) = _$QueryItemsRequestImpl;

  @override
  String get query;
  @override
  String get category;

  /// Create a copy of QueryItemsRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QueryItemsRequestImplCopyWith<_$QueryItemsRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QueryItemsResponse _$QueryItemsResponseFromJson(Map<String, dynamic> json) {
  return _QueryItemsResponse.fromJson(json);
}

/// @nodoc
mixin _$QueryItemsResponse {
  List<String> get asins => throw _privateConstructorUsedError;

  /// Serializes this QueryItemsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QueryItemsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QueryItemsResponseCopyWith<QueryItemsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueryItemsResponseCopyWith<$Res> {
  factory $QueryItemsResponseCopyWith(
          QueryItemsResponse value, $Res Function(QueryItemsResponse) then) =
      _$QueryItemsResponseCopyWithImpl<$Res, QueryItemsResponse>;
  @useResult
  $Res call({List<String> asins});
}

/// @nodoc
class _$QueryItemsResponseCopyWithImpl<$Res, $Val extends QueryItemsResponse>
    implements $QueryItemsResponseCopyWith<$Res> {
  _$QueryItemsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QueryItemsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? asins = null,
  }) {
    return _then(_value.copyWith(
      asins: null == asins
          ? _value.asins
          : asins // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QueryItemsResponseImplCopyWith<$Res>
    implements $QueryItemsResponseCopyWith<$Res> {
  factory _$$QueryItemsResponseImplCopyWith(_$QueryItemsResponseImpl value,
          $Res Function(_$QueryItemsResponseImpl) then) =
      __$$QueryItemsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> asins});
}

/// @nodoc
class __$$QueryItemsResponseImplCopyWithImpl<$Res>
    extends _$QueryItemsResponseCopyWithImpl<$Res, _$QueryItemsResponseImpl>
    implements _$$QueryItemsResponseImplCopyWith<$Res> {
  __$$QueryItemsResponseImplCopyWithImpl(_$QueryItemsResponseImpl _value,
      $Res Function(_$QueryItemsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of QueryItemsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? asins = null,
  }) {
    return _then(_$QueryItemsResponseImpl(
      asins: null == asins
          ? _value._asins
          : asins // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$QueryItemsResponseImpl implements _QueryItemsResponse {
  const _$QueryItemsResponseImpl({required final List<String> asins})
      : _asins = asins;

  factory _$QueryItemsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$QueryItemsResponseImplFromJson(json);

  final List<String> _asins;
  @override
  List<String> get asins {
    if (_asins is EqualUnmodifiableListView) return _asins;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_asins);
  }

  @override
  String toString() {
    return 'QueryItemsResponse(asins: $asins)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueryItemsResponseImpl &&
            const DeepCollectionEquality().equals(other._asins, _asins));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_asins));

  /// Create a copy of QueryItemsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QueryItemsResponseImplCopyWith<_$QueryItemsResponseImpl> get copyWith =>
      __$$QueryItemsResponseImplCopyWithImpl<_$QueryItemsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QueryItemsResponseImplToJson(
      this,
    );
  }
}

abstract class _QueryItemsResponse implements QueryItemsResponse {
  const factory _QueryItemsResponse({required final List<String> asins}) =
      _$QueryItemsResponseImpl;

  factory _QueryItemsResponse.fromJson(Map<String, dynamic> json) =
      _$QueryItemsResponseImpl.fromJson;

  @override
  List<String> get asins;

  /// Create a copy of QueryItemsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QueryItemsResponseImplCopyWith<_$QueryItemsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BatchGetAsinDataResponse _$BatchGetAsinDataResponseFromJson(
    Map<String, dynamic> json) {
  return _BatchGetAsinDataResponse.fromJson(json);
}

/// @nodoc
mixin _$BatchGetAsinDataResponse {
  List<AsinData> get data => throw _privateConstructorUsedError;

  /// Serializes this BatchGetAsinDataResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BatchGetAsinDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BatchGetAsinDataResponseCopyWith<BatchGetAsinDataResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BatchGetAsinDataResponseCopyWith<$Res> {
  factory $BatchGetAsinDataResponseCopyWith(BatchGetAsinDataResponse value,
          $Res Function(BatchGetAsinDataResponse) then) =
      _$BatchGetAsinDataResponseCopyWithImpl<$Res, BatchGetAsinDataResponse>;
  @useResult
  $Res call({List<AsinData> data});
}

/// @nodoc
class _$BatchGetAsinDataResponseCopyWithImpl<$Res,
        $Val extends BatchGetAsinDataResponse>
    implements $BatchGetAsinDataResponseCopyWith<$Res> {
  _$BatchGetAsinDataResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BatchGetAsinDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<AsinData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BatchGetAsinDataResponseImplCopyWith<$Res>
    implements $BatchGetAsinDataResponseCopyWith<$Res> {
  factory _$$BatchGetAsinDataResponseImplCopyWith(
          _$BatchGetAsinDataResponseImpl value,
          $Res Function(_$BatchGetAsinDataResponseImpl) then) =
      __$$BatchGetAsinDataResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AsinData> data});
}

/// @nodoc
class __$$BatchGetAsinDataResponseImplCopyWithImpl<$Res>
    extends _$BatchGetAsinDataResponseCopyWithImpl<$Res,
        _$BatchGetAsinDataResponseImpl>
    implements _$$BatchGetAsinDataResponseImplCopyWith<$Res> {
  __$$BatchGetAsinDataResponseImplCopyWithImpl(
      _$BatchGetAsinDataResponseImpl _value,
      $Res Function(_$BatchGetAsinDataResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of BatchGetAsinDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$BatchGetAsinDataResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<AsinData>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$BatchGetAsinDataResponseImpl implements _BatchGetAsinDataResponse {
  const _$BatchGetAsinDataResponseImpl({required final List<AsinData> data})
      : _data = data;

  factory _$BatchGetAsinDataResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BatchGetAsinDataResponseImplFromJson(json);

  final List<AsinData> _data;
  @override
  List<AsinData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'BatchGetAsinDataResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BatchGetAsinDataResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of BatchGetAsinDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BatchGetAsinDataResponseImplCopyWith<_$BatchGetAsinDataResponseImpl>
      get copyWith => __$$BatchGetAsinDataResponseImplCopyWithImpl<
          _$BatchGetAsinDataResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BatchGetAsinDataResponseImplToJson(
      this,
    );
  }
}

abstract class _BatchGetAsinDataResponse implements BatchGetAsinDataResponse {
  const factory _BatchGetAsinDataResponse(
      {required final List<AsinData> data}) = _$BatchGetAsinDataResponseImpl;

  factory _BatchGetAsinDataResponse.fromJson(Map<String, dynamic> json) =
      _$BatchGetAsinDataResponseImpl.fromJson;

  @override
  List<AsinData> get data;

  /// Create a copy of BatchGetAsinDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BatchGetAsinDataResponseImplCopyWith<_$BatchGetAsinDataResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GetItemVariationsResponse _$GetItemVariationsResponseFromJson(
    Map<String, dynamic> json) {
  return _GetItemVariationsResponse.fromJson(json);
}

/// @nodoc
mixin _$GetItemVariationsResponse {
  List<String> get asins => throw _privateConstructorUsedError;

  /// Serializes this GetItemVariationsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetItemVariationsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetItemVariationsResponseCopyWith<GetItemVariationsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetItemVariationsResponseCopyWith<$Res> {
  factory $GetItemVariationsResponseCopyWith(GetItemVariationsResponse value,
          $Res Function(GetItemVariationsResponse) then) =
      _$GetItemVariationsResponseCopyWithImpl<$Res, GetItemVariationsResponse>;
  @useResult
  $Res call({List<String> asins});
}

/// @nodoc
class _$GetItemVariationsResponseCopyWithImpl<$Res,
        $Val extends GetItemVariationsResponse>
    implements $GetItemVariationsResponseCopyWith<$Res> {
  _$GetItemVariationsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetItemVariationsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? asins = null,
  }) {
    return _then(_value.copyWith(
      asins: null == asins
          ? _value.asins
          : asins // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetItemVariationsResponseImplCopyWith<$Res>
    implements $GetItemVariationsResponseCopyWith<$Res> {
  factory _$$GetItemVariationsResponseImplCopyWith(
          _$GetItemVariationsResponseImpl value,
          $Res Function(_$GetItemVariationsResponseImpl) then) =
      __$$GetItemVariationsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> asins});
}

/// @nodoc
class __$$GetItemVariationsResponseImplCopyWithImpl<$Res>
    extends _$GetItemVariationsResponseCopyWithImpl<$Res,
        _$GetItemVariationsResponseImpl>
    implements _$$GetItemVariationsResponseImplCopyWith<$Res> {
  __$$GetItemVariationsResponseImplCopyWithImpl(
      _$GetItemVariationsResponseImpl _value,
      $Res Function(_$GetItemVariationsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetItemVariationsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? asins = null,
  }) {
    return _then(_$GetItemVariationsResponseImpl(
      asins: null == asins
          ? _value._asins
          : asins // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$GetItemVariationsResponseImpl implements _GetItemVariationsResponse {
  const _$GetItemVariationsResponseImpl(
      {final List<String> asins = const <String>[]})
      : _asins = asins;

  factory _$GetItemVariationsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetItemVariationsResponseImplFromJson(json);

  final List<String> _asins;
  @override
  @JsonKey()
  List<String> get asins {
    if (_asins is EqualUnmodifiableListView) return _asins;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_asins);
  }

  @override
  String toString() {
    return 'GetItemVariationsResponse(asins: $asins)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetItemVariationsResponseImpl &&
            const DeepCollectionEquality().equals(other._asins, _asins));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_asins));

  /// Create a copy of GetItemVariationsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetItemVariationsResponseImplCopyWith<_$GetItemVariationsResponseImpl>
      get copyWith => __$$GetItemVariationsResponseImplCopyWithImpl<
          _$GetItemVariationsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetItemVariationsResponseImplToJson(
      this,
    );
  }
}

abstract class _GetItemVariationsResponse implements GetItemVariationsResponse {
  const factory _GetItemVariationsResponse({final List<String> asins}) =
      _$GetItemVariationsResponseImpl;

  factory _GetItemVariationsResponse.fromJson(Map<String, dynamic> json) =
      _$GetItemVariationsResponseImpl.fromJson;

  @override
  List<String> get asins;

  /// Create a copy of GetItemVariationsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetItemVariationsResponseImplCopyWith<_$GetItemVariationsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
