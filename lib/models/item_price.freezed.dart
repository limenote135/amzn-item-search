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
      {@HiveField(0) List<PriceDetail> newPrices = const <PriceDetail>[],
      @HiveField(1) List<PriceDetail> usedPrices = const <PriceDetail>[],
      @required @HiveField(2) FeeInfo feeInfo}) {
    return _ItemPrices(
      newPrices: newPrices,
      usedPrices: usedPrices,
      feeInfo: feeInfo,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ItemPrices = _$ItemPricesTearOff();

/// @nodoc
mixin _$ItemPrices {
  @HiveField(0)
  List<PriceDetail> get newPrices;
  @HiveField(1)
  List<PriceDetail> get usedPrices;
  @HiveField(2)
  FeeInfo get feeInfo;

  $ItemPricesCopyWith<ItemPrices> get copyWith;
}

/// @nodoc
abstract class $ItemPricesCopyWith<$Res> {
  factory $ItemPricesCopyWith(
          ItemPrices value, $Res Function(ItemPrices) then) =
      _$ItemPricesCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) List<PriceDetail> newPrices,
      @HiveField(1) List<PriceDetail> usedPrices,
      @HiveField(2) FeeInfo feeInfo});

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
    Object newPrices = freezed,
    Object usedPrices = freezed,
    Object feeInfo = freezed,
  }) {
    return _then(_value.copyWith(
      newPrices: newPrices == freezed
          ? _value.newPrices
          : newPrices as List<PriceDetail>,
      usedPrices: usedPrices == freezed
          ? _value.usedPrices
          : usedPrices as List<PriceDetail>,
      feeInfo: feeInfo == freezed ? _value.feeInfo : feeInfo as FeeInfo,
    ));
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
  $Res call(
      {@HiveField(0) List<PriceDetail> newPrices,
      @HiveField(1) List<PriceDetail> usedPrices,
      @HiveField(2) FeeInfo feeInfo});

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
    Object newPrices = freezed,
    Object usedPrices = freezed,
    Object feeInfo = freezed,
  }) {
    return _then(_ItemPrices(
      newPrices: newPrices == freezed
          ? _value.newPrices
          : newPrices as List<PriceDetail>,
      usedPrices: usedPrices == freezed
          ? _value.usedPrices
          : usedPrices as List<PriceDetail>,
      feeInfo: feeInfo == freezed ? _value.feeInfo : feeInfo as FeeInfo,
    ));
  }
}

@HiveType(typeId: itemPricesTypeId)

/// @nodoc
class _$_ItemPrices implements _ItemPrices {
  const _$_ItemPrices(
      {@HiveField(0) this.newPrices = const <PriceDetail>[],
      @HiveField(1) this.usedPrices = const <PriceDetail>[],
      @required @HiveField(2) this.feeInfo})
      : assert(newPrices != null),
        assert(usedPrices != null),
        assert(feeInfo != null);

  @JsonKey(defaultValue: const <PriceDetail>[])
  @override
  @HiveField(0)
  final List<PriceDetail> newPrices;
  @JsonKey(defaultValue: const <PriceDetail>[])
  @override
  @HiveField(1)
  final List<PriceDetail> usedPrices;
  @override
  @HiveField(2)
  final FeeInfo feeInfo;

  @override
  String toString() {
    return 'ItemPrices(newPrices: $newPrices, usedPrices: $usedPrices, feeInfo: $feeInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ItemPrices &&
            (identical(other.newPrices, newPrices) ||
                const DeepCollectionEquality()
                    .equals(other.newPrices, newPrices)) &&
            (identical(other.usedPrices, usedPrices) ||
                const DeepCollectionEquality()
                    .equals(other.usedPrices, usedPrices)) &&
            (identical(other.feeInfo, feeInfo) ||
                const DeepCollectionEquality().equals(other.feeInfo, feeInfo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(newPrices) ^
      const DeepCollectionEquality().hash(usedPrices) ^
      const DeepCollectionEquality().hash(feeInfo);

  @override
  _$ItemPricesCopyWith<_ItemPrices> get copyWith =>
      __$ItemPricesCopyWithImpl<_ItemPrices>(this, _$identity);
}

abstract class _ItemPrices implements ItemPrices {
  const factory _ItemPrices(
      {@HiveField(0) List<PriceDetail> newPrices,
      @HiveField(1) List<PriceDetail> usedPrices,
      @required @HiveField(2) FeeInfo feeInfo}) = _$_ItemPrices;

  @override
  @HiveField(0)
  List<PriceDetail> get newPrices;
  @override
  @HiveField(1)
  List<PriceDetail> get usedPrices;
  @override
  @HiveField(2)
  FeeInfo get feeInfo;
  @override
  _$ItemPricesCopyWith<_ItemPrices> get copyWith;
}

/// @nodoc
class _$PriceDetailTearOff {
  const _$PriceDetailTearOff();

// ignore: unused_element
  _PriceDetail call(
      {@HiveField(0) ItemCondition itemCondition = ItemCondition.newItem,
      @HiveField(1) ItemSubCondition subCondition = ItemSubCondition.newItem,
      @HiveField(2) FulfillmentChannel channel = FulfillmentChannel.merchant,
      @HiveField(3) int price = 0,
      @HiveField(4) int shipping = 0,
      @HiveField(5) int point = 0}) {
    return _PriceDetail(
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
  @HiveField(0)
  ItemCondition get itemCondition;
  @HiveField(1)
  ItemSubCondition get subCondition;
  @HiveField(2)
  FulfillmentChannel get channel;
  @HiveField(3)
  int get price;
  @HiveField(4)
  int get shipping;
  @HiveField(5)
  int get point;

  $PriceDetailCopyWith<PriceDetail> get copyWith;
}

/// @nodoc
abstract class $PriceDetailCopyWith<$Res> {
  factory $PriceDetailCopyWith(
          PriceDetail value, $Res Function(PriceDetail) then) =
      _$PriceDetailCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) ItemCondition itemCondition,
      @HiveField(1) ItemSubCondition subCondition,
      @HiveField(2) FulfillmentChannel channel,
      @HiveField(3) int price,
      @HiveField(4) int shipping,
      @HiveField(5) int point});
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
          : itemCondition as ItemCondition,
      subCondition: subCondition == freezed
          ? _value.subCondition
          : subCondition as ItemSubCondition,
      channel:
          channel == freezed ? _value.channel : channel as FulfillmentChannel,
      price: price == freezed ? _value.price : price as int,
      shipping: shipping == freezed ? _value.shipping : shipping as int,
      point: point == freezed ? _value.point : point as int,
    ));
  }
}

