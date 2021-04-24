// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'search_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SearchItemTearOff {
  const _$SearchItemTearOff();

  _SearchItem call(
      {@HiveField(0) required String searchDate,
      @HiveField(1) required String jan,
      @HiveField(2) List<AsinData> asins = const <AsinData>[]}) {
    return _SearchItem(
      searchDate: searchDate,
      jan: jan,
      asins: asins,
    );
  }
}

/// @nodoc
const $SearchItem = _$SearchItemTearOff();

/// @nodoc
mixin _$SearchItem {
  @HiveField(0)
  String get searchDate => throw _privateConstructorUsedError;
  @HiveField(1)
  String get jan => throw _privateConstructorUsedError;
  @HiveField(2)
  List<AsinData> get asins => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchItemCopyWith<SearchItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchItemCopyWith<$Res> {
  factory $SearchItemCopyWith(
          SearchItem value, $Res Function(SearchItem) then) =
      _$SearchItemCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String searchDate,
      @HiveField(1) String jan,
      @HiveField(2) List<AsinData> asins});
}

/// @nodoc
class _$SearchItemCopyWithImpl<$Res> implements $SearchItemCopyWith<$Res> {
  _$SearchItemCopyWithImpl(this._value, this._then);

  final SearchItem _value;
  // ignore: unused_field
  final $Res Function(SearchItem) _then;

  @override
  $Res call({
    Object? searchDate = freezed,
    Object? jan = freezed,
    Object? asins = freezed,
  }) {
    return _then(_value.copyWith(
      searchDate: searchDate == freezed
          ? _value.searchDate
          : searchDate // ignore: cast_nullable_to_non_nullable
              as String,
      jan: jan == freezed
          ? _value.jan
          : jan // ignore: cast_nullable_to_non_nullable
              as String,
      asins: asins == freezed
          ? _value.asins
          : asins // ignore: cast_nullable_to_non_nullable
              as List<AsinData>,
    ));
  }
}

/// @nodoc
abstract class _$SearchItemCopyWith<$Res> implements $SearchItemCopyWith<$Res> {
  factory _$SearchItemCopyWith(
          _SearchItem value, $Res Function(_SearchItem) then) =
      __$SearchItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String searchDate,
      @HiveField(1) String jan,
      @HiveField(2) List<AsinData> asins});
}

/// @nodoc
class __$SearchItemCopyWithImpl<$Res> extends _$SearchItemCopyWithImpl<$Res>
    implements _$SearchItemCopyWith<$Res> {
  __$SearchItemCopyWithImpl(
      _SearchItem _value, $Res Function(_SearchItem) _then)
      : super(_value, (v) => _then(v as _SearchItem));

  @override
  _SearchItem get _value => super._value as _SearchItem;

  @override
  $Res call({
    Object? searchDate = freezed,
    Object? jan = freezed,
    Object? asins = freezed,
  }) {
    return _then(_SearchItem(
      searchDate: searchDate == freezed
          ? _value.searchDate
          : searchDate // ignore: cast_nullable_to_non_nullable
              as String,
      jan: jan == freezed
          ? _value.jan
          : jan // ignore: cast_nullable_to_non_nullable
              as String,
      asins: asins == freezed
          ? _value.asins
          : asins // ignore: cast_nullable_to_non_nullable
              as List<AsinData>,
    ));
  }
}

/// @nodoc

@HiveType(typeId: itemTypeId)
class _$_SearchItem implements _SearchItem {
  const _$_SearchItem(
      {@HiveField(0) required this.searchDate,
      @HiveField(1) required this.jan,
      @HiveField(2) this.asins = const <AsinData>[]});

  @override
  @HiveField(0)
  final String searchDate;
  @override
  @HiveField(1)
  final String jan;
  @JsonKey(defaultValue: const <AsinData>[])
  @override
  @HiveField(2)
  final List<AsinData> asins;

