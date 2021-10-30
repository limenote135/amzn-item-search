// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stock_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StockItemTearOff {
  const _$StockItemTearOff();

  _StockItem call(
      {@HiveField(0) required String purchaseDate,
      @HiveField(1) int purchasePrice = 0,
      @HiveField(2) int sellPrice = 0,
      @HiveField(3) bool useFba = true,
      @HiveField(4) int profitPerItem = 0,
      @HiveField(5) int amount = 1,
      @HiveField(6) ItemCondition condition = ItemCondition.newItem,
      @HiveField(7) ItemSubCondition subCondition = ItemSubCondition.newItem,
      @HiveField(8) String sku = "",
      @HiveField(9) String memo = "",
      @HiveField(10) required AsinData item,
      @HiveField(11, defaultValue: "") String retailer = "",
      @HiveField(12, defaultValue: "") required String id,
      @HiveField(13, defaultValue: -1) int breakEven = 0,
      bool autogenSku = false}) {
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
      id: id,
      breakEven: breakEven,
      autogenSku: autogenSku,
    );
  }
}

/// @nodoc
const $StockItem = _$StockItemTearOff();

/// @nodoc
mixin _$StockItem {
  @HiveField(0)
  String get purchaseDate => throw _privateConstructorUsedError;
  @HiveField(1)
  int get purchasePrice => throw _privateConstructorUsedError;
  @HiveField(2)
  int get sellPrice => throw _privateConstructorUsedError;
  @HiveField(3)
  bool get useFba => throw _privateConstructorUsedError;
  @HiveField(4)
  int get profitPerItem => throw _privateConstructorUsedError;
  @HiveField(5)
  int get amount => throw _privateConstructorUsedError;
  @HiveField(6)
  ItemCondition get condition => throw _privateConstructorUsedError;
  @HiveField(7)
  ItemSubCondition get subCondition => throw _privateConstructorUsedError;
  @HiveField(8)
  String get sku => throw _privateConstructorUsedError;
  @HiveField(9)
  String get memo => throw _privateConstructorUsedError;
  @HiveField(10)
  AsinData get item => throw _privateConstructorUsedError;
  @HiveField(11, defaultValue: "")
  String get retailer => throw _privateConstructorUsedError; // 主キー
  @HiveField(12, defaultValue: "")
  String get id =>
      throw _privateConstructorUsedError; // マイグレーションのために -1 にする(-1 の場合は要マイグレーション)
  @HiveField(13, defaultValue: -1)
  int get breakEven => throw _privateConstructorUsedError;
  bool get autogenSku => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StockItemCopyWith<StockItem> get copyWith =>
      throw _privateConstructorUsedError;
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
      @HiveField(11, defaultValue: "") String retailer,
      @HiveField(12, defaultValue: "") String id,
      @HiveField(13, defaultValue: -1) int breakEven,
      bool autogenSku});

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
    Object? purchaseDate = freezed,
    Object? purchasePrice = freezed,
    Object? sellPrice = freezed,
    Object? useFba = freezed,
    Object? profitPerItem = freezed,
    Object? amount = freezed,
    Object? condition = freezed,
    Object? subCondition = freezed,
    Object? sku = freezed,
    Object? memo = freezed,
    Object? item = freezed,
    Object? retailer = freezed,
    Object? id = freezed,
    Object? breakEven = freezed,
    Object? autogenSku = freezed,
  }) {
    return _then(_value.copyWith(
      purchaseDate: purchaseDate == freezed
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      purchasePrice: purchasePrice == freezed
          ? _value.purchasePrice
          : purchasePrice // ignore: cast_nullable_to_non_nullable
              as int,
      sellPrice: sellPrice == freezed
          ? _value.sellPrice
          : sellPrice // ignore: cast_nullable_to_non_nullable
              as int,
      useFba: useFba == freezed
          ? _value.useFba
          : useFba // ignore: cast_nullable_to_non_nullable
              as bool,
      profitPerItem: profitPerItem == freezed
          ? _value.profitPerItem
          : profitPerItem // ignore: cast_nullable_to_non_nullable
              as int,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      condition: condition == freezed
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as ItemCondition,
      subCondition: subCondition == freezed
          ? _value.subCondition
          : subCondition // ignore: cast_nullable_to_non_nullable
              as ItemSubCondition,
      sku: sku == freezed
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      memo: memo == freezed
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as AsinData,
      retailer: retailer == freezed
          ? _value.retailer
          : retailer // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      breakEven: breakEven == freezed
          ? _value.breakEven
          : breakEven // ignore: cast_nullable_to_non_nullable
              as int,
      autogenSku: autogenSku == freezed
          ? _value.autogenSku
          : autogenSku // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $AsinDataCopyWith<$Res> get item {
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
      @HiveField(11, defaultValue: "") String retailer,
      @HiveField(12, defaultValue: "") String id,
      @HiveField(13, defaultValue: -1) int breakEven,
      bool autogenSku});

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
    Object? purchaseDate = freezed,
    Object? purchasePrice = freezed,
    Object? sellPrice = freezed,
    Object? useFba = freezed,
    Object? profitPerItem = freezed,
    Object? amount = freezed,
    Object? condition = freezed,
    Object? subCondition = freezed,
    Object? sku = freezed,
    Object? memo = freezed,
    Object? item = freezed,
    Object? retailer = freezed,
    Object? id = freezed,
    Object? breakEven = freezed,
    Object? autogenSku = freezed,
  }) {
    return _then(_StockItem(
      purchaseDate: purchaseDate == freezed
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      purchasePrice: purchasePrice == freezed
          ? _value.purchasePrice
          : purchasePrice // ignore: cast_nullable_to_non_nullable
              as int,
      sellPrice: sellPrice == freezed
          ? _value.sellPrice
          : sellPrice // ignore: cast_nullable_to_non_nullable
              as int,
      useFba: useFba == freezed
          ? _value.useFba
          : useFba // ignore: cast_nullable_to_non_nullable
              as bool,
      profitPerItem: profitPerItem == freezed
          ? _value.profitPerItem
          : profitPerItem // ignore: cast_nullable_to_non_nullable
              as int,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      condition: condition == freezed
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as ItemCondition,
      subCondition: subCondition == freezed
          ? _value.subCondition
          : subCondition // ignore: cast_nullable_to_non_nullable
              as ItemSubCondition,
      sku: sku == freezed
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      memo: memo == freezed
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as AsinData,
      retailer: retailer == freezed
          ? _value.retailer
          : retailer // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      breakEven: breakEven == freezed
          ? _value.breakEven
          : breakEven // ignore: cast_nullable_to_non_nullable
              as int,
      autogenSku: autogenSku == freezed
          ? _value.autogenSku
          : autogenSku // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@HiveType(typeId: stockItemTypeId)
class _$_StockItem implements _StockItem {
  const _$_StockItem(
      {@HiveField(0) required this.purchaseDate,
      @HiveField(1) this.purchasePrice = 0,
      @HiveField(2) this.sellPrice = 0,
      @HiveField(3) this.useFba = true,
      @HiveField(4) this.profitPerItem = 0,
      @HiveField(5) this.amount = 1,
      @HiveField(6) this.condition = ItemCondition.newItem,
      @HiveField(7) this.subCondition = ItemSubCondition.newItem,
      @HiveField(8) this.sku = "",
      @HiveField(9) this.memo = "",
      @HiveField(10) required this.item,
      @HiveField(11, defaultValue: "") this.retailer = "",
      @HiveField(12, defaultValue: "") required this.id,
      @HiveField(13, defaultValue: -1) this.breakEven = 0,
      this.autogenSku = false});

  @override
  @HiveField(0)
  final String purchaseDate;
  @JsonKey(defaultValue: 0)
  @override
  @HiveField(1)
  final int purchasePrice;
  @JsonKey(defaultValue: 0)
  @override
  @HiveField(2)
  final int sellPrice;
  @JsonKey(defaultValue: true)
  @override
  @HiveField(3)
  final bool useFba;
  @JsonKey(defaultValue: 0)
  @override
  @HiveField(4)
  final int profitPerItem;
  @JsonKey(defaultValue: 1)
  @override
  @HiveField(5)
  final int amount;
  @JsonKey(defaultValue: ItemCondition.newItem)
  @override
  @HiveField(6)
  final ItemCondition condition;
  @JsonKey(defaultValue: ItemSubCondition.newItem)
  @override
  @HiveField(7)
  final ItemSubCondition subCondition;
  @JsonKey(defaultValue: "")
  @override
  @HiveField(8)
  final String sku;
  @JsonKey(defaultValue: "")
  @override
  @HiveField(9)
  final String memo;
  @override
  @HiveField(10)
  final AsinData item;
  @JsonKey(defaultValue: "")
  @override
  @HiveField(11, defaultValue: "")
  final String retailer;
  @override // 主キー
  @HiveField(12, defaultValue: "")
  final String id;
  @JsonKey(defaultValue: 0)
  @override // マイグレーションのために -1 にする(-1 の場合は要マイグレーション)
  @HiveField(13, defaultValue: -1)
  final int breakEven;
  @JsonKey(defaultValue: false)
  @override
  final bool autogenSku;

  @override
  String toString() {
    return 'StockItem(purchaseDate: $purchaseDate, purchasePrice: $purchasePrice, sellPrice: $sellPrice, useFba: $useFba, profitPerItem: $profitPerItem, amount: $amount, condition: $condition, subCondition: $subCondition, sku: $sku, memo: $memo, item: $item, retailer: $retailer, id: $id, breakEven: $breakEven, autogenSku: $autogenSku)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StockItem &&
            (identical(other.purchaseDate, purchaseDate) ||
                other.purchaseDate == purchaseDate) &&
            (identical(other.purchasePrice, purchasePrice) ||
                other.purchasePrice == purchasePrice) &&
            (identical(other.sellPrice, sellPrice) ||
                other.sellPrice == sellPrice) &&
            (identical(other.useFba, useFba) || other.useFba == useFba) &&
            (identical(other.profitPerItem, profitPerItem) ||
                other.profitPerItem == profitPerItem) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.subCondition, subCondition) ||
                other.subCondition == subCondition) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.retailer, retailer) ||
                other.retailer == retailer) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.breakEven, breakEven) ||
                other.breakEven == breakEven) &&
            (identical(other.autogenSku, autogenSku) ||
                other.autogenSku == autogenSku));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      purchaseDate,
      purchasePrice,
      sellPrice,
      useFba,
      profitPerItem,
      amount,
      condition,
      subCondition,
      sku,
      memo,
      item,
      retailer,
      id,
      breakEven,
      autogenSku);

  @JsonKey(ignore: true)
  @override
  _$StockItemCopyWith<_StockItem> get copyWith =>
      __$StockItemCopyWithImpl<_StockItem>(this, _$identity);
}

abstract class _StockItem implements StockItem {
  const factory _StockItem(
      {@HiveField(0) required String purchaseDate,
      @HiveField(1) int purchasePrice,
      @HiveField(2) int sellPrice,
      @HiveField(3) bool useFba,
      @HiveField(4) int profitPerItem,
      @HiveField(5) int amount,
      @HiveField(6) ItemCondition condition,
      @HiveField(7) ItemSubCondition subCondition,
      @HiveField(8) String sku,
      @HiveField(9) String memo,
      @HiveField(10) required AsinData item,
      @HiveField(11, defaultValue: "") String retailer,
      @HiveField(12, defaultValue: "") required String id,
      @HiveField(13, defaultValue: -1) int breakEven,
      bool autogenSku}) = _$_StockItem;

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
  @HiveField(11, defaultValue: "")
  String get retailer;
  @override // 主キー
  @HiveField(12, defaultValue: "")
  String get id;
  @override // マイグレーションのために -1 にする(-1 の場合は要マイグレーション)
  @HiveField(13, defaultValue: -1)
  int get breakEven;
  @override
  bool get autogenSku;
  @override
  @JsonKey(ignore: true)
  _$StockItemCopyWith<_StockItem> get copyWith =>
      throw _privateConstructorUsedError;
}
