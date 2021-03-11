// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'mws.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetProductByIdResponse _$GetProductByIdResponseFromJson(
    Map<String, dynamic> json) {
  return _GetProductByIdResponse.fromJson(json);
}

/// @nodoc
class _$GetProductByIdResponseTearOff {
  const _$GetProductByIdResponseTearOff();

  _GetProductByIdResponse call(
      {required String jan, required List<AsinData> items}) {
    return _GetProductByIdResponse(
      jan: jan,
      items: items,
    );
  }

  GetProductByIdResponse fromJson(Map<String, Object> json) {
    return GetProductByIdResponse.fromJson(json);
  }
}

/// @nodoc
const $GetProductByIdResponse = _$GetProductByIdResponseTearOff();

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
abstract class _$GetProductByIdResponseCopyWith<$Res>
    implements $GetProductByIdResponseCopyWith<$Res> {
  factory _$GetProductByIdResponseCopyWith(_GetProductByIdResponse value,
          $Res Function(_GetProductByIdResponse) then) =
      __$GetProductByIdResponseCopyWithImpl<$Res>;
  @override
  $Res call({String jan, List<AsinData> items});
}

/// @nodoc
class __$GetProductByIdResponseCopyWithImpl<$Res>
    extends _$GetProductByIdResponseCopyWithImpl<$Res>
    implements _$GetProductByIdResponseCopyWith<$Res> {
  __$GetProductByIdResponseCopyWithImpl(_GetProductByIdResponse _value,
      $Res Function(_GetProductByIdResponse) _then)
      : super(_value, (v) => _then(v as _GetProductByIdResponse));

  @override
  _GetProductByIdResponse get _value => super._value as _GetProductByIdResponse;

  @override
  $Res call({
    Object? jan = freezed,
    Object? items = freezed,
  }) {
    return _then(_GetProductByIdResponse(
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

@JsonSerializable(fieldRename: FieldRename.snake)

/// @nodoc
class _$_GetProductByIdResponse implements _GetProductByIdResponse {
  const _$_GetProductByIdResponse({required this.jan, required this.items});

  factory _$_GetProductByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_GetProductByIdResponseFromJson(json);

  @override
  final String jan;
  @override
  final List<AsinData> items;

  @override
  String toString() {
    return 'GetProductByIdResponse(jan: $jan, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GetProductByIdResponse &&
            (identical(other.jan, jan) ||
                const DeepCollectionEquality().equals(other.jan, jan)) &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(jan) ^
      const DeepCollectionEquality().hash(items);

  @JsonKey(ignore: true)
  @override
  _$GetProductByIdResponseCopyWith<_GetProductByIdResponse> get copyWith =>
      __$GetProductByIdResponseCopyWithImpl<_GetProductByIdResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GetProductByIdResponseToJson(this);
  }
}

abstract class _GetProductByIdResponse implements GetProductByIdResponse {
  const factory _GetProductByIdResponse(
      {required String jan,
      required List<AsinData> items}) = _$_GetProductByIdResponse;

  factory _GetProductByIdResponse.fromJson(Map<String, dynamic> json) =
      _$_GetProductByIdResponse.fromJson;

  @override
  String get jan => throw _privateConstructorUsedError;
  @override
  List<AsinData> get items => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GetProductByIdResponseCopyWith<_GetProductByIdResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

GetProductPricesResponse _$GetProductPricesResponseFromJson(
    Map<String, dynamic> json) {
  return _GetProductPricesResponse.fromJson(json);
}

/// @nodoc
class _$GetProductPricesResponseTearOff {
  const _$GetProductPricesResponseTearOff();

  _GetProductPricesResponse call({required ItemPrices prices}) {
    return _GetProductPricesResponse(
      prices: prices,
    );
  }

  GetProductPricesResponse fromJson(Map<String, Object> json) {
    return GetProductPricesResponse.fromJson(json);
  }
}

/// @nodoc
const $GetProductPricesResponse = _$GetProductPricesResponseTearOff();

/// @nodoc
mixin _$GetProductPricesResponse {
  ItemPrices get prices => throw _privateConstructorUsedError;

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
  $Res call({ItemPrices prices});

  $ItemPricesCopyWith<$Res> get prices;
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
  }) {
    return _then(_value.copyWith(
      prices: prices == freezed
          ? _value.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as ItemPrices,
    ));
  }

  @override
  $ItemPricesCopyWith<$Res> get prices {
    return $ItemPricesCopyWith<$Res>(_value.prices, (value) {
      return _then(_value.copyWith(prices: value));
    });
  }
}

/// @nodoc
abstract class _$GetProductPricesResponseCopyWith<$Res>
    implements $GetProductPricesResponseCopyWith<$Res> {
  factory _$GetProductPricesResponseCopyWith(_GetProductPricesResponse value,
          $Res Function(_GetProductPricesResponse) then) =
      __$GetProductPricesResponseCopyWithImpl<$Res>;
  @override
  $Res call({ItemPrices prices});

  @override
  $ItemPricesCopyWith<$Res> get prices;
}

/// @nodoc
class __$GetProductPricesResponseCopyWithImpl<$Res>
    extends _$GetProductPricesResponseCopyWithImpl<$Res>
    implements _$GetProductPricesResponseCopyWith<$Res> {
  __$GetProductPricesResponseCopyWithImpl(_GetProductPricesResponse _value,
      $Res Function(_GetProductPricesResponse) _then)
      : super(_value, (v) => _then(v as _GetProductPricesResponse));

  @override
  _GetProductPricesResponse get _value =>
      super._value as _GetProductPricesResponse;

  @override
  $Res call({
    Object? prices = freezed,
  }) {
    return _then(_GetProductPricesResponse(
      prices: prices == freezed
          ? _value.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as ItemPrices,
    ));
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)

/// @nodoc
class _$_GetProductPricesResponse implements _GetProductPricesResponse {
  const _$_GetProductPricesResponse({required this.prices});

  factory _$_GetProductPricesResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_GetProductPricesResponseFromJson(json);

  @override
  final ItemPrices prices;

  @override
  String toString() {
    return 'GetProductPricesResponse(prices: $prices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GetProductPricesResponse &&
            (identical(other.prices, prices) ||
                const DeepCollectionEquality().equals(other.prices, prices)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(prices);

  @JsonKey(ignore: true)
  @override
  _$GetProductPricesResponseCopyWith<_GetProductPricesResponse> get copyWith =>
      __$GetProductPricesResponseCopyWithImpl<_GetProductPricesResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GetProductPricesResponseToJson(this);
  }
}

abstract class _GetProductPricesResponse implements GetProductPricesResponse {
  const factory _GetProductPricesResponse({required ItemPrices prices}) =
      _$_GetProductPricesResponse;

  factory _GetProductPricesResponse.fromJson(Map<String, dynamic> json) =
      _$_GetProductPricesResponse.fromJson;

  @override
  ItemPrices get prices => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GetProductPricesResponseCopyWith<_GetProductPricesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ListMatchingProductRequestTearOff {
  const _$ListMatchingProductRequestTearOff();

  _ListMatchingProductRequest call(
      {required String query, required String category}) {
    return _ListMatchingProductRequest(
      query: query,
      category: category,
    );
  }
}

/// @nodoc
const $ListMatchingProductRequest = _$ListMatchingProductRequestTearOff();

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
abstract class _$ListMatchingProductRequestCopyWith<$Res>
    implements $ListMatchingProductRequestCopyWith<$Res> {
  factory _$ListMatchingProductRequestCopyWith(
          _ListMatchingProductRequest value,
          $Res Function(_ListMatchingProductRequest) then) =
      __$ListMatchingProductRequestCopyWithImpl<$Res>;
  @override
  $Res call({String query, String category});
}

/// @nodoc
class __$ListMatchingProductRequestCopyWithImpl<$Res>
    extends _$ListMatchingProductRequestCopyWithImpl<$Res>
    implements _$ListMatchingProductRequestCopyWith<$Res> {
  __$ListMatchingProductRequestCopyWithImpl(_ListMatchingProductRequest _value,
      $Res Function(_ListMatchingProductRequest) _then)
      : super(_value, (v) => _then(v as _ListMatchingProductRequest));

  @override
  _ListMatchingProductRequest get _value =>
      super._value as _ListMatchingProductRequest;

  @override
  $Res call({
    Object? query = freezed,
    Object? category = freezed,
  }) {
    return _then(_ListMatchingProductRequest(
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
        (other is _ListMatchingProductRequest &&
            (identical(other.query, query) ||
                const DeepCollectionEquality().equals(other.query, query)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(query) ^
      const DeepCollectionEquality().hash(category);

  @JsonKey(ignore: true)
  @override
  _$ListMatchingProductRequestCopyWith<_ListMatchingProductRequest>
      get copyWith => __$ListMatchingProductRequestCopyWithImpl<
          _ListMatchingProductRequest>(this, _$identity);
}

abstract class _ListMatchingProductRequest
    implements ListMatchingProductRequest {
  const factory _ListMatchingProductRequest(
      {required String query,
      required String category}) = _$_ListMatchingProductRequest;

  @override
  String get query => throw _privateConstructorUsedError;
  @override
  String get category => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ListMatchingProductRequestCopyWith<_ListMatchingProductRequest>
      get copyWith => throw _privateConstructorUsedError;
}

ListMatchingProductResponse _$ListMatchingProductResponseFromJson(
    Map<String, dynamic> json) {
  return _ListMatchingProductResponse.fromJson(json);
}

/// @nodoc
class _$ListMatchingProductResponseTearOff {
  const _$ListMatchingProductResponseTearOff();

  _ListMatchingProductResponse call({required List<AsinData> items}) {
    return _ListMatchingProductResponse(
      items: items,
    );
  }

  ListMatchingProductResponse fromJson(Map<String, Object> json) {
    return ListMatchingProductResponse.fromJson(json);
  }
}

/// @nodoc
const $ListMatchingProductResponse = _$ListMatchingProductResponseTearOff();

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
abstract class _$ListMatchingProductResponseCopyWith<$Res>
    implements $ListMatchingProductResponseCopyWith<$Res> {
  factory _$ListMatchingProductResponseCopyWith(
          _ListMatchingProductResponse value,
          $Res Function(_ListMatchingProductResponse) then) =
      __$ListMatchingProductResponseCopyWithImpl<$Res>;
  @override
  $Res call({List<AsinData> items});
}

/// @nodoc
class __$ListMatchingProductResponseCopyWithImpl<$Res>
    extends _$ListMatchingProductResponseCopyWithImpl<$Res>
    implements _$ListMatchingProductResponseCopyWith<$Res> {
  __$ListMatchingProductResponseCopyWithImpl(
      _ListMatchingProductResponse _value,
      $Res Function(_ListMatchingProductResponse) _then)
      : super(_value, (v) => _then(v as _ListMatchingProductResponse));

  @override
  _ListMatchingProductResponse get _value =>
      super._value as _ListMatchingProductResponse;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_ListMatchingProductResponse(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<AsinData>,
    ));
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)

/// @nodoc
class _$_ListMatchingProductResponse implements _ListMatchingProductResponse {
  const _$_ListMatchingProductResponse({required this.items});

  factory _$_ListMatchingProductResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_ListMatchingProductResponseFromJson(json);

  @override
  final List<AsinData> items;

  @override
  String toString() {
    return 'ListMatchingProductResponse(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ListMatchingProductResponse &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(items);

  @JsonKey(ignore: true)
  @override
  _$ListMatchingProductResponseCopyWith<_ListMatchingProductResponse>
      get copyWith => __$ListMatchingProductResponseCopyWithImpl<
          _ListMatchingProductResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ListMatchingProductResponseToJson(this);
  }
}

abstract class _ListMatchingProductResponse
    implements ListMatchingProductResponse {
  const factory _ListMatchingProductResponse({required List<AsinData> items}) =
      _$_ListMatchingProductResponse;

  factory _ListMatchingProductResponse.fromJson(Map<String, dynamic> json) =
      _$_ListMatchingProductResponse.fromJson;

  @override
  List<AsinData> get items => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ListMatchingProductResponseCopyWith<_ListMatchingProductResponse>
      get copyWith => throw _privateConstructorUsedError;
}