  @override
  String toString() {
    return 'SearchItem(searchDate: $searchDate, jan: $jan, asins: $asins)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SearchItem &&
            (identical(other.searchDate, searchDate) ||
                const DeepCollectionEquality()
                    .equals(other.searchDate, searchDate)) &&
            (identical(other.jan, jan) ||
                const DeepCollectionEquality().equals(other.jan, jan)) &&
            (identical(other.asins, asins) ||
                const DeepCollectionEquality().equals(other.asins, asins)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(searchDate) ^
      const DeepCollectionEquality().hash(jan) ^
      const DeepCollectionEquality().hash(asins);

  @JsonKey(ignore: true)
  @override
  _$SearchItemCopyWith<_SearchItem> get copyWith =>
      __$SearchItemCopyWithImpl<_SearchItem>(this, _$identity);
}

abstract class _SearchItem implements SearchItem {
  const factory _SearchItem(
      {@HiveField(0) required String searchDate,
      @HiveField(1) required String jan,
      @HiveField(2) List<AsinData> asins}) = _$_SearchItem;

  @override
  @HiveField(0)
  String get searchDate => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String get jan => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  List<AsinData> get asins => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SearchItemCopyWith<_SearchItem> get copyWith =>
      throw _privateConstructorUsedError;
}

AsinData _$AsinDataFromJson(Map<String, dynamic> json) {
  return _AsinData.fromJson(json);
}

/// @nodoc
class _$AsinDataTearOff {
  const _$AsinDataTearOff();

  _AsinData call(
      {@HiveField(0)
          String jan = "",
      @HiveField(1)
          required String asin,
      @HiveField(2)
          int listPrice = 0,
      @HiveField(3)
          required String imageUrl,
      @HiveField(4)
          required String title,
      @HiveField(5)
          int rank = 0,
      @HiveField(6)
          String quantity = " - ",
      @HiveField(7)
          ItemPrices? prices,
      @HiveField(8)
      @JsonKey(ignore: true)
          Uint8List? imageData,
      @HiveField(9, defaultValue: "")
      @ItemCategoryConverter()
          required String category,
      @HiveField(10)
          bool? sellByAmazon}) {
    return _AsinData(
      jan: jan,
      asin: asin,
      listPrice: listPrice,
      imageUrl: imageUrl,
      title: title,
      rank: rank,
      quantity: quantity,
      prices: prices,
      imageData: imageData,
      category: category,
      sellByAmazon: sellByAmazon,
    );
  }

  AsinData fromJson(Map<String, Object> json) {
    return AsinData.fromJson(json);
  }
}

/// @nodoc
const $AsinData = _$AsinDataTearOff();

/// @nodoc
mixin _$AsinData {
  @HiveField(0)
  String get jan => throw _privateConstructorUsedError;
  @HiveField(1)
  String get asin => throw _privateConstructorUsedError;
  @HiveField(2)
  int get listPrice => throw _privateConstructorUsedError; // 参考価格
  @HiveField(3)
  String get imageUrl => throw _privateConstructorUsedError;
  @HiveField(4)
  String get title => throw _privateConstructorUsedError;
  @HiveField(5)
  int get rank => throw _privateConstructorUsedError;
  @HiveField(6)
  String get quantity => throw _privateConstructorUsedError; // セット数
  @HiveField(7)
  ItemPrices? get prices => throw _privateConstructorUsedError;
  @HiveField(8)
  @JsonKey(ignore: true)
  Uint8List? get imageData => throw _privateConstructorUsedError;
  @HiveField(9, defaultValue: "")
  @ItemCategoryConverter()
  String get category => throw _privateConstructorUsedError;
  @HiveField(10)
  bool? get sellByAmazon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AsinDataCopyWith<AsinData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AsinDataCopyWith<$Res> {
  factory $AsinDataCopyWith(AsinData value, $Res Function(AsinData) then) =
      _$AsinDataCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String jan,
      @HiveField(1) String asin,
      @HiveField(2) int listPrice,
      @HiveField(3) String imageUrl,
      @HiveField(4) String title,
      @HiveField(5) int rank,
      @HiveField(6) String quantity,
      @HiveField(7) ItemPrices? prices,
      @HiveField(8) @JsonKey(ignore: true) Uint8List? imageData,
      @HiveField(9, defaultValue: "") @ItemCategoryConverter() String category,
      @HiveField(10) bool? sellByAmazon});

  $ItemPricesCopyWith<$Res>? get prices;
}

/// @nodoc
class _$AsinDataCopyWithImpl<$Res> implements $AsinDataCopyWith<$Res> {
  _$AsinDataCopyWithImpl(this._value, this._then);

  final AsinData _value;
  // ignore: unused_field
  final $Res Function(AsinData) _then;

