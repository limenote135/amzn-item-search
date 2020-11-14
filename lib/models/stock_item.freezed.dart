// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'stock_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$StockItemTearOff {
  const _$StockItemTearOff();

// ignore: unused_element
  _StockItem call(
      {@required @HiveField(0) String purchaseDate,
      @required @HiveField(1) int purchasePrice,
      @required @HiveField(2) int sellPrice,
      @required @HiveField(3) bool useFba,
      @required @HiveField(4) int profitPerItem,
      @required @HiveField(5) int amount,
      @required @HiveField(6) ItemCondition condition,
      @required @HiveField(7) ItemSubCondition subCondition,
      @required @HiveField(8) String sku,
      @required @HiveField(9) String memo,
      @required @HiveField(10) AsinData item,
      @required @HiveField(11) String retailer}) {
    return _StockItem(
      purchaseDate: purchaseDate,
      purchasePrice: purchasePrice,
      sellPrice: sellPrice,
      useFba: useFba,
      profitPerItem: profitPerItem,
      amount: amount,
      condition: condition,
      subCondition: subCondition,
      sku: sku,
      memo: memo,
      item: item,
      retailer: retailer,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $StockItem = _$StockItemTearOff();

/// @nodoc
mixin _$StockItem {
  @HiveField(0)
  String get purchaseDate;
  @HiveField(1)
  int get purchasePrice;
  @HiveField(2)
  int get sellPrice;
  @HiveField(3)
  bool get useFba;
  @HiveField(4)
  int get profitPerItem;
  @HiveField(5)
  int get amount;
  @HiveField(6)
  ItemCondition get condition;
  @HiveField(7)
  ItemSubCondition get subCondition;
  @HiveField(8)
  String get sku;
  @HiveField(9)
  String get memo;
  @HiveField(10)
  AsinData get item;
  @HiveField(11)
  String get retailer;

  $StockItemCopyWith<StockItem> get copyWith;
}

/// @nodoc
abstract class $StockItemCopyWith<$Res> {
  factory $StockItemCopyWith(StockItem value, $Res Function(StockItem) then) =
      _$StockItemCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String purchaseDate,
      @HiveField(1) int purchasePrice,
      @HiveField(2) int sellPrice,
      @HiveField(3) bool useFba,
      @HiveField(4) int profitPerItem,
      @HiveField(5) int amount,
      @HiveField(6) ItemCondition condition,
      @HiveField(7) ItemSubCondition subCondition,
      @HiveField(8) String sku,
      @HiveField(9) String memo,
      @HiveField(10) AsinData item,
      @HiveField(11) String retailer});

  $AsinDataCopyWith<$Res> get item;
}

/// @nodoc
class _$StockItemCopyWithImpl<$Res> implements $StockItemCopyWith<$Res> {
  _$StockItemCopyWithImpl(this._value, this._then);

  final StockItem _value;
  // ignore: unused_field
  final $Res Function(StockItem) _then;

  @override
  $Res call({
    Object purchaseDate = freezed,
    Object purchasePrice = freezed,
    Object sellPrice = freezed,
    Object useFba = freezed,
    Object profitPerItem = freezed,
    Object amount = freezed,
    Object condition = freezed,
    Object subCondition = freezed,
    Object sku = freezed,
    Object memo = freezed,
    Object item = freezed,
    Object retailer = freezed,
  }) {
    return _then(_value.copyWith(
      purchaseDate: purchaseDate == freezed
          ? _value.purchaseDate
          : purchaseDate as String,
      purchasePrice: purchasePrice == freezed
          ? _value.purchasePrice
          : purchasePrice as int,
      sellPrice: sellPrice == freezed ? _value.sellPrice : sellPrice as int,
      useFba: useFba == freezed ? _value.useFba : useFba as bool,
      profitPerItem: profitPerItem == freezed
          ? _value.profitPerItem
          : profitPerItem as int,
      amount: amount == freezed ? _value.amount : amount as int,
      condition:
          condition == freezed ? _value.condition : condition as ItemCondition,
      subCondition: subCondition == freezed
          ? _value.subCondition
          : subCondition as ItemSubCondition,
      sku: sku == freezed ? _value.sku : sku as String,
      memo: memo == freezed ? _value.memo : memo as String,
      item: item == freezed ? _value.item : item as AsinData,
      retailer: retailer == freezed ? _value.retailer : retailer as String,
    ));
  }

