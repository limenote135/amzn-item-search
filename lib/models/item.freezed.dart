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
      {@required String jan,
      @required String asin,
      @required int listPrice,
      @required String imageUrl,
      @required String title,
      @required int rank,
      @required String quantity,
      ItemPrice newPrice,
      ItemPrice usedPrice,
      Uint8List imageData}) {
    return _Item(
      jan: jan,
      asin: asin,
      listPrice: listPrice,
      imageUrl: imageUrl,
      title: title,
      rank: rank,
      quantity: quantity,
      newPrice: newPrice,
      usedPrice: usedPrice,
      imageData: imageData,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Item = _$ItemTearOff();

/// @nodoc
mixin _$Item {
  String get jan;
  String get asin;
  int get listPrice; // 参考価格
  String get imageUrl;
  String get title;
  int get rank;
  String get quantity;
  ItemPrice get newPrice;
  ItemPrice get usedPrice;
  Uint8List get imageData;

  $ItemCopyWith<Item> get copyWith;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res>;
  $Res call(
      {String jan,
      String asin,
      int listPrice,
      String imageUrl,
      String title,
      int rank,
      String quantity,
      ItemPrice newPrice,
      ItemPrice usedPrice,
      Uint8List imageData});

  $ItemPriceCopyWith<$Res> get newPrice;
  $ItemPriceCopyWith<$Res> get usedPrice;
}

/// @nodoc
class _$ItemCopyWithImpl<$Res> implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  final Item _value;
  // ignore: unused_field
  final $Res Function(Item) _then;

  @override
  $Res call({
    Object jan = freezed,
    Object asin = freezed,
    Object listPrice = freezed,
    Object imageUrl = freezed,
    Object title = freezed,
    Object rank = freezed,
    Object quantity = freezed,
    Object newPrice = freezed,
    Object usedPrice = freezed,
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
      newPrice: newPrice == freezed ? _value.newPrice : newPrice as ItemPrice,
      usedPrice:
          usedPrice == freezed ? _value.usedPrice : usedPrice as ItemPrice,
      imageData:
          imageData == freezed ? _value.imageData : imageData as Uint8List,
    ));
  }

  @override
  $ItemPriceCopyWith<$Res> get newPrice {
    if (_value.newPrice == null) {
      return null;
    }
    return $ItemPriceCopyWith<$Res>(_value.newPrice, (value) {
      return _then(_value.copyWith(newPrice: value));
    });
  }

  @override
  $ItemPriceCopyWith<$Res> get usedPrice {
    if (_value.usedPrice == null) {
      return null;
    }
    return $ItemPriceCopyWith<$Res>(_value.usedPrice, (value) {
      return _then(_value.copyWith(usedPrice: value));
    });
  }
}

/// @nodoc
abstract class _$ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$ItemCopyWith(_Item value, $Res Function(_Item) then) =
      __$ItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {String jan,
      String asin,
      int listPrice,
      String imageUrl,
      String title,
      int rank,
      String quantity,
      ItemPrice newPrice,
      ItemPrice usedPrice,
      Uint8List imageData});

  @override
  $ItemPriceCopyWith<$Res> get newPrice;
  @override
  $ItemPriceCopyWith<$Res> get usedPrice;
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
    Object jan = freezed,
    Object asin = freezed,
    Object listPrice = freezed,
    Object imageUrl = freezed,
    Object title = freezed,
    Object rank = freezed,
    Object quantity = freezed,
    Object newPrice = freezed,
    Object usedPrice = freezed,
    Object imageData = freezed,
  }) {
    return _then(_Item(
      jan: jan == freezed ? _value.jan : jan as String,
      asin: asin == freezed ? _value.asin : asin as String,
      listPrice: listPrice == freezed ? _value.listPrice : listPrice as int,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      title: title == freezed ? _value.title : title as String,
      rank: rank == freezed ? _value.rank : rank as int,
      quantity: quantity == freezed ? _value.quantity : quantity as String,
      newPrice: newPrice == freezed ? _value.newPrice : newPrice as ItemPrice,
      usedPrice:
          usedPrice == freezed ? _value.usedPrice : usedPrice as ItemPrice,
      imageData:
          imageData == freezed ? _value.imageData : imageData as Uint8List,
    ));
  }
}

/// @nodoc
class _$_Item implements _Item {
  const _$_Item(
      {@required this.jan,
      @required this.asin,
      @required this.listPrice,
      @required this.imageUrl,
      @required this.title,
      @required this.rank,
      @required this.quantity,
      this.newPrice,
      this.usedPrice,
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
  final ItemPrice newPrice;
  @override
  final ItemPrice usedPrice;
  @override
  final Uint8List imageData;

  @override
  String toString() {
    return 'Item(jan: $jan, asin: $asin, listPrice: $listPrice, imageUrl: $imageUrl, title: $title, rank: $rank, quantity: $quantity, newPrice: $newPrice, usedPrice: $usedPrice, imageData: $imageData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Item &&
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
            (identical(other.newPrice, newPrice) ||
                const DeepCollectionEquality()
                    .equals(other.newPrice, newPrice)) &&
            (identical(other.usedPrice, usedPrice) ||
                const DeepCollectionEquality()
                    .equals(other.usedPrice, usedPrice)) &&
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
      const DeepCollectionEquality().hash(newPrice) ^
      const DeepCollectionEquality().hash(usedPrice) ^
      const DeepCollectionEquality().hash(imageData);

  @override
  _$ItemCopyWith<_Item> get copyWith =>
      __$ItemCopyWithImpl<_Item>(this, _$identity);
}

abstract class _Item implements Item {
  const factory _Item(
      {@required String jan,
      @required String asin,
      @required int listPrice,
      @required String imageUrl,
      @required String title,
      @required int rank,
      @required String quantity,
      ItemPrice newPrice,
      ItemPrice usedPrice,
      Uint8List imageData}) = _$_Item;

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
  ItemPrice get newPrice;
  @override
  ItemPrice get usedPrice;
  @override
  Uint8List get imageData;
  @override
  _$ItemCopyWith<_Item> get copyWith;
}
