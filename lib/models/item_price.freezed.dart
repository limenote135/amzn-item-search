// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'item_price.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ItemPrices _$ItemPricesFromJson(Map<String, dynamic> json) {
  return _ItemPrices.fromJson(json);
}

/// @nodoc
class _$ItemPricesTearOff {
  const _$ItemPricesTearOff();

  _ItemPrices call(
      {@HiveField(0)
      @JsonKey(name: "new_offers")
          required List<PriceDetail> newPrices,
      @HiveField(1)
      @JsonKey(name: "used_offers")
          required List<PriceDetail> usedPrices,
      @HiveField(2)
          required FeeInfo feeInfo}) {
    return _ItemPrices(
      newPrices: newPrices,
      usedPrices: usedPrices,
      feeInfo: feeInfo,
    );
  }

  ItemPrices fromJson(Map<String, Object> json) {
    return ItemPrices.fromJson(json);
  }
}

/// @nodoc
const $ItemPrices = _$ItemPricesTearOff();

/// @nodoc
mixin _$ItemPrices {
  @HiveField(0)
  @JsonKey(name: "new_offers")
  List<PriceDetail> get newPrices => throw _privateConstructorUsedError;
  @HiveField(1)
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
      {@HiveField(0) @JsonKey(name: "new_offers") List<PriceDetail> newPrices,
      @HiveField(1) @JsonKey(name: "used_offers") List<PriceDetail> usedPrices,
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
      {@HiveField(0) @JsonKey(name: "new_offers") List<PriceDetail> newPrices,
      @HiveField(1) @JsonKey(name: "used_offers") List<PriceDetail> usedPrices,
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

@JsonSerializable(fieldRename: FieldRename.snake)
@HiveType(typeId: itemPricesTypeId)

/// @nodoc
class _$_ItemPrices with DiagnosticableTreeMixin implements _ItemPrices {
  const _$_ItemPrices(
      {@HiveField(0) @JsonKey(name: "new_offers") required this.newPrices,
      @HiveField(1) @JsonKey(name: "used_offers") required this.usedPrices,
      @HiveField(2) required this.feeInfo});

  factory _$_ItemPrices.fromJson(Map<String, dynamic> json) =>
      _$_$_ItemPricesFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: "new_offers")
  final List<PriceDetail> newPrices;
  @override
  @HiveField(1)
  @JsonKey(name: "used_offers")
  final List<PriceDetail> usedPrices;
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

  @JsonKey(ignore: true)
  @override
  _$ItemPricesCopyWith<_ItemPrices> get copyWith =>
      __$ItemPricesCopyWithImpl<_ItemPrices>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ItemPricesToJson(this);
  }
}

abstract class _ItemPrices implements ItemPrices {
  const factory _ItemPrices(
      {@HiveField(0)
      @JsonKey(name: "new_offers")
          required List<PriceDetail> newPrices,
      @HiveField(1)
      @JsonKey(name: "used_offers")
          required List<PriceDetail> usedPrices,
      @HiveField(2)
          required FeeInfo feeInfo}) = _$_ItemPrices;

  factory _ItemPrices.fromJson(Map<String, dynamic> json) =
      _$_ItemPrices.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: "new_offers")
  List<PriceDetail> get newPrices => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  @JsonKey(name: "used_offers")
  List<PriceDetail> get usedPrices => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  FeeInfo get feeInfo => throw _privateConstructorUsedError;
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
      @ItemConditionConverter()
          ItemCondition itemCondition = ItemCondition.newItem,
      @HiveField(1)
      @ItemSubConditionConverter()
          ItemSubCondition subCondition = ItemSubCondition.newItem,
      @HiveField(2)
      @FulfillmentChannelConverter()
          FulfillmentChannel channel = FulfillmentChannel.merchant,
      @HiveField(3)
          int price = 0,
      @HiveField(4)
          int shipping = 0,
      @HiveField(5)
          int point = 0}) {
    return _PriceDetail(
      itemCondition: itemCondition,
      subCondition: subCondition,
      channel: channel,
      price: price,
      shipping: shipping,
      point: point,
    );
  }

  PriceDetail fromJson(Map<String, Object> json) {
    return PriceDetail.fromJson(json);
  }
}

/// @nodoc
const $PriceDetail = _$PriceDetailTearOff();

