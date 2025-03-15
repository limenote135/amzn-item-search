// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_price.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @HiveField(0, defaultValue: <PriceDetail>[])
            @JsonKey(name: "new_offers")
            List<PriceDetail> newPrices,
            @HiveField(1, defaultValue: <PriceDetail>[])
            @JsonKey(name: "used_offers")
            List<PriceDetail> usedPrices,
            @HiveField(2) FeeInfo feeInfo)
        $default,
  ) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @HiveField(0, defaultValue: <PriceDetail>[])
            @JsonKey(name: "new_offers")
            List<PriceDetail> newPrices,
            @HiveField(1, defaultValue: <PriceDetail>[])
            @JsonKey(name: "used_offers")
            List<PriceDetail> usedPrices,
            @HiveField(2) FeeInfo feeInfo)?
        $default, {
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this ItemPrices to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ItemPrices
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      @HiveField(2) FeeInfo feeInfo});

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

  /// Create a copy of ItemPrices
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of ItemPrices
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FeeInfoCopyWith<$Res> get feeInfo {
    return $FeeInfoCopyWith<$Res>(_value.feeInfo, (value) {
      return _then(_value.copyWith(feeInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ItemPricesImplCopyWith<$Res>
    implements $ItemPricesCopyWith<$Res> {
  factory _$$ItemPricesImplCopyWith(
          _$ItemPricesImpl value, $Res Function(_$ItemPricesImpl) then) =
      __$$ItemPricesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0, defaultValue: <PriceDetail>[])
      @JsonKey(name: "new_offers")
      List<PriceDetail> newPrices,
      @HiveField(1, defaultValue: <PriceDetail>[])
      @JsonKey(name: "used_offers")
      List<PriceDetail> usedPrices,
      @HiveField(2) FeeInfo feeInfo});

  @override
  $FeeInfoCopyWith<$Res> get feeInfo;
}

/// @nodoc
class __$$ItemPricesImplCopyWithImpl<$Res>
    extends _$ItemPricesCopyWithImpl<$Res, _$ItemPricesImpl>
    implements _$$ItemPricesImplCopyWith<$Res> {
  __$$ItemPricesImplCopyWithImpl(
      _$ItemPricesImpl _value, $Res Function(_$ItemPricesImpl) _then)
      : super(_value, _then);

  /// Create a copy of ItemPrices
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newPrices = null,
    Object? usedPrices = null,
    Object? feeInfo = null,
  }) {
    return _then(_$ItemPricesImpl(
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
class _$ItemPricesImpl implements _ItemPrices {
  const _$ItemPricesImpl(
      {@HiveField(0, defaultValue: <PriceDetail>[])
      @JsonKey(name: "new_offers")
      final List<PriceDetail> newPrices = const <PriceDetail>[],
      @HiveField(1, defaultValue: <PriceDetail>[])
      @JsonKey(name: "used_offers")
      final List<PriceDetail> usedPrices = const <PriceDetail>[],
      @HiveField(2) this.feeInfo = const FeeInfo()})
      : _newPrices = newPrices,
        _usedPrices = usedPrices;

  factory _$ItemPricesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemPricesImplFromJson(json);

// 初期のころのデータで null で保存されている場合がある？ため、デフォルト値設定
  final List<PriceDetail> _newPrices;
// 初期のころのデータで null で保存されている場合がある？ため、デフォルト値設定
  @override
  @HiveField(0, defaultValue: <PriceDetail>[])
  @JsonKey(name: "new_offers")
  List<PriceDetail> get newPrices {
    if (_newPrices is EqualUnmodifiableListView) return _newPrices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newPrices);
  }

  final List<PriceDetail> _usedPrices;
  @override
  @HiveField(1, defaultValue: <PriceDetail>[])
  @JsonKey(name: "used_offers")
  List<PriceDetail> get usedPrices {
    if (_usedPrices is EqualUnmodifiableListView) return _usedPrices;
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemPricesImpl &&
            const DeepCollectionEquality()
                .equals(other._newPrices, _newPrices) &&
            const DeepCollectionEquality()
                .equals(other._usedPrices, _usedPrices) &&
            (identical(other.feeInfo, feeInfo) || other.feeInfo == feeInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_newPrices),
      const DeepCollectionEquality().hash(_usedPrices),
      feeInfo);

  /// Create a copy of ItemPrices
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemPricesImplCopyWith<_$ItemPricesImpl> get copyWith =>
      __$$ItemPricesImplCopyWithImpl<_$ItemPricesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @HiveField(0, defaultValue: <PriceDetail>[])
            @JsonKey(name: "new_offers")
            List<PriceDetail> newPrices,
            @HiveField(1, defaultValue: <PriceDetail>[])
            @JsonKey(name: "used_offers")
            List<PriceDetail> usedPrices,
            @HiveField(2) FeeInfo feeInfo)
        $default,
  ) {
    return $default(newPrices, usedPrices, feeInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @HiveField(0, defaultValue: <PriceDetail>[])
            @JsonKey(name: "new_offers")
            List<PriceDetail> newPrices,
            @HiveField(1, defaultValue: <PriceDetail>[])
            @JsonKey(name: "used_offers")
            List<PriceDetail> usedPrices,
            @HiveField(2) FeeInfo feeInfo)?
        $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(newPrices, usedPrices, feeInfo);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemPricesImplToJson(
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
      @HiveField(2) final FeeInfo feeInfo}) = _$ItemPricesImpl;

  factory _ItemPrices.fromJson(Map<String, dynamic> json) =
      _$ItemPricesImpl.fromJson;

// 初期のころのデータで null で保存されている場合がある？ため、デフォルト値設定
  @override
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

  /// Create a copy of ItemPrices
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemPricesImplCopyWith<_$ItemPricesImpl> get copyWith =>
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
  @HiveField(7, defaultValue: false)
  bool get isSelf => throw _privateConstructorUsedError;
  @HiveField(8, defaultValue: SellerType.seller)
  @JsonKey(name: "type")
  SellerType get sellerType => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @HiveField(0)
            @JsonKey(name: "condition")
            ItemCondition itemCondition,
            @HiveField(1) ItemSubCondition subCondition,
            @HiveField(2) FulfillmentChannel channel,
            @HiveField(3) int price,
            @HiveField(4) int shipping,
            @HiveField(5) int point,
            @HiveField(6, defaultValue: false) bool isCart,
            @HiveField(7, defaultValue: false) bool isSelf,
            @HiveField(8, defaultValue: SellerType.seller)
            @JsonKey(name: "type")
            SellerType sellerType)
        $default,
  ) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @HiveField(0)
            @JsonKey(name: "condition")
            ItemCondition itemCondition,
            @HiveField(1) ItemSubCondition subCondition,
            @HiveField(2) FulfillmentChannel channel,
            @HiveField(3) int price,
            @HiveField(4) int shipping,
            @HiveField(5) int point,
            @HiveField(6, defaultValue: false) bool isCart,
            @HiveField(7, defaultValue: false) bool isSelf,
            @HiveField(8, defaultValue: SellerType.seller)
            @JsonKey(name: "type")
            SellerType sellerType)?
        $default, {
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this PriceDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PriceDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      @HiveField(6, defaultValue: false) bool isCart,
      @HiveField(7, defaultValue: false) bool isSelf,
      @HiveField(8, defaultValue: SellerType.seller)
      @JsonKey(name: "type")
      SellerType sellerType});
}

