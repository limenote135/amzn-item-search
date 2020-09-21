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
      {@required String searchDate,
      @required String jan,
      List<AsinData> asins = const <AsinData>[]}) {
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
  String get searchDate;
  String get jan;
  List<AsinData> get asins;

  $ItemCopyWith<Item> get copyWith;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res>;
  $Res call({String searchDate, String jan, List<AsinData> asins});
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
  $Res call({String searchDate, String jan, List<AsinData> asins});
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

/// @nodoc
class _$_Item implements _Item {
  const _$_Item(
      {@required this.searchDate,
      @required this.jan,
      this.asins = const <AsinData>[]})
      : assert(searchDate != null),
        assert(jan != null),
        assert(asins != null);

  @override
  final String searchDate;
  @override
  final String jan;
  @JsonKey(defaultValue: const <AsinData>[])
  @override
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
      {@required String searchDate,
      @required String jan,
      List<AsinData> asins}) = _$_Item;

  @override
  String get searchDate;
  @override
  String get jan;
  @override
  List<AsinData> get asins;
  @override
  _$ItemCopyWith<_Item> get copyWith;
}

/// @nodoc
class _$AsinDataTearOff {
  const _$AsinDataTearOff();

// ignore: unused_element
  _AsinData call(
      {@required String jan,
      @required String asin,
      @required int listPrice,
      @required String imageUrl,
      @required String title,
      @required int rank,
      @required String quantity,
      ItemPrices prices,
      Uint8List imageData}) {
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
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AsinData = _$AsinDataTearOff();

/// @nodoc
mixin _$AsinData {
  String get jan;
  String get asin;
  int get listPrice; // 参考価格
  String get imageUrl;
  String get title;
  int get rank;
  String get quantity;
  ItemPrices get prices;
  Uint8List get imageData;

  $AsinDataCopyWith<AsinData> get copyWith;
}

/// @nodoc
abstract class $AsinDataCopyWith<$Res> {
  factory $AsinDataCopyWith(AsinData value, $Res Function(AsinData) then) =
      _$AsinDataCopyWithImpl<$Res>;
  $Res call(
      {String jan,
      String asin,
      int listPrice,
      String imageUrl,
      String title,
      int rank,
      String quantity,
      ItemPrices prices,
      Uint8List imageData});

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
      {String jan,
      String asin,
      int listPrice,
      String imageUrl,
      String title,
      int rank,
      String quantity,
      ItemPrices prices,
      Uint8List imageData});

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
    ));
  }
}

/// @nodoc
class _$_AsinData implements _AsinData {
  const _$_AsinData(
      {@required this.jan,
      @required this.asin,
      @required this.listPrice,
      @required this.imageUrl,
      @required this.title,
      @required this.rank,
      @required this.quantity,
      this.prices,
      this.imageData})
      : assert(jan != null),
        assert(asin != null),
        assert(listPrice != null),
        assert(imageUrl != null),
        assert(title != null),
        assert(rank != null),
        assert(quantity != null);

  @override
  final String jan;
  @override
  final String asin;
  @override
  final int listPrice;
  @override // 参考価格
  final String imageUrl;
  @override
  final String title;
  @override
  final int rank;
  @override
  final String quantity;
  @override
  final ItemPrices prices;
  @override
  final Uint8List imageData;

  @override
  String toString() {
    return 'AsinData(jan: $jan, asin: $asin, listPrice: $listPrice, imageUrl: $imageUrl, title: $title, rank: $rank, quantity: $quantity, prices: $prices, imageData: $imageData)';
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
                    .equals(other.imageData, imageData)));
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
      const DeepCollectionEquality().hash(imageData);

  @override
  _$AsinDataCopyWith<_AsinData> get copyWith =>
      __$AsinDataCopyWithImpl<_AsinData>(this, _$identity);
}

abstract class _AsinData implements AsinData {
  const factory _AsinData(
      {@required String jan,
      @required String asin,
      @required int listPrice,
      @required String imageUrl,
      @required String title,
      @required int rank,
      @required String quantity,
      ItemPrices prices,
      Uint8List imageData}) = _$_AsinData;

  @override
  String get jan;
  @override
  String get asin;
  @override
  int get listPrice;
  @override // 参考価格
  String get imageUrl;
  @override
  String get title;
  @override
  int get rank;
  @override
  String get quantity;
  @override
  ItemPrices get prices;
  @override
  Uint8List get imageData;
  @override
  _$AsinDataCopyWith<_AsinData> get copyWith;
}