/// @nodoc
mixin _$PriceDetail {
  @HiveField(0)
  @JsonKey(name: "condition")
  @ItemConditionConverter()
  ItemCondition get itemCondition => throw _privateConstructorUsedError;
  @HiveField(1)
  @ItemSubConditionConverter()
  ItemSubCondition get subCondition => throw _privateConstructorUsedError;
  @HiveField(2)
  @FulfillmentChannelConverter()
  FulfillmentChannel get channel => throw _privateConstructorUsedError;
  @HiveField(3)
  int get price => throw _privateConstructorUsedError;
  @HiveField(4)
  int get shipping => throw _privateConstructorUsedError;
  @HiveField(5)
  int get point => throw _privateConstructorUsedError;

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
      {@HiveField(0)
      @JsonKey(name: "condition")
      @ItemConditionConverter()
          ItemCondition itemCondition,
      @HiveField(1)
      @ItemSubConditionConverter()
          ItemSubCondition subCondition,
      @HiveField(2)
      @FulfillmentChannelConverter()
          FulfillmentChannel channel,
      @HiveField(3)
          int price,
      @HiveField(4)
          int shipping,
      @HiveField(5)
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
    Object? itemCondition = freezed,
    Object? subCondition = freezed,
    Object? channel = freezed,
    Object? price = freezed,
    Object? shipping = freezed,
    Object? point = freezed,
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
      {@HiveField(0)
      @JsonKey(name: "condition")
      @ItemConditionConverter()
          ItemCondition itemCondition,
      @HiveField(1)
      @ItemSubConditionConverter()
          ItemSubCondition subCondition,
      @HiveField(2)
      @FulfillmentChannelConverter()
          FulfillmentChannel channel,
      @HiveField(3)
          int price,
      @HiveField(4)
          int shipping,
      @HiveField(5)
          int point});
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
    ));
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
@HiveType(typeId: priceDetailTypeId)

/// @nodoc
class _$_PriceDetail with DiagnosticableTreeMixin implements _PriceDetail {
  const _$_PriceDetail(
      {@HiveField(0)
      @JsonKey(name: "condition")
      @ItemConditionConverter()
          this.itemCondition = ItemCondition.newItem,
      @HiveField(1)
      @ItemSubConditionConverter()
          this.subCondition = ItemSubCondition.newItem,
      @HiveField(2)
      @FulfillmentChannelConverter()
          this.channel = FulfillmentChannel.merchant,
      @HiveField(3)
          this.price = 0,
      @HiveField(4)
          this.shipping = 0,
      @HiveField(5)
          this.point = 0});

  factory _$_PriceDetail.fromJson(Map<String, dynamic> json) =>
      _$_$_PriceDetailFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: "condition")
  @ItemConditionConverter()
  final ItemCondition itemCondition;
  @JsonKey(defaultValue: ItemSubCondition.newItem)
  @override
  @HiveField(1)
  @ItemSubConditionConverter()
  final ItemSubCondition subCondition;
  @JsonKey(defaultValue: FulfillmentChannel.merchant)
  @override
  @HiveField(2)
  @FulfillmentChannelConverter()
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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PriceDetail(itemCondition: $itemCondition, subCondition: $subCondition, channel: $channel, price: $price, shipping: $shipping, point: $point)';
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
      ..add(DiagnosticsProperty('point', point));
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

  @JsonKey(ignore: true)
  @override
  _$PriceDetailCopyWith<_PriceDetail> get copyWith =>
      __$PriceDetailCopyWithImpl<_PriceDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PriceDetailToJson(this);
  }
}

abstract class _PriceDetail implements PriceDetail {
  const factory _PriceDetail(
      {@HiveField(0)
      @JsonKey(name: "condition")
      @ItemConditionConverter()
          ItemCondition itemCondition,
      @HiveField(1)
      @ItemSubConditionConverter()
          ItemSubCondition subCondition,
      @HiveField(2)
      @FulfillmentChannelConverter()
          FulfillmentChannel channel,
      @HiveField(3)
          int price,
      @HiveField(4)
          int shipping,
      @HiveField(5)
          int point}) = _$_PriceDetail;

  factory _PriceDetail.fromJson(Map<String, dynamic> json) =
      _$_PriceDetail.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: "condition")
  @ItemConditionConverter()
  ItemCondition get itemCondition => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  @ItemSubConditionConverter()
  ItemSubCondition get subCondition => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  @FulfillmentChannelConverter()
  FulfillmentChannel get channel => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  int get price => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  int get shipping => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  int get point => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PriceDetailCopyWith<_PriceDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