  @override
  $Res call({
    Object? jan = freezed,
    Object? asin = freezed,
    Object? listPrice = freezed,
    Object? imageUrl = freezed,
    Object? title = freezed,
    Object? rank = freezed,
    Object? quantity = freezed,
    Object? prices = freezed,
    Object? imageData = freezed,
    Object? category = freezed,
    Object? sellByAmazon = freezed,
  }) {
    return _then(_value.copyWith(
      jan: jan == freezed
          ? _value.jan
          : jan // ignore: cast_nullable_to_non_nullable
              as String,
      asin: asin == freezed
          ? _value.asin
          : asin // ignore: cast_nullable_to_non_nullable
              as String,
      listPrice: listPrice == freezed
          ? _value.listPrice
          : listPrice // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      rank: rank == freezed
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      prices: prices == freezed
          ? _value.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as ItemPrices?,
      imageData: imageData == freezed
          ? _value.imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$AsinDataCopyWith<$Res> implements $AsinDataCopyWith<$Res> {
  factory _$AsinDataCopyWith(_AsinData value, $Res Function(_AsinData) then) =
      __$AsinDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String jan,
      @HiveField(1) String asin,
      @HiveField(2) int listPrice,
      @HiveField(3) String imageUrl,
      @HiveField(4) String title,
      @HiveField(5) int rank,
      @HiveField(6) String quantity,
      @HiveField(7) ItemPrices? prices,
      @HiveField(8) @JsonKey(ignore: true) Uint8List? imageData,
      @HiveField(9, defaultValue: "") @ItemCategoryConverter() String category,
      @HiveField(10) bool? sellByAmazon});

  @override
  $ItemPricesCopyWith<$Res>? get prices;
}

/// @nodoc
class __$AsinDataCopyWithImpl<$Res> extends _$AsinDataCopyWithImpl<$Res>
    implements _$AsinDataCopyWith<$Res> {
  __$AsinDataCopyWithImpl(_AsinData _value, $Res Function(_AsinData) _then)
      : super(_value, (v) => _then(v as _AsinData));

  @override
  _AsinData get _value => super._value as _AsinData;

  @override
  $Res call({
    Object? jan = freezed,
    Object? asin = freezed,
    Object? listPrice = freezed,
    Object? imageUrl = freezed,
    Object? title = freezed,
    Object? rank = freezed,
    Object? quantity = freezed,
    Object? prices = freezed,
    Object? imageData = freezed,
    Object? category = freezed,
    Object? sellByAmazon = freezed,
  }) {
    return _then(_AsinData(
      jan: jan == freezed
          ? _value.jan
          : jan // ignore: cast_nullable_to_non_nullable
              as String,
      asin: asin == freezed
          ? _value.asin
          : asin // ignore: cast_nullable_to_non_nullable
              as String,
      listPrice: listPrice == freezed
          ? _value.listPrice
          : listPrice // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      rank: rank == freezed
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      prices: prices == freezed
          ? _value.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as ItemPrices?,
      imageData: imageData == freezed
          ? _value.imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      sellByAmazon: sellByAmazon == freezed
          ? _value.sellByAmazon
          : sellByAmazon // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
@HiveType(typeId: asinDataTypeId)
class _$_AsinData implements _AsinData {
  const _$_AsinData(
      {@HiveField(0)
          this.jan = "",
      @HiveField(1)
          required this.asin,
      @HiveField(2)
          this.listPrice = 0,
      @HiveField(3)
          required this.imageUrl,
      @HiveField(4)
          required this.title,
      @HiveField(5)
          this.rank = 0,
      @HiveField(6)
          this.quantity = " - ",
      @HiveField(7)
          this.prices,
      @HiveField(8)
      @JsonKey(ignore: true)
          this.imageData,
      @HiveField(9, defaultValue: "")
      @ItemCategoryConverter()
          required this.category,
      @HiveField(10)
          this.sellByAmazon});

  factory _$_AsinData.fromJson(Map<String, dynamic> json) =>
      _$_$_AsinDataFromJson(json);

  @JsonKey(defaultValue: "")
  @override
  @HiveField(0)
  final String jan;
  @override
  @HiveField(1)
  final String asin;
  @JsonKey(defaultValue: 0)
  @override
  @HiveField(2)
  final int listPrice;
  @override // 参考価格
  @HiveField(3)
  final String imageUrl;
  @override
  @HiveField(4)
  final String title;
  @JsonKey(defaultValue: 0)
  @override
  @HiveField(5)
  final int rank;
  @JsonKey(defaultValue: " - ")
  @override
  @HiveField(6)
  final String quantity;
  @override // セット数
  @HiveField(7)
  final ItemPrices? prices;
  @override
  @HiveField(8)
  @JsonKey(ignore: true)
  final Uint8List? imageData;
  @override
  @HiveField(9, defaultValue: "")
  @ItemCategoryConverter()
  final String category;
  @override
  @HiveField(10)
  final bool? sellByAmazon;

  @override
  String toString() {
    return 'AsinData(jan: $jan, asin: $asin, listPrice: $listPrice, imageUrl: $imageUrl, title: $title, rank: $rank, quantity: $quantity, prices: $prices, imageData: $imageData, category: $category, sellByAmazon: $sellByAmazon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AsinData &&
            (identical(other.jan, jan) ||
                const DeepCollectionEquality().equals(other.jan, jan)) &&
            (identical(other.asin, asin) ||
                const DeepCollectionEquality().equals(other.asin, asin)) &&
            (identical(other.listPrice, listPrice) ||
                const DeepCollectionEquality()
                    .equals(other.listPrice, listPrice)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.rank, rank) ||
                const DeepCollectionEquality().equals(other.rank, rank)) &&
            (identical(other.quantity, quantity) ||
                const DeepCollectionEquality()
                    .equals(other.quantity, quantity)) &&
            (identical(other.prices, prices) ||
                const DeepCollectionEquality().equals(other.prices, prices)) &&
            (identical(other.imageData, imageData) ||
                const DeepCollectionEquality()
                    .equals(other.imageData, imageData)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.sellByAmazon, sellByAmazon) ||
                const DeepCollectionEquality()
                    .equals(other.sellByAmazon, sellByAmazon)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(jan) ^
      const DeepCollectionEquality().hash(asin) ^
      const DeepCollectionEquality().hash(listPrice) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(rank) ^
      const DeepCollectionEquality().hash(quantity) ^
      const DeepCollectionEquality().hash(prices) ^
      const DeepCollectionEquality().hash(imageData) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(sellByAmazon);

  @JsonKey(ignore: true)
  @override
  _$AsinDataCopyWith<_AsinData> get copyWith =>
      __$AsinDataCopyWithImpl<_AsinData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AsinDataToJson(this);
  }
}

abstract class _AsinData implements AsinData {
  const factory _AsinData(
      {@HiveField(0)
          String jan,
      @HiveField(1)
          required String asin,
      @HiveField(2)
          int listPrice,
      @HiveField(3)
          required String imageUrl,
      @HiveField(4)
          required String title,
      @HiveField(5)
          int rank,
      @HiveField(6)
          String quantity,
      @HiveField(7)
          ItemPrices? prices,
      @HiveField(8)
      @JsonKey(ignore: true)
          Uint8List? imageData,
      @HiveField(9, defaultValue: "")
      @ItemCategoryConverter()
          required String category,
      @HiveField(10)
          bool? sellByAmazon}) = _$_AsinData;

  factory _AsinData.fromJson(Map<String, dynamic> json) = _$_AsinData.fromJson;

  @override
  @HiveField(0)
  String get jan => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String get asin => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  int get listPrice => throw _privateConstructorUsedError;
  @override // 参考価格
  @HiveField(3)
  String get imageUrl => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  String get title => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  int get rank => throw _privateConstructorUsedError;
  @override
  @HiveField(6)
  String get quantity => throw _privateConstructorUsedError;
  @override // セット数
  @HiveField(7)
  ItemPrices? get prices => throw _privateConstructorUsedError;
  @override
  @HiveField(8)
  @JsonKey(ignore: true)
  Uint8List? get imageData => throw _privateConstructorUsedError;
  @override
  @HiveField(9, defaultValue: "")
  @ItemCategoryConverter()
  String get category => throw _privateConstructorUsedError;
  @override
  @HiveField(10)
  bool? get sellByAmazon => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AsinDataCopyWith<_AsinData> get copyWith =>
      throw _privateConstructorUsedError;
}
