// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ItemTearOff {
  const _$ItemTearOff();

// ignore: unused_element
  _Item call(
      {@required @HiveField(0) String searchDate,
      @required @HiveField(1) String jan,
      @HiveField(2) List<AsinData> asins = const <AsinData>[]}) {
    return _Item(
      searchDate: searchDate,
      jan: jan,
      asins: asins,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Item = _$ItemTearOff();

/// @nodoc
mixin _$Item {
  @HiveField(0)
  String get searchDate;
  @HiveField(1)
  String get jan;
  @HiveField(2)
  List<AsinData> get asins;

  $ItemCopyWith<Item> get copyWith;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String searchDate,
      @HiveField(1) String jan,
      @HiveField(2) List<AsinData> asins});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res> implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  final Item _value;
  // ignore: unused_field
  final $Res Function(Item) _then;

  @override
  $Res call({
    Object searchDate = freezed,
    Object jan = freezed,
    Object asins = freezed,
  }) {
    return _then(_value.copyWith(
      searchDate:
          searchDate == freezed ? _value.searchDate : searchDate as String,
      jan: jan == freezed ? _value.jan : jan as String,
      asins: asins == freezed ? _value.asins : asins as List<AsinData>,
    ));
  }
}

/// @nodoc
abstract class _$ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$ItemCopyWith(_Item value, $Res Function(_Item) then) =
      __$ItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String searchDate,
      @HiveField(1) String jan,
      @HiveField(2) List<AsinData> asins});
}

/// @nodoc
class __$ItemCopyWithImpl<$Res> extends _$ItemCopyWithImpl<$Res>
    implements _$ItemCopyWith<$Res> {
  __$ItemCopyWithImpl(_Item _value, $Res Function(_Item) _then)
      : super(_value, (v) => _then(v as _Item));

  @override
  _Item get _value => super._value as _Item;

  @override
  $Res call({
    Object searchDate = freezed,
    Object jan = freezed,
    Object asins = freezed,
  }) {
    return _then(_Item(
      searchDate:
          searchDate == freezed ? _value.searchDate : searchDate as String,
      jan: jan == freezed ? _value.jan : jan as String,
      asins: asins == freezed ? _value.asins : asins as List<AsinData>,
    ));
  }
}

@HiveType(typeId: itemTypeId)

/// @nodoc
class _$_Item implements _Item {
  const _$_Item(
      {@required @HiveField(0) this.searchDate,
      @required @HiveField(1) this.jan,
      @HiveField(2) this.asins = const <AsinData>[]})
      : assert(searchDate != null),
        assert(jan != null),
        assert(asins != null);

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
    return 'Item(searchDate: $searchDate, jan: $jan, asins: $asins)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Item &&
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

  @override
  _$ItemCopyWith<_Item> get copyWith =>
      __$ItemCopyWithImpl<_Item>(this, _$identity);
}

abstract class _Item implements Item {
  const factory _Item(
      {@required @HiveField(0) String searchDate,
      @required @HiveField(1) String jan,
      @HiveField(2) List<AsinData> asins}) = _$_Item;

  @override
  @HiveField(0)
  String get searchDate;
  @override
  @HiveField(1)
  String get jan;
  @override
  @HiveField(2)
  List<AsinData> get asins;
  @override
  _$ItemCopyWith<_Item> get copyWith;
}

/// @nodoc
class _$AsinDataTearOff {
  const _$AsinDataTearOff();

// ignore: unused_element
  _AsinData call(
      {@required @HiveField(0) String jan,
      @required @HiveField(1) String asin,
      @required @HiveField(2) int listPrice,
      @required @HiveField(3) String imageUrl,
      @required @HiveField(4) String title,
      @required @HiveField(5) int rank,
      @required @HiveField(6) String quantity,
      @HiveField(7) ItemPrices prices,
      @HiveField(8) Uint8List imageData,
      @required @HiveField(9) String category}) {
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
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AsinData = _$AsinDataTearOff();

/// @nodoc
mixin _$AsinData {
  @HiveField(0)
  String get jan;
  @HiveField(1)
  String get asin;
  @HiveField(2)
  int get listPrice; // 参考価格
  @HiveField(3)
  String get imageUrl;
  @HiveField(4)
  String get title;
  @HiveField(5)
  int get rank;
  @HiveField(6)
  String get quantity; // セット数
  @HiveField(7)
  ItemPrices get prices;
  @HiveField(8)
  Uint8List get imageData;
  @HiveField(9)
  String get category;

  $AsinDataCopyWith<AsinData> get copyWith;
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
      @HiveField(7) ItemPrices prices,
      @HiveField(8) Uint8List imageData,
      @HiveField(9) String category});

  $ItemPricesCopyWith<$Res> get prices;
}

/// @nodoc
class _$AsinDataCopyWithImpl<$Res> implements $AsinDataCopyWith<$Res> {
  _$AsinDataCopyWithImpl(this._value, this._then);

  final AsinData _value;
  // ignore: unused_field
  final $Res Function(AsinData) _then;

