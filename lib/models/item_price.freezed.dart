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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ItemPrices _$ItemPricesFromJson(Map<String, dynamic> json) {
  return _ItemPrices.fromJson(json);
}

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
      _$ItemPricesCopyWithImpl<$Res, ItemPrices>;
  @useResult
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
class _$ItemPricesCopyWithImpl<$Res, $Val extends ItemPrices>
    implements $ItemPricesCopyWith<$Res> {
  _$ItemPricesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newPrices = null,
    Object? usedPrices = null,
    Object? feeInfo = null,
  }) {
    return _then(_value.copyWith(
      newPrices: null == newPrices
          ? _value.newPrices
          : newPrices // ignore: cast_nullable_to_non_nullable
              as List<PriceDetail>,
      usedPrices: null == usedPrices
          ? _value.usedPrices
          : usedPrices // ignore: cast_nullable_to_non_nullable
              as List<PriceDetail>,
      feeInfo: null == feeInfo
          ? _value.feeInfo
          : feeInfo // ignore: cast_nullable_to_non_nullable
              as FeeInfo,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FeeInfoCopyWith<$Res> get feeInfo {
    return $FeeInfoCopyWith<$Res>(_value.feeInfo, (value) {
      return _then(_value.copyWith(feeInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ItemPricesCopyWith<$Res>
    implements $ItemPricesCopyWith<$Res> {
  factory _$$_ItemPricesCopyWith(
          _$_ItemPrices value, $Res Function(_$_ItemPrices) then) =
      __$$_ItemPricesCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$_ItemPricesCopyWithImpl<$Res>
    extends _$ItemPricesCopyWithImpl<$Res, _$_ItemPrices>
    implements _$$_ItemPricesCopyWith<$Res> {
  __$$_ItemPricesCopyWithImpl(
      _$_ItemPrices _value, $Res Function(_$_ItemPrices) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newPrices = null,
    Object? usedPrices = null,
    Object? feeInfo = null,
  }) {
    return _then(_$_ItemPrices(
      newPrices: null == newPrices
          ? _value._newPrices
          : newPrices // ignore: cast_nullable_to_non_nullable
              as List<PriceDetail>,
      usedPrices: null == usedPrices
          ? _value._usedPrices
          : usedPrices // ignore: cast_nullable_to_non_nullable
              as List<PriceDetail>,
      feeInfo: null == feeInfo
          ? _value.feeInfo
          : feeInfo // ignore: cast_nullable_to_non_nullable
              as FeeInfo,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
@HiveType(typeId: itemPricesTypeId)
class _$_ItemPrices implements _ItemPrices {
  const _$_ItemPrices(
      {@HiveField(0, defaultValue: <PriceDetail>[])
      @JsonKey(name: "new_offers")
          final List<PriceDetail> newPrices = const <PriceDetail>[],
      @HiveField(1, defaultValue: <PriceDetail>[])
      @JsonKey(name: "used_offers")
          final List<PriceDetail> usedPrices = const <PriceDetail>[],
      @HiveField(2)
          this.feeInfo = const FeeInfo()})
      : _newPrices = newPrices,
        _usedPrices = usedPrices;

  factory _$_ItemPrices.fromJson(Map<String, dynamic> json) =>
      _$$_ItemPricesFromJson(json);

// 初期のころのデータで null で保存されている場合がある？ため、デフォルト値設定
  final List<PriceDetail> _newPrices;
// 初期のころのデータで null で保存されている場合がある？ため、デフォルト値設定
  @override
  @HiveField(0, defaultValue: <PriceDetail>[])
  @JsonKey(name: "new_offers")
  List<PriceDetail> get newPrices {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newPrices);
  }

  final List<PriceDetail> _usedPrices;
  @override
  @HiveField(1, defaultValue: <PriceDetail>[])
  @JsonKey(name: "used_offers")
  List<PriceDetail> get usedPrices {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_usedPrices);
  }

  @override
  @JsonKey()
  @HiveField(2)
  final FeeInfo feeInfo;

  @override
  String toString() {
    return 'ItemPrices(newPrices: $newPrices, usedPrices: $usedPrices, feeInfo: $feeInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemPrices &&
            const DeepCollectionEquality()
                .equals(other._newPrices, _newPrices) &&
            const DeepCollectionEquality()
                .equals(other._usedPrices, _usedPrices) &&
            (identical(other.feeInfo, feeInfo) || other.feeInfo == feeInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_newPrices),
      const DeepCollectionEquality().hash(_usedPrices),
      feeInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ItemPricesCopyWith<_$_ItemPrices> get copyWith =>
      __$$_ItemPricesCopyWithImpl<_$_ItemPrices>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemPricesToJson(
      this,
    );
  }
}

abstract class _ItemPrices implements ItemPrices {
  const factory _ItemPrices(
      {@HiveField(0, defaultValue: <PriceDetail>[])
      @JsonKey(name: "new_offers")
          final List<PriceDetail> newPrices,
      @HiveField(1, defaultValue: <PriceDetail>[])
      @JsonKey(name: "used_offers")
          final List<PriceDetail> usedPrices,
      @HiveField(2)
          final FeeInfo feeInfo}) = _$_ItemPrices;

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
  _$$_ItemPricesCopyWith<_$_ItemPrices> get copyWith =>
      throw _privateConstructorUsedError;
}

PriceDetail _$PriceDetailFromJson(Map<String, dynamic> json) {
  return _PriceDetail.fromJson(json);
}

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
      _$PriceDetailCopyWithImpl<$Res, PriceDetail>;
  @useResult
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
class _$PriceDetailCopyWithImpl<$Res, $Val extends PriceDetail>
    implements $PriceDetailCopyWith<$Res> {
  _$PriceDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemCondition = null,
    Object? subCondition = null,
    Object? channel = null,
    Object? price = null,
    Object? shipping = null,
    Object? point = null,
    Object? isCart = null,
  }) {
    return _then(_value.copyWith(
      itemCondition: null == itemCondition
          ? _value.itemCondition
          : itemCondition // ignore: cast_nullable_to_non_nullable
              as ItemCondition,
      subCondition: null == subCondition
          ? _value.subCondition
          : subCondition // ignore: cast_nullable_to_non_nullable
              as ItemSubCondition,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as FulfillmentChannel,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      shipping: null == shipping
          ? _value.shipping
          : shipping // ignore: cast_nullable_to_non_nullable
              as int,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      isCart: null == isCart
          ? _value.isCart
          : isCart // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PriceDetailCopyWith<$Res>
    implements $PriceDetailCopyWith<$Res> {
  factory _$$_PriceDetailCopyWith(
          _$_PriceDetail value, $Res Function(_$_PriceDetail) then) =
      __$$_PriceDetailCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$_PriceDetailCopyWithImpl<$Res>
    extends _$PriceDetailCopyWithImpl<$Res, _$_PriceDetail>
    implements _$$_PriceDetailCopyWith<$Res> {
  __$$_PriceDetailCopyWithImpl(
      _$_PriceDetail _value, $Res Function(_$_PriceDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemCondition = null,
    Object? subCondition = null,
    Object? channel = null,
    Object? price = null,
    Object? shipping = null,
    Object? point = null,
    Object? isCart = null,
  }) {
    return _then(_$_PriceDetail(
      itemCondition: null == itemCondition
          ? _value.itemCondition
          : itemCondition // ignore: cast_nullable_to_non_nullable
              as ItemCondition,
      subCondition: null == subCondition
          ? _value.subCondition
          : subCondition // ignore: cast_nullable_to_non_nullable
              as ItemSubCondition,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as FulfillmentChannel,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      shipping: null == shipping
          ? _value.shipping
          : shipping // ignore: cast_nullable_to_non_nullable
              as int,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      isCart: null == isCart
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
class _$_PriceDetail implements _PriceDetail {
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
  @override
  @JsonKey()
  @HiveField(1)
  final ItemSubCondition subCondition;
  @override
  @JsonKey()
  @HiveField(2)
  final FulfillmentChannel channel;
  @override
  @JsonKey()
  @HiveField(3)
  final int price;
  @override
  @JsonKey()
  @HiveField(4)
  final int shipping;
  @override
  @JsonKey()
  @HiveField(5)
  final int point;
  @override
  @JsonKey()
  @HiveField(6, defaultValue: false)
  final bool isCart;

  @override
  String toString() {
    return 'PriceDetail(itemCondition: $itemCondition, subCondition: $subCondition, channel: $channel, price: $price, shipping: $shipping, point: $point, isCart: $isCart)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PriceDetail &&
            (identical(other.itemCondition, itemCondition) ||
                other.itemCondition == itemCondition) &&
            (identical(other.subCondition, subCondition) ||
                other.subCondition == subCondition) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.shipping, shipping) ||
                other.shipping == shipping) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.isCart, isCart) || other.isCart == isCart));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, itemCondition, subCondition,
      channel, price, shipping, point, isCart);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PriceDetailCopyWith<_$_PriceDetail> get copyWith =>
      __$$_PriceDetailCopyWithImpl<_$_PriceDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PriceDetailToJson(
      this,
    );
  }
}

abstract class _PriceDetail implements PriceDetail {
  const factory _PriceDetail(
      {@HiveField(0)
      @JsonKey(name: "condition")
          final ItemCondition itemCondition,
      @HiveField(1)
          final ItemSubCondition subCondition,
      @HiveField(2)
          final FulfillmentChannel channel,
      @HiveField(3)
          final int price,
      @HiveField(4)
          final int shipping,
      @HiveField(5)
          final int point,
      @HiveField(6, defaultValue: false)
          final bool isCart}) = _$_PriceDetail;

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
  _$$_PriceDetailCopyWith<_$_PriceDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
