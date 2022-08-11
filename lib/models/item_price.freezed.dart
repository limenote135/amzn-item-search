// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'item_price.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ItemPriceFutureProviderResponseTearOff {
  const _$ItemPriceFutureProviderResponseTearOff();

  _ItemPriceFutureProviderResponse call(
      {required ItemPrices prices, required bool? sellByAmazon}) {
    return _ItemPriceFutureProviderResponse(
      prices: prices,
      sellByAmazon: sellByAmazon,
    );
  }
}

/// @nodoc
const $ItemPriceFutureProviderResponse =
    _$ItemPriceFutureProviderResponseTearOff();

/// @nodoc
mixin _$ItemPriceFutureProviderResponse {
  ItemPrices get prices => throw _privateConstructorUsedError;
  bool? get sellByAmazon => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ItemPriceFutureProviderResponseCopyWith<ItemPriceFutureProviderResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemPriceFutureProviderResponseCopyWith<$Res> {
  factory $ItemPriceFutureProviderResponseCopyWith(
          ItemPriceFutureProviderResponse value,
          $Res Function(ItemPriceFutureProviderResponse) then) =
      _$ItemPriceFutureProviderResponseCopyWithImpl<$Res>;
  $Res call({ItemPrices prices, bool? sellByAmazon});

  $ItemPricesCopyWith<$Res> get prices;
}

/// @nodoc
class _$ItemPriceFutureProviderResponseCopyWithImpl<$Res>
    implements $ItemPriceFutureProviderResponseCopyWith<$Res> {
  _$ItemPriceFutureProviderResponseCopyWithImpl(this._value, this._then);

  final ItemPriceFutureProviderResponse _value;
  // ignore: unused_field
  final $Res Function(ItemPriceFutureProviderResponse) _then;

  @override
  $Res call({
    Object? prices = freezed,
    Object? sellByAmazon = freezed,
  }) {
    return _then(_value.copyWith(
      prices: prices == freezed
          ? _value.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as ItemPrices,
      sellByAmazon: sellByAmazon == freezed
          ? _value.sellByAmazon
          : sellByAmazon // ignore: cast_nullable_to_non_nullable
              as bool?,
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
abstract class _$ItemPriceFutureProviderResponseCopyWith<$Res>
    implements $ItemPriceFutureProviderResponseCopyWith<$Res> {
  factory _$ItemPriceFutureProviderResponseCopyWith(
          _ItemPriceFutureProviderResponse value,
          $Res Function(_ItemPriceFutureProviderResponse) then) =
      __$ItemPriceFutureProviderResponseCopyWithImpl<$Res>;
  @override
  $Res call({ItemPrices prices, bool? sellByAmazon});

  @override
  $ItemPricesCopyWith<$Res> get prices;
}

/// @nodoc
class __$ItemPriceFutureProviderResponseCopyWithImpl<$Res>
    extends _$ItemPriceFutureProviderResponseCopyWithImpl<$Res>
    implements _$ItemPriceFutureProviderResponseCopyWith<$Res> {
  __$ItemPriceFutureProviderResponseCopyWithImpl(
      _ItemPriceFutureProviderResponse _value,
      $Res Function(_ItemPriceFutureProviderResponse) _then)
      : super(_value, (v) => _then(v as _ItemPriceFutureProviderResponse));

  @override
  _ItemPriceFutureProviderResponse get _value =>
      super._value as _ItemPriceFutureProviderResponse;

  @override
  $Res call({
    Object? prices = freezed,
    Object? sellByAmazon = freezed,
  }) {
    return _then(_ItemPriceFutureProviderResponse(
      prices: prices == freezed
          ? _value.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as ItemPrices,
      sellByAmazon: sellByAmazon == freezed
          ? _value.sellByAmazon
          : sellByAmazon // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_ItemPriceFutureProviderResponse
    with DiagnosticableTreeMixin
    implements _ItemPriceFutureProviderResponse {
  const _$_ItemPriceFutureProviderResponse(
      {required this.prices, required this.sellByAmazon});

  @override
  final ItemPrices prices;
  @override
  final bool? sellByAmazon;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ItemPriceFutureProviderResponse(prices: $prices, sellByAmazon: $sellByAmazon)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ItemPriceFutureProviderResponse'))
      ..add(DiagnosticsProperty('prices', prices))
      ..add(DiagnosticsProperty('sellByAmazon', sellByAmazon));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ItemPriceFutureProviderResponse &&
            const DeepCollectionEquality().equals(other.prices, prices) &&
            const DeepCollectionEquality()
                .equals(other.sellByAmazon, sellByAmazon));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(prices),
      const DeepCollectionEquality().hash(sellByAmazon));

  @JsonKey(ignore: true)
  @override
  _$ItemPriceFutureProviderResponseCopyWith<_ItemPriceFutureProviderResponse>
      get copyWith => __$ItemPriceFutureProviderResponseCopyWithImpl<
          _ItemPriceFutureProviderResponse>(this, _$identity);
}

abstract class _ItemPriceFutureProviderResponse
    implements ItemPriceFutureProviderResponse {
  const factory _ItemPriceFutureProviderResponse(
      {required ItemPrices prices,
      required bool? sellByAmazon}) = _$_ItemPriceFutureProviderResponse;

  @override
  ItemPrices get prices;
  @override
  bool? get sellByAmazon;
  @override
  @JsonKey(ignore: true)
  _$ItemPriceFutureProviderResponseCopyWith<_ItemPriceFutureProviderResponse>
      get copyWith => throw _privateConstructorUsedError;
}

ItemPrices _$ItemPricesFromJson(Map<String, dynamic> json) {
  return _ItemPrices.fromJson(json);
}

/// @nodoc
class _$ItemPricesTearOff {
  const _$ItemPricesTearOff();

  _ItemPrices call(
      {@HiveField(0, defaultValue: <PriceDetail>[])
      @JsonKey(name: "new_offers")
          List<PriceDetail> newPrices = const <PriceDetail>[],
      @HiveField(1, defaultValue: <PriceDetail>[])
      @JsonKey(name: "used_offers")
          List<PriceDetail> usedPrices = const <PriceDetail>[],
      @HiveField(2)
          FeeInfo feeInfo = const FeeInfo()}) {
    return _ItemPrices(
      newPrices: newPrices,
      usedPrices: usedPrices,
      feeInfo: feeInfo,
    );
  }

  ItemPrices fromJson(Map<String, Object?> json) {
    return ItemPrices.fromJson(json);
  }
}

/// @nodoc
const $ItemPrices = _$ItemPricesTearOff();

/// @nodoc
mixin _$ItemPrices {
// 初期のころのデータで null で保存されている場合がある？ため、デフォルト値設定
  @HiveField(0, defaultValue: <PriceDetail>[])
  @JsonKey(name: "new_offers")
  List<PriceDetail> get newPrices => throw _privateConstructorUsedError;
  @HiveField(1, defaultValue: <PriceDetail>[])
  @JsonKey(name: "used_offers")
  List<PriceDetail> get usedPrices => throw _privateConstructorUsedError;
  @HiveField(2)
  FeeInfo get feeInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemPricesCopyWith<ItemPrices> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemPricesCopyWith<$Res> {
  factory $ItemPricesCopyWith(
          ItemPrices value, $Res Function(ItemPrices) then) =
      _$ItemPricesCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0, defaultValue: <PriceDetail>[])
      @JsonKey(name: "new_offers")
          List<PriceDetail> newPrices,
      @HiveField(1, defaultValue: <PriceDetail>[])
      @JsonKey(name: "used_offers")
          List<PriceDetail> usedPrices,
      @HiveField(2)
          FeeInfo feeInfo});

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
    Object? newPrices = freezed,
    Object? usedPrices = freezed,
    Object? feeInfo = freezed,
  }) {
    return _then(_value.copyWith(
      newPrices: newPrices == freezed
          ? _value.newPrices
          : newPrices // ignore: cast_nullable_to_non_nullable
              as List<PriceDetail>,
      usedPrices: usedPrices == freezed
          ? _value.usedPrices
          : usedPrices // ignore: cast_nullable_to_non_nullable
              as List<PriceDetail>,
      feeInfo: feeInfo == freezed
          ? _value.feeInfo
          : feeInfo // ignore: cast_nullable_to_non_nullable
              as FeeInfo,
    ));
  }

  @override
  $FeeInfoCopyWith<$Res> get feeInfo {
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
      {@HiveField(0, defaultValue: <PriceDetail>[])
      @JsonKey(name: "new_offers")
          List<PriceDetail> newPrices,
      @HiveField(1, defaultValue: <PriceDetail>[])
      @JsonKey(name: "used_offers")
          List<PriceDetail> usedPrices,
      @HiveField(2)
          FeeInfo feeInfo});

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
    Object? newPrices = freezed,
    Object? usedPrices = freezed,
    Object? feeInfo = freezed,
  }) {
    return _then(_ItemPrices(
      newPrices: newPrices == freezed
          ? _value.newPrices
          : newPrices // ignore: cast_nullable_to_non_nullable
              as List<PriceDetail>,
      usedPrices: usedPrices == freezed
          ? _value.usedPrices
          : usedPrices // ignore: cast_nullable_to_non_nullable
              as List<PriceDetail>,
      feeInfo: feeInfo == freezed
          ? _value.feeInfo
          : feeInfo // ignore: cast_nullable_to_non_nullable
              as FeeInfo,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
@HiveType(typeId: itemPricesTypeId)
class _$_ItemPrices with DiagnosticableTreeMixin implements _ItemPrices {
  const _$_ItemPrices(
      {@HiveField(0, defaultValue: <PriceDetail>[])
      @JsonKey(name: "new_offers")
          this.newPrices = const <PriceDetail>[],
      @HiveField(1, defaultValue: <PriceDetail>[])
      @JsonKey(name: "used_offers")
          this.usedPrices = const <PriceDetail>[],
      @HiveField(2)
          this.feeInfo = const FeeInfo()});

  factory _$_ItemPrices.fromJson(Map<String, dynamic> json) =>
      _$$_ItemPricesFromJson(json);

  @override // 初期のころのデータで null で保存されている場合がある？ため、デフォルト値設定
  @HiveField(0, defaultValue: <PriceDetail>[])
  @JsonKey(name: "new_offers")
  final List<PriceDetail> newPrices;
  @override
  @HiveField(1, defaultValue: <PriceDetail>[])
  @JsonKey(name: "used_offers")
  final List<PriceDetail> usedPrices;
  @JsonKey()
  @override
  @HiveField(2)
  final FeeInfo feeInfo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ItemPrices(newPrices: $newPrices, usedPrices: $usedPrices, feeInfo: $feeInfo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ItemPrices'))
      ..add(DiagnosticsProperty('newPrices', newPrices))
      ..add(DiagnosticsProperty('usedPrices', usedPrices))
      ..add(DiagnosticsProperty('feeInfo', feeInfo));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ItemPrices &&
            const DeepCollectionEquality().equals(other.newPrices, newPrices) &&
            const DeepCollectionEquality()
                .equals(other.usedPrices, usedPrices) &&
            const DeepCollectionEquality().equals(other.feeInfo, feeInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(newPrices),
      const DeepCollectionEquality().hash(usedPrices),
      const DeepCollectionEquality().hash(feeInfo));

  @JsonKey(ignore: true)
  @override
  _$ItemPricesCopyWith<_ItemPrices> get copyWith =>
      __$ItemPricesCopyWithImpl<_ItemPrices>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemPricesToJson(this);
  }
}

abstract class _ItemPrices implements ItemPrices {
  const factory _ItemPrices(
      {@HiveField(0, defaultValue: <PriceDetail>[])
      @JsonKey(name: "new_offers")
          List<PriceDetail> newPrices,
      @HiveField(1, defaultValue: <PriceDetail>[])
      @JsonKey(name: "used_offers")
          List<PriceDetail> usedPrices,
      @HiveField(2)
          FeeInfo feeInfo}) = _$_ItemPrices;

  factory _ItemPrices.fromJson(Map<String, dynamic> json) =
      _$_ItemPrices.fromJson;

  @override // 初期のころのデータで null で保存されている場合がある？ため、デフォルト値設定
  @HiveField(0, defaultValue: <PriceDetail>[])
  @JsonKey(name: "new_offers")
  List<PriceDetail> get newPrices;
  @override
  @HiveField(1, defaultValue: <PriceDetail>[])
  @JsonKey(name: "used_offers")
  List<PriceDetail> get usedPrices;
  @override
  @HiveField(2)
  FeeInfo get feeInfo;
  @override
  @JsonKey(ignore: true)
  _$ItemPricesCopyWith<_ItemPrices> get copyWith =>
      throw _privateConstructorUsedError;
}

PriceDetail _$PriceDetailFromJson(Map<String, dynamic> json) {
  return _PriceDetail.fromJson(json);
}

/// @nodoc
class _$PriceDetailTearOff {
  const _$PriceDetailTearOff();

  _PriceDetail call(
      {@HiveField(0)
      @JsonKey(name: "condition")
          ItemCondition itemCondition = ItemCondition.newItem,
      @HiveField(1)
          ItemSubCondition subCondition = ItemSubCondition.newItem,
      @HiveField(2)
          FulfillmentChannel channel = FulfillmentChannel.merchant,
      @HiveField(3)
          int price = 0,
      @HiveField(4)
          int shipping = 0,
      @HiveField(5)
          int point = 0,
      @HiveField(6, defaultValue: false)
          bool isCart = false}) {
    return _PriceDetail(
      itemCondition: itemCondition,
      subCondition: subCondition,
      channel: channel,
      price: price,
      shipping: shipping,
      point: point,
      isCart: isCart,
    );
  }

  PriceDetail fromJson(Map<String, Object?> json) {
    return PriceDetail.fromJson(json);
  }
}

/// @nodoc
const $PriceDetail = _$PriceDetailTearOff();

/// @nodoc
mixin _$PriceDetail {
  @HiveField(0)
  @JsonKey(name: "condition")
  ItemCondition get itemCondition => throw _privateConstructorUsedError;
  @HiveField(1)
  ItemSubCondition get subCondition => throw _privateConstructorUsedError;
  @HiveField(2)
  FulfillmentChannel get channel => throw _privateConstructorUsedError;
  @HiveField(3)
  int get price => throw _privateConstructorUsedError;
  @HiveField(4)
  int get shipping => throw _privateConstructorUsedError;
  @HiveField(5)
  int get point => throw _privateConstructorUsedError;
  @HiveField(6, defaultValue: false)
  bool get isCart => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceDetailCopyWith<PriceDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceDetailCopyWith<$Res> {
  factory $PriceDetailCopyWith(
          PriceDetail value, $Res Function(PriceDetail) then) =
      _$PriceDetailCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) @JsonKey(name: "condition") ItemCondition itemCondition,
      @HiveField(1) ItemSubCondition subCondition,
      @HiveField(2) FulfillmentChannel channel,
      @HiveField(3) int price,
      @HiveField(4) int shipping,
      @HiveField(5) int point,
      @HiveField(6, defaultValue: false) bool isCart});
}

/// @nodoc
class _$PriceDetailCopyWithImpl<$Res> implements $PriceDetailCopyWith<$Res> {
  _$PriceDetailCopyWithImpl(this._value, this._then);

  final PriceDetail _value;
  // ignore: unused_field
  final $Res Function(PriceDetail) _then;

  @override
  $Res call({
    Object? itemCondition = freezed,
    Object? subCondition = freezed,
    Object? channel = freezed,
    Object? price = freezed,
    Object? shipping = freezed,
    Object? point = freezed,
    Object? isCart = freezed,
  }) {
    return _then(_value.copyWith(
      itemCondition: itemCondition == freezed
          ? _value.itemCondition
          : itemCondition // ignore: cast_nullable_to_non_nullable
              as ItemCondition,
      subCondition: subCondition == freezed
          ? _value.subCondition
          : subCondition // ignore: cast_nullable_to_non_nullable
              as ItemSubCondition,
      channel: channel == freezed
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as FulfillmentChannel,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      shipping: shipping == freezed
          ? _value.shipping
          : shipping // ignore: cast_nullable_to_non_nullable
              as int,
      point: point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      isCart: isCart == freezed
          ? _value.isCart
          : isCart // ignore: cast_nullable_to_non_nullable
              as bool,
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
      {@HiveField(0) @JsonKey(name: "condition") ItemCondition itemCondition,
      @HiveField(1) ItemSubCondition subCondition,
      @HiveField(2) FulfillmentChannel channel,
      @HiveField(3) int price,
      @HiveField(4) int shipping,
      @HiveField(5) int point,
      @HiveField(6, defaultValue: false) bool isCart});
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
    Object? itemCondition = freezed,
    Object? subCondition = freezed,
    Object? channel = freezed,
    Object? price = freezed,
    Object? shipping = freezed,
    Object? point = freezed,
    Object? isCart = freezed,
  }) {
    return _then(_PriceDetail(
      itemCondition: itemCondition == freezed
          ? _value.itemCondition
          : itemCondition // ignore: cast_nullable_to_non_nullable
              as ItemCondition,
      subCondition: subCondition == freezed
          ? _value.subCondition
          : subCondition // ignore: cast_nullable_to_non_nullable
              as ItemSubCondition,
      channel: channel == freezed
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as FulfillmentChannel,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      shipping: shipping == freezed
          ? _value.shipping
          : shipping // ignore: cast_nullable_to_non_nullable
              as int,
      point: point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      isCart: isCart == freezed
          ? _value.isCart
          : isCart // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, converters: [
  ItemConditionConverter(),
  ItemSubConditionConverter(),
  FulfillmentChannelConverter()
])
@HiveType(typeId: priceDetailTypeId)
class _$_PriceDetail with DiagnosticableTreeMixin implements _PriceDetail {
  const _$_PriceDetail(
      {@HiveField(0)
      @JsonKey(name: "condition")
          this.itemCondition = ItemCondition.newItem,
      @HiveField(1)
          this.subCondition = ItemSubCondition.newItem,
      @HiveField(2)
          this.channel = FulfillmentChannel.merchant,
      @HiveField(3)
          this.price = 0,
      @HiveField(4)
          this.shipping = 0,
      @HiveField(5)
          this.point = 0,
      @HiveField(6, defaultValue: false)
          this.isCart = false});

  factory _$_PriceDetail.fromJson(Map<String, dynamic> json) =>
      _$$_PriceDetailFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: "condition")
  final ItemCondition itemCondition;
  @JsonKey()
  @override
  @HiveField(1)
  final ItemSubCondition subCondition;
  @JsonKey()
  @override
  @HiveField(2)
  final FulfillmentChannel channel;
  @JsonKey()
  @override
  @HiveField(3)
  final int price;
  @JsonKey()
  @override
  @HiveField(4)
  final int shipping;
  @JsonKey()
  @override
  @HiveField(5)
  final int point;
  @JsonKey()
  @override
  @HiveField(6, defaultValue: false)
  final bool isCart;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PriceDetail(itemCondition: $itemCondition, subCondition: $subCondition, channel: $channel, price: $price, shipping: $shipping, point: $point, isCart: $isCart)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PriceDetail'))
      ..add(DiagnosticsProperty('itemCondition', itemCondition))
      ..add(DiagnosticsProperty('subCondition', subCondition))
      ..add(DiagnosticsProperty('channel', channel))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('shipping', shipping))
      ..add(DiagnosticsProperty('point', point))
      ..add(DiagnosticsProperty('isCart', isCart));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PriceDetail &&
            const DeepCollectionEquality()
                .equals(other.itemCondition, itemCondition) &&
            const DeepCollectionEquality()
                .equals(other.subCondition, subCondition) &&
            const DeepCollectionEquality().equals(other.channel, channel) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.shipping, shipping) &&
            const DeepCollectionEquality().equals(other.point, point) &&
            const DeepCollectionEquality().equals(other.isCart, isCart));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(itemCondition),
      const DeepCollectionEquality().hash(subCondition),
      const DeepCollectionEquality().hash(channel),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(shipping),
      const DeepCollectionEquality().hash(point),
      const DeepCollectionEquality().hash(isCart));

  @JsonKey(ignore: true)
  @override
  _$PriceDetailCopyWith<_PriceDetail> get copyWith =>
      __$PriceDetailCopyWithImpl<_PriceDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PriceDetailToJson(this);
  }
}

abstract class _PriceDetail implements PriceDetail {
  const factory _PriceDetail(
      {@HiveField(0) @JsonKey(name: "condition") ItemCondition itemCondition,
      @HiveField(1) ItemSubCondition subCondition,
      @HiveField(2) FulfillmentChannel channel,
      @HiveField(3) int price,
      @HiveField(4) int shipping,
      @HiveField(5) int point,
      @HiveField(6, defaultValue: false) bool isCart}) = _$_PriceDetail;

  factory _PriceDetail.fromJson(Map<String, dynamic> json) =
      _$_PriceDetail.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: "condition")
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
  @HiveField(6, defaultValue: false)
  bool get isCart;
  @override
  @JsonKey(ignore: true)
  _$PriceDetailCopyWith<_PriceDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