/// @nodoc
class _$PriceDetailCopyWithImpl<$Res, $Val extends PriceDetail>
    implements $PriceDetailCopyWith<$Res> {
  _$PriceDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PriceDetail
  /// with the given fields replaced by the non-null parameter values.
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
    Object? isSelf = null,
    Object? sellerType = null,
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
      isSelf: null == isSelf
          ? _value.isSelf
          : isSelf // ignore: cast_nullable_to_non_nullable
              as bool,
      sellerType: null == sellerType
          ? _value.sellerType
          : sellerType // ignore: cast_nullable_to_non_nullable
              as SellerType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PriceDetailImplCopyWith<$Res>
    implements $PriceDetailCopyWith<$Res> {
  factory _$$PriceDetailImplCopyWith(
          _$PriceDetailImpl value, $Res Function(_$PriceDetailImpl) then) =
      __$$PriceDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: "condition") ItemCondition itemCondition,
      @HiveField(1) ItemSubCondition subCondition,
      @HiveField(2) FulfillmentChannel channel,
      @HiveField(3) int price,
      @HiveField(4) int shipping,
      @HiveField(5) int point,
      @HiveField(6, defaultValue: false) bool isCart,
      @HiveField(7, defaultValue: false) bool isSelf,
      @HiveField(8, defaultValue: SellerType.seller)
      @JsonKey(name: "type")
      SellerType sellerType});
}