  @override
  $AsinDataCopyWith<$Res> get item {
    if (_value.item == null) {
      return null;
    }
    return $AsinDataCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc
abstract class _$StockItemCopyWith<$Res> implements $StockItemCopyWith<$Res> {
  factory _$StockItemCopyWith(
          _StockItem value, $Res Function(_StockItem) then) =
      __$StockItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String purchaseDate,
      @HiveField(1) int purchasePrice,
      @HiveField(2) int sellPrice,
      @HiveField(3) bool useFba,
      @HiveField(4) int profitPerItem,
      @HiveField(5) int amount,
      @HiveField(6) ItemCondition condition,
      @HiveField(7) ItemSubCondition subCondition,
      @HiveField(8) String sku,
      @HiveField(9) String memo,
      @HiveField(10) AsinData item,
      @HiveField(11) String retailer});

  @override
  $AsinDataCopyWith<$Res> get item;
}

/// @nodoc
class __$StockItemCopyWithImpl<$Res> extends _$StockItemCopyWithImpl<$Res>
    implements _$StockItemCopyWith<$Res> {
  __$StockItemCopyWithImpl(_StockItem _value, $Res Function(_StockItem) _then)
      : super(_value, (v) => _then(v as _StockItem));

  @override
  _StockItem get _value => super._value as _StockItem;

  @override
  $Res call({
    Object purchaseDate = freezed,
    Object purchasePrice = freezed,
    Object sellPrice = freezed,
    Object useFba = freezed,
    Object profitPerItem = freezed,
    Object amount = freezed,
    Object condition = freezed,
    Object subCondition = freezed,
    Object sku = freezed,
    Object memo = freezed,
    Object item = freezed,
    Object retailer = freezed,
  }) {
    return _then(_StockItem(
      purchaseDate: purchaseDate == freezed
          ? _value.purchaseDate
          : purchaseDate as String,
      purchasePrice: purchasePrice == freezed
          ? _value.purchasePrice
          : purchasePrice as int,
      sellPrice: sellPrice == freezed ? _value.sellPrice : sellPrice as int,
      useFba: useFba == freezed ? _value.useFba : useFba as bool,
      profitPerItem: profitPerItem == freezed
          ? _value.profitPerItem
          : profitPerItem as int,
      amount: amount == freezed ? _value.amount : amount as int,
      condition:
          condition == freezed ? _value.condition : condition as ItemCondition,
      subCondition: subCondition == freezed
          ? _value.subCondition
          : subCondition as ItemSubCondition,
      sku: sku == freezed ? _value.sku : sku as String,
      memo: memo == freezed ? _value.memo : memo as String,
      item: item == freezed ? _value.item : item as AsinData,
      retailer: retailer == freezed ? _value.retailer : retailer as String,
    ));
  }
}

@HiveType(typeId: stockItemTypeId)

/// @nodoc
class _$_StockItem implements _StockItem {
  const _$_StockItem(
      {@required @HiveField(0) this.purchaseDate,
      @required @HiveField(1) this.purchasePrice,
      @required @HiveField(2) this.sellPrice,
      @required @HiveField(3) this.useFba,
      @required @HiveField(4) this.profitPerItem,
      @required @HiveField(5) this.amount,
      @required @HiveField(6) this.condition,
      @required @HiveField(7) this.subCondition,
      @required @HiveField(8) this.sku,
      @required @HiveField(9) this.memo,
      @required @HiveField(10) this.item,
      @required @HiveField(11) this.retailer})
      : assert(purchaseDate != null),
        assert(purchasePrice != null),
        assert(sellPrice != null),
        assert(useFba != null),
        assert(profitPerItem != null),
        assert(amount != null),
        assert(condition != null),
        assert(subCondition != null),
        assert(sku != null),
        assert(memo != null),
        assert(item != null),
        assert(retailer != null);

  @override
  @HiveField(0)
  final String purchaseDate;
  @override
  @HiveField(1)
  final int purchasePrice;
  @override
  @HiveField(2)
  final int sellPrice;
  @override
  @HiveField(3)
  final bool useFba;
  @override
  @HiveField(4)
  final int profitPerItem;
  @override
  @HiveField(5)
  final int amount;
  @override
  @HiveField(6)
  final ItemCondition condition;
  @override
  @HiveField(7)
  final ItemSubCondition subCondition;
  @override
  @HiveField(8)
  final String sku;
  @override
  @HiveField(9)
  final String memo;
  @override
  @HiveField(10)
  final AsinData item;
  @override
  @HiveField(11)
  final String retailer;

