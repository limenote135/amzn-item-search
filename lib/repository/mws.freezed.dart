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
  String get jan => throw _privateConstructorUsedError;
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
  $Res call({String jan, List<AsinData> items});
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
    Object? jan = freezed,
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      jan: jan == freezed
          ? _value.jan
          : jan // ignore: cast_nullable_to_non_nullable
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
  $Res call({String jan, List<AsinData> items});
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
    Object? jan = freezed,
    Object? items = freezed,
  }) {
    return _then(_$_GetProductByIdResponse(
      jan: jan == freezed
          ? _value.jan
          : jan // ignore: cast_nullable_to_non_nullable
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
      {required this.jan, required final List<AsinData> items})
      : _items = items;

  factory _$_GetProductByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GetProductByIdResponseFromJson(json);

  @override
  final String jan;
  final List<AsinData> _items;
  @override
  List<AsinData> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'GetProductByIdResponse(jan: $jan, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetProductByIdResponse &&
            const DeepCollectionEquality().equals(other.jan, jan) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(jan),
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
      {required final String jan,
      required final List<AsinData> items}) = _$_GetProductByIdResponse;

  factory _GetProductByIdResponse.fromJson(Map<String, dynamic> json) =
      _$_GetProductByIdResponse.fromJson;

  @override
  String get jan;
  @override
  List<AsinData> get items;
  @override
  @JsonKey(ignore: true)
  _$$_GetProductByIdResponseCopyWith<_$_GetProductByIdResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

GetProductPricesResponse _$GetProductPricesResponseFromJson(
    Map<String, dynamic> json) {
  return _GetProductPricesResponse.fromJson(json);
}

/// @nodoc
mixin _$GetProductPricesResponse {
  ItemPrices? get prices => throw _privateConstructorUsedError;
  bool? get sellByAmazon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetProductPricesResponseCopyWith<GetProductPricesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetProductPricesResponseCopyWith<$Res> {
  factory $GetProductPricesResponseCopyWith(GetProductPricesResponse value,
          $Res Function(GetProductPricesResponse) then) =
      _$GetProductPricesResponseCopyWithImpl<$Res>;
  $Res call({ItemPrices? prices, bool? sellByAmazon});

  $ItemPricesCopyWith<$Res>? get prices;
}

/// @nodoc
class _$GetProductPricesResponseCopyWithImpl<$Res>
    implements $GetProductPricesResponseCopyWith<$Res> {
  _$GetProductPricesResponseCopyWithImpl(this._value, this._then);

  final GetProductPricesResponse _value;
  // ignore: unused_field
  final $Res Function(GetProductPricesResponse) _then;

  @override
  $Res call({
    Object? prices = freezed,
    Object? sellByAmazon = freezed,
  }) {
    return _then(_value.copyWith(
      prices: prices == freezed
          ? _value.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as ItemPrices?,
      sellByAmazon: sellByAmazon == freezed
          ? _value.sellByAmazon
          : sellByAmazon // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  $ItemPricesCopyWith<$Res>? get prices {
    if (_value.prices == null) {
      return null;
    }

    return $ItemPricesCopyWith<$Res>(_value.prices!, (value) {
      return _then(_value.copyWith(prices: value));
    });
  }
}

/// @nodoc
abstract class _$$_GetProductPricesResponseCopyWith<$Res>
    implements $GetProductPricesResponseCopyWith<$Res> {
  factory _$$_GetProductPricesResponseCopyWith(
          _$_GetProductPricesResponse value,
          $Res Function(_$_GetProductPricesResponse) then) =
      __$$_GetProductPricesResponseCopyWithImpl<$Res>;
  @override
  $Res call({ItemPrices? prices, bool? sellByAmazon});

  @override
  $ItemPricesCopyWith<$Res>? get prices;
}

/// @nodoc
class __$$_GetProductPricesResponseCopyWithImpl<$Res>
    extends _$GetProductPricesResponseCopyWithImpl<$Res>
    implements _$$_GetProductPricesResponseCopyWith<$Res> {
  __$$_GetProductPricesResponseCopyWithImpl(_$_GetProductPricesResponse _value,
      $Res Function(_$_GetProductPricesResponse) _then)
      : super(_value, (v) => _then(v as _$_GetProductPricesResponse));

  @override
  _$_GetProductPricesResponse get _value =>
      super._value as _$_GetProductPricesResponse;

  @override
  $Res call({
    Object? prices = freezed,
    Object? sellByAmazon = freezed,
  }) {
    return _then(_$_GetProductPricesResponse(
      prices: prices == freezed
          ? _value.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as ItemPrices?,
      sellByAmazon: sellByAmazon == freezed
          ? _value.sellByAmazon
          : sellByAmazon // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_GetProductPricesResponse implements _GetProductPricesResponse {
  const _$_GetProductPricesResponse({this.prices, this.sellByAmazon});

  factory _$_GetProductPricesResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GetProductPricesResponseFromJson(json);

  @override
  final ItemPrices? prices;
  @override
  final bool? sellByAmazon;

  @override
  String toString() {
    return 'GetProductPricesResponse(prices: $prices, sellByAmazon: $sellByAmazon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetProductPricesResponse &&
            const DeepCollectionEquality().equals(other.prices, prices) &&
            const DeepCollectionEquality()
                .equals(other.sellByAmazon, sellByAmazon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(prices),
      const DeepCollectionEquality().hash(sellByAmazon));

  @JsonKey(ignore: true)
  @override
  _$$_GetProductPricesResponseCopyWith<_$_GetProductPricesResponse>
      get copyWith => __$$_GetProductPricesResponseCopyWithImpl<
          _$_GetProductPricesResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetProductPricesResponseToJson(
      this,
    );
  }
}

abstract class _GetProductPricesResponse implements GetProductPricesResponse {
  const factory _GetProductPricesResponse(
      {final ItemPrices? prices,
      final bool? sellByAmazon}) = _$_GetProductPricesResponse;

  factory _GetProductPricesResponse.fromJson(Map<String, dynamic> json) =
      _$_GetProductPricesResponse.fromJson;

  @override
  ItemPrices? get prices;
  @override
  bool? get sellByAmazon;
  @override
  @JsonKey(ignore: true)
  _$$_GetProductPricesResponseCopyWith<_$_GetProductPricesResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ListMatchingProductRequest {
  String get query => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ListMatchingProductRequestCopyWith<ListMatchingProductRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListMatchingProductRequestCopyWith<$Res> {
  factory $ListMatchingProductRequestCopyWith(ListMatchingProductRequest value,
          $Res Function(ListMatchingProductRequest) then) =
      _$ListMatchingProductRequestCopyWithImpl<$Res>;
  $Res call({String query, String category});
}

/// @nodoc
class _$ListMatchingProductRequestCopyWithImpl<$Res>
    implements $ListMatchingProductRequestCopyWith<$Res> {
  _$ListMatchingProductRequestCopyWithImpl(this._value, this._then);

  final ListMatchingProductRequest _value;
  // ignore: unused_field
  final $Res Function(ListMatchingProductRequest) _then;

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
abstract class _$$_ListMatchingProductRequestCopyWith<$Res>
    implements $ListMatchingProductRequestCopyWith<$Res> {
  factory _$$_ListMatchingProductRequestCopyWith(
          _$_ListMatchingProductRequest value,
          $Res Function(_$_ListMatchingProductRequest) then) =
      __$$_ListMatchingProductRequestCopyWithImpl<$Res>;
  @override
  $Res call({String query, String category});
}

/// @nodoc
class __$$_ListMatchingProductRequestCopyWithImpl<$Res>
    extends _$ListMatchingProductRequestCopyWithImpl<$Res>
    implements _$$_ListMatchingProductRequestCopyWith<$Res> {
  __$$_ListMatchingProductRequestCopyWithImpl(
      _$_ListMatchingProductRequest _value,
      $Res Function(_$_ListMatchingProductRequest) _then)
      : super(_value, (v) => _then(v as _$_ListMatchingProductRequest));

  @override
  _$_ListMatchingProductRequest get _value =>
      super._value as _$_ListMatchingProductRequest;

  @override
  $Res call({
    Object? query = freezed,
    Object? category = freezed,
  }) {
    return _then(_$_ListMatchingProductRequest(
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

class _$_ListMatchingProductRequest implements _ListMatchingProductRequest {
  const _$_ListMatchingProductRequest(
      {required this.query, required this.category});

  @override
  final String query;
  @override
  final String category;

  @override
  String toString() {
    return 'ListMatchingProductRequest(query: $query, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListMatchingProductRequest &&
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
  _$$_ListMatchingProductRequestCopyWith<_$_ListMatchingProductRequest>
      get copyWith => __$$_ListMatchingProductRequestCopyWithImpl<
          _$_ListMatchingProductRequest>(this, _$identity);
}

abstract class _ListMatchingProductRequest
    implements ListMatchingProductRequest {
  const factory _ListMatchingProductRequest(
      {required final String query,
      required final String category}) = _$_ListMatchingProductRequest;

  @override
  String get query;
  @override
  String get category;
  @override
  @JsonKey(ignore: true)
  _$$_ListMatchingProductRequestCopyWith<_$_ListMatchingProductRequest>
      get copyWith => throw _privateConstructorUsedError;
}

ListMatchingProductResponse _$ListMatchingProductResponseFromJson(
    Map<String, dynamic> json) {
  return _ListMatchingProductResponse.fromJson(json);
}

/// @nodoc
mixin _$ListMatchingProductResponse {
  List<AsinData> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListMatchingProductResponseCopyWith<ListMatchingProductResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListMatchingProductResponseCopyWith<$Res> {
  factory $ListMatchingProductResponseCopyWith(
          ListMatchingProductResponse value,
          $Res Function(ListMatchingProductResponse) then) =
      _$ListMatchingProductResponseCopyWithImpl<$Res>;
  $Res call({List<AsinData> items});
}

/// @nodoc
class _$ListMatchingProductResponseCopyWithImpl<$Res>
    implements $ListMatchingProductResponseCopyWith<$Res> {
  _$ListMatchingProductResponseCopyWithImpl(this._value, this._then);

  final ListMatchingProductResponse _value;
  // ignore: unused_field
  final $Res Function(ListMatchingProductResponse) _then;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<AsinData>,
    ));
  }
}

/// @nodoc
abstract class _$$_ListMatchingProductResponseCopyWith<$Res>
    implements $ListMatchingProductResponseCopyWith<$Res> {
  factory _$$_ListMatchingProductResponseCopyWith(
          _$_ListMatchingProductResponse value,
          $Res Function(_$_ListMatchingProductResponse) then) =
      __$$_ListMatchingProductResponseCopyWithImpl<$Res>;
  @override
  $Res call({List<AsinData> items});
}

/// @nodoc
class __$$_ListMatchingProductResponseCopyWithImpl<$Res>
    extends _$ListMatchingProductResponseCopyWithImpl<$Res>
    implements _$$_ListMatchingProductResponseCopyWith<$Res> {
  __$$_ListMatchingProductResponseCopyWithImpl(
      _$_ListMatchingProductResponse _value,
      $Res Function(_$_ListMatchingProductResponse) _then)
      : super(_value, (v) => _then(v as _$_ListMatchingProductResponse));

  @override
  _$_ListMatchingProductResponse get _value =>
      super._value as _$_ListMatchingProductResponse;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_$_ListMatchingProductResponse(
      items: items == freezed
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<AsinData>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_ListMatchingProductResponse implements _ListMatchingProductResponse {
  const _$_ListMatchingProductResponse({required final List<AsinData> items})
      : _items = items;

  factory _$_ListMatchingProductResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ListMatchingProductResponseFromJson(json);

  final List<AsinData> _items;
  @override
  List<AsinData> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ListMatchingProductResponse(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListMatchingProductResponse &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  _$$_ListMatchingProductResponseCopyWith<_$_ListMatchingProductResponse>
      get copyWith => __$$_ListMatchingProductResponseCopyWithImpl<
          _$_ListMatchingProductResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListMatchingProductResponseToJson(
      this,
    );
  }
}

abstract class _ListMatchingProductResponse
    implements ListMatchingProductResponse {
  const factory _ListMatchingProductResponse(
      {required final List<AsinData> items}) = _$_ListMatchingProductResponse;

  factory _ListMatchingProductResponse.fromJson(Map<String, dynamic> json) =
      _$_ListMatchingProductResponse.fromJson;

  @override
  List<AsinData> get items;
  @override
  @JsonKey(ignore: true)
  _$$_ListMatchingProductResponseCopyWith<_$_ListMatchingProductResponse>
      get copyWith => throw _privateConstructorUsedError;
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

GetAsinDataResponse _$GetAsinDataResponseFromJson(Map<String, dynamic> json) {
  return _GetAsinDataResponse.fromJson(json);
}

/// @nodoc
mixin _$GetAsinDataResponse {
  AsinData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetAsinDataResponseCopyWith<GetAsinDataResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAsinDataResponseCopyWith<$Res> {
  factory $GetAsinDataResponseCopyWith(
          GetAsinDataResponse value, $Res Function(GetAsinDataResponse) then) =
      _$GetAsinDataResponseCopyWithImpl<$Res>;
  $Res call({AsinData data});

  $AsinDataCopyWith<$Res> get data;
}

/// @nodoc
class _$GetAsinDataResponseCopyWithImpl<$Res>
    implements $GetAsinDataResponseCopyWith<$Res> {
  _$GetAsinDataResponseCopyWithImpl(this._value, this._then);

  final GetAsinDataResponse _value;
  // ignore: unused_field
  final $Res Function(GetAsinDataResponse) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AsinData,
    ));
  }

  @override
  $AsinDataCopyWith<$Res> get data {
    return $AsinDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$$_GetAsinDataResponseCopyWith<$Res>
    implements $GetAsinDataResponseCopyWith<$Res> {
  factory _$$_GetAsinDataResponseCopyWith(_$_GetAsinDataResponse value,
          $Res Function(_$_GetAsinDataResponse) then) =
      __$$_GetAsinDataResponseCopyWithImpl<$Res>;
  @override
  $Res call({AsinData data});

  @override
  $AsinDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$_GetAsinDataResponseCopyWithImpl<$Res>
    extends _$GetAsinDataResponseCopyWithImpl<$Res>
    implements _$$_GetAsinDataResponseCopyWith<$Res> {
  __$$_GetAsinDataResponseCopyWithImpl(_$_GetAsinDataResponse _value,
      $Res Function(_$_GetAsinDataResponse) _then)
      : super(_value, (v) => _then(v as _$_GetAsinDataResponse));

  @override
  _$_GetAsinDataResponse get _value => super._value as _$_GetAsinDataResponse;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_GetAsinDataResponse(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AsinData,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_GetAsinDataResponse implements _GetAsinDataResponse {
  const _$_GetAsinDataResponse({required this.data});

  factory _$_GetAsinDataResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GetAsinDataResponseFromJson(json);

  @override
  final AsinData data;

  @override
  String toString() {
    return 'GetAsinDataResponse(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetAsinDataResponse &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$_GetAsinDataResponseCopyWith<_$_GetAsinDataResponse> get copyWith =>
      __$$_GetAsinDataResponseCopyWithImpl<_$_GetAsinDataResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetAsinDataResponseToJson(
      this,
    );
  }
}

abstract class _GetAsinDataResponse implements GetAsinDataResponse {
  const factory _GetAsinDataResponse({required final AsinData data}) =
      _$_GetAsinDataResponse;

  factory _GetAsinDataResponse.fromJson(Map<String, dynamic> json) =
      _$_GetAsinDataResponse.fromJson;

  @override
  AsinData get data;
  @override
  @JsonKey(ignore: true)
  _$$_GetAsinDataResponseCopyWith<_$_GetAsinDataResponse> get copyWith =>
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