/// @nodoc
class __$$PriceDetailImplCopyWithImpl<$Res>
    extends _$PriceDetailCopyWithImpl<$Res, _$PriceDetailImpl>
    implements _$$PriceDetailImplCopyWith<$Res> {
  __$$PriceDetailImplCopyWithImpl(
      _$PriceDetailImpl _value, $Res Function(_$PriceDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of PriceDetail
  /// with the given fields replaced by the non-null parameter values.
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
    Object? isSelf = null,
    Object? sellerType = null,
  }) {
    return _then(_$PriceDetailImpl(
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
      isSelf: null == isSelf
          ? _value.isSelf
          : isSelf // ignore: cast_nullable_to_non_nullable
              as bool,
      sellerType: null == sellerType
          ? _value.sellerType
          : sellerType // ignore: cast_nullable_to_non_nullable
              as SellerType,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, converters: [
  ItemConditionConverter(),
  ItemSubConditionConverter(),
  FulfillmentChannelConverter(),
  SellerTypeConverter()
])
@HiveType(typeId: priceDetailTypeId)
class _$PriceDetailImpl implements _PriceDetail {
  const _$PriceDetailImpl(
      {@HiveField(0)
      @JsonKey(name: "condition")
      this.itemCondition = ItemCondition.newItem,
      @HiveField(1) this.subCondition = ItemSubCondition.newItem,
      @HiveField(2) this.channel = FulfillmentChannel.merchant,
      @HiveField(3) this.price = 0,
      @HiveField(4) this.shipping = 0,
      @HiveField(5) this.point = 0,
      @HiveField(6, defaultValue: false) this.isCart = false,
      @HiveField(7, defaultValue: false) this.isSelf = false,
      @HiveField(8, defaultValue: SellerType.seller)
      @JsonKey(name: "type")
      this.sellerType = SellerType.seller});

  factory _$PriceDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriceDetailImplFromJson(json);

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
  @JsonKey()
  @HiveField(7, defaultValue: false)
  final bool isSelf;
  @override
  @HiveField(8, defaultValue: SellerType.seller)
  @JsonKey(name: "type")
  final SellerType sellerType;

  @override
  String toString() {
    return 'PriceDetail(itemCondition: $itemCondition, subCondition: $subCondition, channel: $channel, price: $price, shipping: $shipping, point: $point, isCart: $isCart, isSelf: $isSelf, sellerType: $sellerType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceDetailImpl &&
            (identical(other.itemCondition, itemCondition) ||
                other.itemCondition == itemCondition) &&
            (identical(other.subCondition, subCondition) ||
                other.subCondition == subCondition) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.shipping, shipping) ||
                other.shipping == shipping) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.isCart, isCart) || other.isCart == isCart) &&
            (identical(other.isSelf, isSelf) || other.isSelf == isSelf) &&
            (identical(other.sellerType, sellerType) ||
                other.sellerType == sellerType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, itemCondition, subCondition,
      channel, price, shipping, point, isCart, isSelf, sellerType);

  /// Create a copy of PriceDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceDetailImplCopyWith<_$PriceDetailImpl> get copyWith =>
      __$$PriceDetailImplCopyWithImpl<_$PriceDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @HiveField(0)
            @JsonKey(name: "condition")
            ItemCondition itemCondition,
            @HiveField(1) ItemSubCondition subCondition,
            @HiveField(2) FulfillmentChannel channel,
            @HiveField(3) int price,
            @HiveField(4) int shipping,
            @HiveField(5) int point,
            @HiveField(6, defaultValue: false) bool isCart,
            @HiveField(7, defaultValue: false) bool isSelf,
            @HiveField(8, defaultValue: SellerType.seller)
            @JsonKey(name: "type")
            SellerType sellerType)
        $default,
  ) {
    return $default(itemCondition, subCondition, channel, price, shipping,
        point, isCart, isSelf, sellerType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @HiveField(0)
            @JsonKey(name: "condition")
            ItemCondition itemCondition,
            @HiveField(1) ItemSubCondition subCondition,
            @HiveField(2) FulfillmentChannel channel,
            @HiveField(3) int price,
            @HiveField(4) int shipping,
            @HiveField(5) int point,
            @HiveField(6, defaultValue: false) bool isCart,
            @HiveField(7, defaultValue: false) bool isSelf,
            @HiveField(8, defaultValue: SellerType.seller)
            @JsonKey(name: "type")
            SellerType sellerType)?
        $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(itemCondition, subCondition, channel, price, shipping,
          point, isCart, isSelf, sellerType);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PriceDetailImplToJson(
      this,
    );
  }
}

abstract class _PriceDetail implements PriceDetail {
  const factory _PriceDetail(
      {@HiveField(0)
      @JsonKey(name: "condition")
      final ItemCondition itemCondition,
      @HiveField(1) final ItemSubCondition subCondition,
      @HiveField(2) final FulfillmentChannel channel,
      @HiveField(3) final int price,
      @HiveField(4) final int shipping,
      @HiveField(5) final int point,
      @HiveField(6, defaultValue: false) final bool isCart,
      @HiveField(7, defaultValue: false) final bool isSelf,
      @HiveField(8, defaultValue: SellerType.seller)
      @JsonKey(name: "type")
      final SellerType sellerType}) = _$PriceDetailImpl;

  factory _PriceDetail.fromJson(Map<String, dynamic> json) =
      _$PriceDetailImpl.fromJson;

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
  @HiveField(7, defaultValue: false)
  bool get isSelf;
  @override
  @HiveField(8, defaultValue: SellerType.seller)
  @JsonKey(name: "type")
  SellerType get sellerType;

  /// Create a copy of PriceDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PriceDetailImplCopyWith<_$PriceDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