  @override
  String toString() {
    return 'StockItem(purchaseDate: $purchaseDate, purchasePrice: $purchasePrice, sellPrice: $sellPrice, useFba: $useFba, profitPerItem: $profitPerItem, amount: $amount, condition: $condition, subCondition: $subCondition, sku: $sku, memo: $memo, item: $item, retailer: $retailer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StockItem &&
            (identical(other.purchaseDate, purchaseDate) ||
                const DeepCollectionEquality()
                    .equals(other.purchaseDate, purchaseDate)) &&
            (identical(other.purchasePrice, purchasePrice) ||
                const DeepCollectionEquality()
                    .equals(other.purchasePrice, purchasePrice)) &&
            (identical(other.sellPrice, sellPrice) ||
                const DeepCollectionEquality()
                    .equals(other.sellPrice, sellPrice)) &&
            (identical(other.useFba, useFba) ||
                const DeepCollectionEquality().equals(other.useFba, useFba)) &&
            (identical(other.profitPerItem, profitPerItem) ||
                const DeepCollectionEquality()
                    .equals(other.profitPerItem, profitPerItem)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.condition, condition) ||
                const DeepCollectionEquality()
                    .equals(other.condition, condition)) &&
            (identical(other.subCondition, subCondition) ||
                const DeepCollectionEquality()
                    .equals(other.subCondition, subCondition)) &&
            (identical(other.sku, sku) ||
                const DeepCollectionEquality().equals(other.sku, sku)) &&
            (identical(other.memo, memo) ||
                const DeepCollectionEquality().equals(other.memo, memo)) &&
            (identical(other.item, item) ||
                const DeepCollectionEquality().equals(other.item, item)) &&
            (identical(other.retailer, retailer) ||
                const DeepCollectionEquality()
                    .equals(other.retailer, retailer)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(purchaseDate) ^
      const DeepCollectionEquality().hash(purchasePrice) ^
      const DeepCollectionEquality().hash(sellPrice) ^
      const DeepCollectionEquality().hash(useFba) ^
      const DeepCollectionEquality().hash(profitPerItem) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(condition) ^
      const DeepCollectionEquality().hash(subCondition) ^
      const DeepCollectionEquality().hash(sku) ^
      const DeepCollectionEquality().hash(memo) ^
      const DeepCollectionEquality().hash(item) ^
      const DeepCollectionEquality().hash(retailer);

  @override
  _$StockItemCopyWith<_StockItem> get copyWith =>
      __$StockItemCopyWithImpl<_StockItem>(this, _$identity);
}

abstract class _StockItem implements StockItem {
  const factory _StockItem(
      {@required @HiveField(0) String purchaseDate,
      @required @HiveField(1) int purchasePrice,
      @required @HiveField(2) int sellPrice,
      @required @HiveField(3) bool useFba,
      @required @HiveField(4) int profitPerItem,
      @required @HiveField(5) int amount,
      @required @HiveField(6) ItemCondition condition,
      @required @HiveField(7) ItemSubCondition subCondition,
      @required @HiveField(8) String sku,
      @required @HiveField(9) String memo,
      @required @HiveField(10) AsinData item,
      @required @HiveField(11) String retailer}) = _$_StockItem;

  @override
  @HiveField(0)
  String get purchaseDate;
  @override
  @HiveField(1)
  int get purchasePrice;
  @override
  @HiveField(2)
  int get sellPrice;
  @override
  @HiveField(3)
  bool get useFba;
  @override
  @HiveField(4)
  int get profitPerItem;
  @override
  @HiveField(5)
  int get amount;
  @override
  @HiveField(6)
  ItemCondition get condition;
  @override
  @HiveField(7)
  ItemSubCondition get subCondition;
  @override
  @HiveField(8)
  String get sku;
  @override
  @HiveField(9)
  String get memo;
  @override
  @HiveField(10)
  AsinData get item;
  @override
  @HiveField(11)
  String get retailer;
  @override
  _$StockItemCopyWith<_StockItem> get copyWith;
}