/// @nodoc
abstract class _$PriceDetailCopyWith<$Res>
    implements $PriceDetailCopyWith<$Res> {
  factory _$PriceDetailCopyWith(
          _PriceDetail value, $Res Function(_PriceDetail) then) =
      __$PriceDetailCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) ItemCondition itemCondition,
      @HiveField(1) ItemSubCondition subCondition,
      @HiveField(2) FulfillmentChannel channel,
      @HiveField(3) int price,
      @HiveField(4) int shipping,
      @HiveField(5) int point});
}

/// @nodoc
class __$PriceDetailCopyWithImpl<$Res> extends _$PriceDetailCopyWithImpl<$Res>
    implements _$PriceDetailCopyWith<$Res> {
  __$PriceDetailCopyWithImpl(
      _PriceDetail _value, $Res Function(_PriceDetail) _then)
      : super(_value, (v) => _then(v as _PriceDetail));

  @override
  _PriceDetail get _value => super._value as _PriceDetail;

  @override
  $Res call({
    Object itemCondition = freezed,
    Object subCondition = freezed,
    Object channel = freezed,
    Object price = freezed,
    Object shipping = freezed,
    Object point = freezed,
  }) {
    return _then(_PriceDetail(
      itemCondition: itemCondition == freezed
          ? _value.itemCondition
          : itemCondition as ItemCondition,
      subCondition: subCondition == freezed
          ? _value.subCondition
          : subCondition as ItemSubCondition,
      channel:
          channel == freezed ? _value.channel : channel as FulfillmentChannel,
      price: price == freezed ? _value.price : price as int,
      shipping: shipping == freezed ? _value.shipping : shipping as int,
      point: point == freezed ? _value.point : point as int,
    ));
  }
}

@HiveType(typeId: priceDetailTypeId)

/// @nodoc
class _$_PriceDetail implements _PriceDetail {
  const _$_PriceDetail(
      {@HiveField(0) this.itemCondition = ItemCondition.newItem,
      @HiveField(1) this.subCondition = ItemSubCondition.newItem,
      @HiveField(2) this.channel = FulfillmentChannel.merchant,
      @HiveField(3) this.price = 0,
      @HiveField(4) this.shipping = 0,
      @HiveField(5) this.point = 0})
      : assert(itemCondition != null),
        assert(subCondition != null),
        assert(channel != null),
        assert(price != null),
        assert(shipping != null),
        assert(point != null);

  @JsonKey(defaultValue: ItemCondition.newItem)
  @override
  @HiveField(0)
  final ItemCondition itemCondition;
  @JsonKey(defaultValue: ItemSubCondition.newItem)
  @override
  @HiveField(1)
  final ItemSubCondition subCondition;
  @JsonKey(defaultValue: FulfillmentChannel.merchant)
  @override
  @HiveField(2)
  final FulfillmentChannel channel;
  @JsonKey(defaultValue: 0)
  @override
  @HiveField(3)
  final int price;
  @JsonKey(defaultValue: 0)
  @override
  @HiveField(4)
  final int shipping;
  @JsonKey(defaultValue: 0)
  @override
  @HiveField(5)
  final int point;

  @override
  String toString() {
    return 'PriceDetail(itemCondition: $itemCondition, subCondition: $subCondition, channel: $channel, price: $price, shipping: $shipping, point: $point)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PriceDetail &&
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
  _$PriceDetailCopyWith<_PriceDetail> get copyWith =>
      __$PriceDetailCopyWithImpl<_PriceDetail>(this, _$identity);
}

abstract class _PriceDetail implements PriceDetail {
  const factory _PriceDetail(
      {@HiveField(0) ItemCondition itemCondition,
      @HiveField(1) ItemSubCondition subCondition,
      @HiveField(2) FulfillmentChannel channel,
      @HiveField(3) int price,
      @HiveField(4) int shipping,
      @HiveField(5) int point}) = _$_PriceDetail;

  @override
  @HiveField(0)
  ItemCondition get itemCondition;
  @override
  @HiveField(1)
  ItemSubCondition get subCondition;
  @override
  @HiveField(2)
  FulfillmentChannel get channel;
  @override
  @HiveField(3)
  int get price;
  @override
  @HiveField(4)
  int get shipping;
  @override
  @HiveField(5)
  int get point;
  @override
  _$PriceDetailCopyWith<_PriceDetail> get copyWith;
}
