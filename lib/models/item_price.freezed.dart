// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'item_price.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ItemPricesTearOff {
  const _$ItemPricesTearOff();

// ignore: unused_element
  _ItemPrices call(
      {@required ItemPrice newPrice,
      @required ItemPrice usedPrice,
      @required FeeInfo feeInfo}) {
    return _ItemPrices(
      newPrice: newPrice,
      usedPrice: usedPrice,
      feeInfo: feeInfo,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ItemPrices = _$ItemPricesTearOff();

/// @nodoc
mixin _$ItemPrices {
  ItemPrice get newPrice;
  ItemPrice get usedPrice;
  FeeInfo get feeInfo;

  $ItemPricesCopyWith<ItemPrices> get copyWith;
}

/// @nodoc
abstract class $ItemPricesCopyWith<$Res> {
  factory $ItemPricesCopyWith(
          ItemPrices value, $Res Function(ItemPrices) then) =
      _$ItemPricesCopyWithImpl<$Res>;
  $Res call({ItemPrice newPrice, ItemPrice usedPrice, FeeInfo feeInfo});

  $ItemPriceCopyWith<$Res> get newPrice;
  $ItemPriceCopyWith<$Res> get usedPrice;
  $FeeInfoCopyWith<$Res> get feeInfo;
}

/// @nodoc
class _$ItemPricesCopyWithImpl<$Res> implements $ItemPricesCopyWith<$Res> {
  _$ItemPricesCopyWithImpl(this._value, this._then);

  final ItemPrices _value;
  // ignore: unused_field
  final $Res Function(ItemPrices) _then;

  @override
  $Res call({
    Object newPrice = freezed,
    Object usedPrice = freezed,
    Object feeInfo = freezed,
  }) {
    return _then(_value.copyWith(
      newPrice: newPrice == freezed ? _value.newPrice : newPrice as ItemPrice,
      usedPrice:
          usedPrice == freezed ? _value.usedPrice : usedPrice as ItemPrice,
      feeInfo: feeInfo == freezed ? _value.feeInfo : feeInfo as FeeInfo,
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

  @override
  $FeeInfoCopyWith<$Res> get feeInfo {
    if (_value.feeInfo == null) {
      return null;
    }
    return $FeeInfoCopyWith<$Res>(_value.feeInfo, (value) {
      return _then(_value.copyWith(feeInfo: value));
    });
  }
}

/// @nodoc
abstract class _$ItemPricesCopyWith<$Res> implements $ItemPricesCopyWith<$Res> {
  factory _$ItemPricesCopyWith(
          _ItemPrices value, $Res Function(_ItemPrices) then) =
      __$ItemPricesCopyWithImpl<$Res>;
  @override
  $Res call({ItemPrice newPrice, ItemPrice usedPrice, FeeInfo feeInfo});

  @override
  $ItemPriceCopyWith<$Res> get newPrice;
  @override
  $ItemPriceCopyWith<$Res> get usedPrice;
  @override
  $FeeInfoCopyWith<$Res> get feeInfo;
}

/// @nodoc
class __$ItemPricesCopyWithImpl<$Res> extends _$ItemPricesCopyWithImpl<$Res>
    implements _$ItemPricesCopyWith<$Res> {
  __$ItemPricesCopyWithImpl(
      _ItemPrices _value, $Res Function(_ItemPrices) _then)
      : super(_value, (v) => _then(v as _ItemPrices));

  @override
  _ItemPrices get _value => super._value as _ItemPrices;

  @override
  $Res call({
    Object newPrice = freezed,
    Object usedPrice = freezed,
    Object feeInfo = freezed,
  }) {
    return _then(_ItemPrices(
      newPrice: newPrice == freezed ? _value.newPrice : newPrice as ItemPrice,
      usedPrice:
          usedPrice == freezed ? _value.usedPrice : usedPrice as ItemPrice,
      feeInfo: feeInfo == freezed ? _value.feeInfo : feeInfo as FeeInfo,
    ));
  }
}

/// @nodoc
class _$_ItemPrices implements _ItemPrices {
  const _$_ItemPrices(
      {@required this.newPrice,
      @required this.usedPrice,
      @required this.feeInfo})
      : assert(newPrice != null),
        assert(usedPrice != null),
        assert(feeInfo != null);

  @override
  final ItemPrice newPrice;
  @override
  final ItemPrice usedPrice;
  @override
  final FeeInfo feeInfo;

  @override
  String toString() {
    return 'ItemPrices(newPrice: $newPrice, usedPrice: $usedPrice, feeInfo: $feeInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ItemPrices &&
            (identical(other.newPrice, newPrice) ||
                const DeepCollectionEquality()
                    .equals(other.newPrice, newPrice)) &&
            (identical(other.usedPrice, usedPrice) ||
                const DeepCollectionEquality()
                    .equals(other.usedPrice, usedPrice)) &&
            (identical(other.feeInfo, feeInfo) ||
                const DeepCollectionEquality().equals(other.feeInfo, feeInfo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(newPrice) ^
      const DeepCollectionEquality().hash(usedPrice) ^
      const DeepCollectionEquality().hash(feeInfo);

  @override
  _$ItemPricesCopyWith<_ItemPrices> get copyWith =>
      __$ItemPricesCopyWithImpl<_ItemPrices>(this, _$identity);
}

abstract class _ItemPrices implements ItemPrices {
  const factory _ItemPrices(
      {@required ItemPrice newPrice,
      @required ItemPrice usedPrice,
      @required FeeInfo feeInfo}) = _$_ItemPrices;

  @override
  ItemPrice get newPrice;
  @override
  ItemPrice get usedPrice;
  @override
  FeeInfo get feeInfo;
  @override
  _$ItemPricesCopyWith<_ItemPrices> get copyWith;
}

/// @nodoc
class _$PriceDetailTearOff {
  const _$PriceDetailTearOff();

// ignore: unused_element
  _PriceInfo call(
      {String itemCondition = '',
      String subCondition = '',
      String channel = '',
      int price = 0,
      int shipping = 0,
      int point = 0}) {
    return _PriceInfo(
      itemCondition: itemCondition,
      subCondition: subCondition,
      channel: channel,
      price: price,
      shipping: shipping,
      point: point,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $PriceDetail = _$PriceDetailTearOff();

/// @nodoc
mixin _$PriceDetail {
  String get itemCondition;
  String get subCondition;
  String get channel;
  int get price;
  int get shipping;
  int get point;

  $PriceDetailCopyWith<PriceDetail> get copyWith;
}

/// @nodoc
abstract class $PriceDetailCopyWith<$Res> {
  factory $PriceDetailCopyWith(
          PriceDetail value, $Res Function(PriceDetail) then) =
      _$PriceDetailCopyWithImpl<$Res>;
  $Res call(
      {String itemCondition,
      String subCondition,
      String channel,
      int price,
      int shipping,
      int point});
}

/// @nodoc
class _$PriceDetailCopyWithImpl<$Res> implements $PriceDetailCopyWith<$Res> {
  _$PriceDetailCopyWithImpl(this._value, this._then);

  final PriceDetail _value;
  // ignore: unused_field
  final $Res Function(PriceDetail) _then;

  @override
  $Res call({
    Object itemCondition = freezed,
    Object subCondition = freezed,
    Object channel = freezed,
    Object price = freezed,
    Object shipping = freezed,
    Object point = freezed,
  }) {
    return _then(_value.copyWith(
      itemCondition: itemCondition == freezed
          ? _value.itemCondition
          : itemCondition as String,
      subCondition: subCondition == freezed
          ? _value.subCondition
          : subCondition as String,
      channel: channel == freezed ? _value.channel : channel as String,
      price: price == freezed ? _value.price : price as int,
      shipping: shipping == freezed ? _value.shipping : shipping as int,
      point: point == freezed ? _value.point : point as int,
    ));
  }
}

/// @nodoc
abstract class _$PriceInfoCopyWith<$Res> implements $PriceDetailCopyWith<$Res> {
  factory _$PriceInfoCopyWith(
          _PriceInfo value, $Res Function(_PriceInfo) then) =
      __$PriceInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String itemCondition,
      String subCondition,
      String channel,
      int price,
      int shipping,
      int point});
}

/// @nodoc
class __$PriceInfoCopyWithImpl<$Res> extends _$PriceDetailCopyWithImpl<$Res>
    implements _$PriceInfoCopyWith<$Res> {
  __$PriceInfoCopyWithImpl(_PriceInfo _value, $Res Function(_PriceInfo) _then)
      : super(_value, (v) => _then(v as _PriceInfo));

  @override
  _PriceInfo get _value => super._value as _PriceInfo;

  @override
  $Res call({
    Object itemCondition = freezed,
    Object subCondition = freezed,
    Object channel = freezed,
    Object price = freezed,
    Object shipping = freezed,
    Object point = freezed,
  }) {
    return _then(_PriceInfo(
      itemCondition: itemCondition == freezed
          ? _value.itemCondition
          : itemCondition as String,
      subCondition: subCondition == freezed
          ? _value.subCondition
          : subCondition as String,
      channel: channel == freezed ? _value.channel : channel as String,
      price: price == freezed ? _value.price : price as int,
      shipping: shipping == freezed ? _value.shipping : shipping as int,
      point: point == freezed ? _value.point : point as int,
    ));
  }
}

/// @nodoc
class _$_PriceInfo implements _PriceInfo {
  const _$_PriceInfo(
      {this.itemCondition = '',
      this.subCondition = '',
      this.channel = '',
      this.price = 0,
      this.shipping = 0,
      this.point = 0})
      : assert(itemCondition != null),
        assert(subCondition != null),
        assert(channel != null),
        assert(price != null),
        assert(shipping != null),
        assert(point != null);

  @JsonKey(defaultValue: '')
  @override
  final String itemCondition;
  @JsonKey(defaultValue: '')
  @override
  final String subCondition;
  @JsonKey(defaultValue: '')
  @override
  final String channel;
  @JsonKey(defaultValue: 0)
  @override
  final int price;
  @JsonKey(defaultValue: 0)
  @override
  final int shipping;
  @JsonKey(defaultValue: 0)
  @override
  final int point;

  @override
  String toString() {
    return 'PriceDetail(itemCondition: $itemCondition, subCondition: $subCondition, channel: $channel, price: $price, shipping: $shipping, point: $point)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PriceInfo &&
            (identical(other.itemCondition, itemCondition) ||
                const DeepCollectionEquality()
                    .equals(other.itemCondition, itemCondition)) &&
            (identical(other.subCondition, subCondition) ||
                const DeepCollectionEquality()
                    .equals(other.subCondition, subCondition)) &&
            (identical(other.channel, channel) ||
                const DeepCollectionEquality()
                    .equals(other.channel, channel)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.shipping, shipping) ||
                const DeepCollectionEquality()
                    .equals(other.shipping, shipping)) &&
            (identical(other.point, point) ||
                const DeepCollectionEquality().equals(other.point, point)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(itemCondition) ^
      const DeepCollectionEquality().hash(subCondition) ^
      const DeepCollectionEquality().hash(channel) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(shipping) ^
      const DeepCollectionEquality().hash(point);

  @override
  _$PriceInfoCopyWith<_PriceInfo> get copyWith =>
      __$PriceInfoCopyWithImpl<_PriceInfo>(this, _$identity);
}

abstract class _PriceInfo implements PriceDetail {
  const factory _PriceInfo(
      {String itemCondition,
      String subCondition,
      String channel,
      int price,
      int shipping,
      int point}) = _$_PriceInfo;

  @override
  String get itemCondition;
  @override
  String get subCondition;
  @override
  String get channel;
  @override
  int get price;
  @override
  int get shipping;
  @override
  int get point;
  @override
  _$PriceInfoCopyWith<_PriceInfo> get copyWith;
}

/// @nodoc
class _$ItemPriceTearOff {
  const _$ItemPriceTearOff();

// ignore: unused_element
  _ItemPrice call(
      {int lowestPrice = 0,
      int shipping = 0,
      List<PriceDetail> prices = const <PriceDetail>[]}) {
    return _ItemPrice(
      lowestPrice: lowestPrice,
      shipping: shipping,
      prices: prices,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ItemPrice = _$ItemPriceTearOff();

/// @nodoc
mixin _$ItemPrice {
  int get lowestPrice; // 最安値
  int get shipping; // 送料
  List<PriceDetail> get prices;

  $ItemPriceCopyWith<ItemPrice> get copyWith;
}

/// @nodoc
abstract class $ItemPriceCopyWith<$Res> {
  factory $ItemPriceCopyWith(ItemPrice value, $Res Function(ItemPrice) then) =
      _$ItemPriceCopyWithImpl<$Res>;
  $Res call({int lowestPrice, int shipping, List<PriceDetail> prices});
}

/// @nodoc
class _$ItemPriceCopyWithImpl<$Res> implements $ItemPriceCopyWith<$Res> {
  _$ItemPriceCopyWithImpl(this._value, this._then);

  final ItemPrice _value;
  // ignore: unused_field
  final $Res Function(ItemPrice) _then;

  @override
  $Res call({
    Object lowestPrice = freezed,
    Object shipping = freezed,
    Object prices = freezed,
  }) {
    return _then(_value.copyWith(
      lowestPrice:
          lowestPrice == freezed ? _value.lowestPrice : lowestPrice as int,
      shipping: shipping == freezed ? _value.shipping : shipping as int,
      prices: prices == freezed ? _value.prices : prices as List<PriceDetail>,
    ));
  }
}

/// @nodoc
abstract class _$ItemPriceCopyWith<$Res> implements $ItemPriceCopyWith<$Res> {
  factory _$ItemPriceCopyWith(
          _ItemPrice value, $Res Function(_ItemPrice) then) =
      __$ItemPriceCopyWithImpl<$Res>;
  @override
  $Res call({int lowestPrice, int shipping, List<PriceDetail> prices});
}

/// @nodoc
class __$ItemPriceCopyWithImpl<$Res> extends _$ItemPriceCopyWithImpl<$Res>
    implements _$ItemPriceCopyWith<$Res> {
  __$ItemPriceCopyWithImpl(_ItemPrice _value, $Res Function(_ItemPrice) _then)
      : super(_value, (v) => _then(v as _ItemPrice));

  @override
  _ItemPrice get _value => super._value as _ItemPrice;

  @override
  $Res call({
    Object lowestPrice = freezed,
    Object shipping = freezed,
    Object prices = freezed,
  }) {
    return _then(_ItemPrice(
      lowestPrice:
          lowestPrice == freezed ? _value.lowestPrice : lowestPrice as int,
      shipping: shipping == freezed ? _value.shipping : shipping as int,
      prices: prices == freezed ? _value.prices : prices as List<PriceDetail>,
    ));
  }
}

/// @nodoc
class _$_ItemPrice implements _ItemPrice {
  const _$_ItemPrice(
      {this.lowestPrice = 0,
      this.shipping = 0,
      this.prices = const <PriceDetail>[]})
      : assert(lowestPrice != null),
        assert(shipping != null),
        assert(prices != null);

  @JsonKey(defaultValue: 0)
  @override
  final int lowestPrice;
  @JsonKey(defaultValue: 0)
  @override // 最安値
  final int shipping;
  @JsonKey(defaultValue: const <PriceDetail>[])
  @override // 送料
  final List<PriceDetail> prices;

  @override
  String toString() {
    return 'ItemPrice(lowestPrice: $lowestPrice, shipping: $shipping, prices: $prices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ItemPrice &&
            (identical(other.lowestPrice, lowestPrice) ||
                const DeepCollectionEquality()
                    .equals(other.lowestPrice, lowestPrice)) &&
            (identical(other.shipping, shipping) ||
                const DeepCollectionEquality()
                    .equals(other.shipping, shipping)) &&
            (identical(other.prices, prices) ||
                const DeepCollectionEquality().equals(other.prices, prices)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(lowestPrice) ^
      const DeepCollectionEquality().hash(shipping) ^
      const DeepCollectionEquality().hash(prices);

  @override
  _$ItemPriceCopyWith<_ItemPrice> get copyWith =>
      __$ItemPriceCopyWithImpl<_ItemPrice>(this, _$identity);
}

abstract class _ItemPrice implements ItemPrice {
  const factory _ItemPrice(
      {int lowestPrice, int shipping, List<PriceDetail> prices}) = _$_ItemPrice;

  @override
  int get lowestPrice;
  @override // 最安値
  int get shipping;
  @override // 送料
  List<PriceDetail> get prices;
  @override
  _$ItemPriceCopyWith<_ItemPrice> get copyWith;
}