  @override
  $Res call({
    Object jan = freezed,
    Object asin = freezed,
    Object listPrice = freezed,
    Object imageUrl = freezed,
    Object title = freezed,
    Object rank = freezed,
    Object quantity = freezed,
    Object prices = freezed,
    Object imageData = freezed,
    Object category = freezed,
  }) {
    return _then(_value.copyWith(
      jan: jan == freezed ? _value.jan : jan as String,
      asin: asin == freezed ? _value.asin : asin as String,
      listPrice: listPrice == freezed ? _value.listPrice : listPrice as int,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      title: title == freezed ? _value.title : title as String,
      rank: rank == freezed ? _value.rank : rank as int,
      quantity: quantity == freezed ? _value.quantity : quantity as String,
      prices: prices == freezed ? _value.prices : prices as ItemPrices,
      imageData:
          imageData == freezed ? _value.imageData : imageData as Uint8List,
      category: category == freezed ? _value.category : category as String,
    ));
  }

  @override
  $ItemPricesCopyWith<$Res> get prices {
    if (_value.prices == null) {
      return null;
    }
    return $ItemPricesCopyWith<$Res>(_value.prices, (value) {
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
      @HiveField(7) ItemPrices prices,
      @HiveField(8) Uint8List imageData,
      @HiveField(9) String category});

  @override
  $ItemPricesCopyWith<$Res> get prices;
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
    Object jan = freezed,
    Object asin = freezed,
    Object listPrice = freezed,
    Object imageUrl = freezed,
    Object title = freezed,
    Object rank = freezed,
    Object quantity = freezed,
    Object prices = freezed,
    Object imageData = freezed,
    Object category = freezed,
  }) {
    return _then(_AsinData(
      jan: jan == freezed ? _value.jan : jan as String,
      asin: asin == freezed ? _value.asin : asin as String,
      listPrice: listPrice == freezed ? _value.listPrice : listPrice as int,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      title: title == freezed ? _value.title : title as String,
      rank: rank == freezed ? _value.rank : rank as int,
      quantity: quantity == freezed ? _value.quantity : quantity as String,
      prices: prices == freezed ? _value.prices : prices as ItemPrices,
      imageData:
          imageData == freezed ? _value.imageData : imageData as Uint8List,
      category: category == freezed ? _value.category : category as String,
    ));
  }
}

@HiveType(typeId: asinDataTypeId)

/// @nodoc
class _$_AsinData implements _AsinData {
  const _$_AsinData(
      {@required @HiveField(0) this.jan,
      @required @HiveField(1) this.asin,
      @required @HiveField(2) this.listPrice,
      @required @HiveField(3) this.imageUrl,
      @required @HiveField(4) this.title,
      @required @HiveField(5) this.rank,
      @required @HiveField(6) this.quantity,
      @HiveField(7) this.prices,
      @HiveField(8) this.imageData,
      @required @HiveField(9) this.category})
      : assert(jan != null),
        assert(asin != null),
        assert(listPrice != null),
        assert(imageUrl != null),
        assert(title != null),
        assert(rank != null),
        assert(quantity != null),
        assert(category != null);

  @override
  @HiveField(0)
  final String jan;
  @override
  @HiveField(1)
  final String asin;
  @override
  @HiveField(2)
  final int listPrice;
  @override // 参考価格
  @HiveField(3)
  final String imageUrl;
  @override
  @HiveField(4)
  final String title;
  @override
  @HiveField(5)
  final int rank;
  @override
  @HiveField(6)
  final String quantity;
  @override // セット数
  @HiveField(7)
  final ItemPrices prices;
  @override
  @HiveField(8)
  final Uint8List imageData;
  @override
  @HiveField(9)
  final String category;

  @override
  String toString() {
    return 'AsinData(jan: $jan, asin: $asin, listPrice: $listPrice, imageUrl: $imageUrl, title: $title, rank: $rank, quantity: $quantity, prices: $prices, imageData: $imageData, category: $category)';
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
                    .equals(other.category, category)));
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
      const DeepCollectionEquality().hash(category);

  @override
  _$AsinDataCopyWith<_AsinData> get copyWith =>
      __$AsinDataCopyWithImpl<_AsinData>(this, _$identity);
}

abstract class _AsinData implements AsinData {
  const factory _AsinData(
      {@required @HiveField(0) String jan,
      @required @HiveField(1) String asin,
      @required @HiveField(2) int listPrice,
      @required @HiveField(3) String imageUrl,
      @required @HiveField(4) String title,
      @required @HiveField(5) int rank,
      @required @HiveField(6) String quantity,
      @HiveField(7) ItemPrices prices,
      @HiveField(8) Uint8List imageData,
      @required @HiveField(9) String category}) = _$_AsinData;

  @override
  @HiveField(0)
  String get jan;
  @override
  @HiveField(1)
  String get asin;
  @override
  @HiveField(2)
  int get listPrice;
  @override // 参考価格
  @HiveField(3)
  String get imageUrl;
  @override
  @HiveField(4)
  String get title;
  @override
  @HiveField(5)
  int get rank;
  @override
  @HiveField(6)
  String get quantity;
  @override // セット数
  @HiveField(7)
  ItemPrices get prices;
  @override
  @HiveField(8)
  Uint8List get imageData;
  @override
  @HiveField(9)
  String get category;
  @override
  _$AsinDataCopyWith<_AsinData> get copyWith;
}
