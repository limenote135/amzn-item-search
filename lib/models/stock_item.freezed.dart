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
      {@required int purchasePrice,
      @required int sellPrice,
      @required bool useFba,
      @required int profitPerItem,
      @required int amount,
      @required ItemCondition condition,
      @required ItemSubCondition subCondition,
      @required String sku,
      @required String memo,
      @required String purchaseDate,
      @required AsinData item}) {
    return _StockItem(
      purchasePrice: purchasePrice,
      sellPrice: sellPrice,
      useFba: useFba,
      profitPerItem: profitPerItem,
      amount: amount,
      condition: condition,
      subCondition: subCondition,
      sku: sku,
      memo: memo,
      purchaseDate: purchaseDate,
      item: item,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $StockItem = _$StockItemTearOff();

/// @nodoc
mixin _$StockItem {
  int get purchasePrice;
  int get sellPrice;
  bool get useFba;
  int get profitPerItem;
  int get amount;
  ItemCondition get condition;
  ItemSubCondition get subCondition;
  String get sku;
  String get memo;
  String get purchaseDate;
  AsinData get item;

  $StockItemCopyWith<StockItem> get copyWith;
}

/// @nodoc
abstract class $StockItemCopyWith<$Res> {
  factory $StockItemCopyWith(StockItem value, $Res Function(StockItem) then) =
      _$StockItemCopyWithImpl<$Res>;
  $Res call(
      {int purchasePrice,
      int sellPrice,
      bool useFba,
      int profitPerItem,
      int amount,
      ItemCondition condition,
      ItemSubCondition subCondition,
      String sku,
      String memo,
      String purchaseDate,
      AsinData item});

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
    Object purchasePrice = freezed,
    Object sellPrice = freezed,
    Object useFba = freezed,
    Object profitPerItem = freezed,
    Object amount = freezed,
    Object condition = freezed,
    Object subCondition = freezed,
    Object sku = freezed,
    Object memo = freezed,
    Object purchaseDate = freezed,
    Object item = freezed,
  }) {
    return _then(_value.copyWith(
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
      purchaseDate: purchaseDate == freezed
          ? _value.purchaseDate
          : purchaseDate as String,
      item: item == freezed ? _value.item : item as AsinData,
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
      {int purchasePrice,
      int sellPrice,
      bool useFba,
      int profitPerItem,
      int amount,
      ItemCondition condition,
      ItemSubCondition subCondition,
      String sku,
      String memo,
      String purchaseDate,
      AsinData item});

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
    Object purchasePrice = freezed,
    Object sellPrice = freezed,
    Object useFba = freezed,
    Object profitPerItem = freezed,
    Object amount = freezed,
    Object condition = freezed,
    Object subCondition = freezed,
    Object sku = freezed,
    Object memo = freezed,
    Object purchaseDate = freezed,
    Object item = freezed,
  }) {
    return _then(_StockItem(
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
      purchaseDate: purchaseDate == freezed
          ? _value.purchaseDate
          : purchaseDate as String,
      item: item == freezed ? _value.item : item as AsinData,
    ));
  }
}

/// @nodoc
class _$_StockItem implements _StockItem {
  const _$_StockItem(
      {@required this.purchasePrice,
      @required this.sellPrice,
      @required this.useFba,
      @required this.profitPerItem,
      @required this.amount,
      @required this.condition,
      @required this.subCondition,
      @required this.sku,
      @required this.memo,
      @required this.purchaseDate,
      @required this.item})
      : assert(purchasePrice != null),
        assert(sellPrice != null),
        assert(useFba != null),
        assert(profitPerItem != null),
        assert(amount != null),
        assert(condition != null),
        assert(subCondition != null),
        assert(sku != null),
        assert(memo != null),
        assert(purchaseDate != null),
        assert(item != null);

  @override
  final int purchasePrice;
  @override
  final int sellPrice;
  @override
  final bool useFba;
  @override
  final int profitPerItem;
  @override
  final int amount;
  @override
  final ItemCondition condition;
  @override
  final ItemSubCondition subCondition;
  @override
  final String sku;
  @override
  final String memo;
  @override
  final String purchaseDate;
  @override
  final AsinData item;

  @override
  String toString() {
    return 'StockItem(purchasePrice: $purchasePrice, sellPrice: $sellPrice, useFba: $useFba, profitPerItem: $profitPerItem, amount: $amount, condition: $condition, subCondition: $subCondition, sku: $sku, memo: $memo, purchaseDate: $purchaseDate, item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StockItem &&
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
            (identical(other.purchaseDate, purchaseDate) ||
                const DeepCollectionEquality()
                    .equals(other.purchaseDate, purchaseDate)) &&
            (identical(other.item, item) ||
                const DeepCollectionEquality().equals(other.item, item)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(purchasePrice) ^
      const DeepCollectionEquality().hash(sellPrice) ^
      const DeepCollectionEquality().hash(useFba) ^
      const DeepCollectionEquality().hash(profitPerItem) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(condition) ^
      const DeepCollectionEquality().hash(subCondition) ^
      const DeepCollectionEquality().hash(sku) ^
      const DeepCollectionEquality().hash(memo) ^
      const DeepCollectionEquality().hash(purchaseDate) ^
      const DeepCollectionEquality().hash(item);

  @override
  _$StockItemCopyWith<_StockItem> get copyWith =>
      __$StockItemCopyWithImpl<_StockItem>(this, _$identity);
}

abstract class _StockItem implements StockItem {
  const factory _StockItem(
      {@required int purchasePrice,
      @required int sellPrice,
      @required bool useFba,
      @required int profitPerItem,
      @required int amount,
      @required ItemCondition condition,
      @required ItemSubCondition subCondition,
      @required String sku,
      @required String memo,
      @required String purchaseDate,
      @required AsinData item}) = _$_StockItem;

  @override
  int get purchasePrice;
  @override
  int get sellPrice;
  @override
  bool get useFba;
  @override
  int get profitPerItem;
  @override
  int get amount;
  @override
  ItemCondition get condition;
  @override
  ItemSubCondition get subCondition;
  @override
  String get sku;
  @override
  String get memo;
  @override
  String get purchaseDate;
  @override
  AsinData get item;
  @override
  _$StockItemCopyWith<_StockItem> get copyWith;
}
