// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stock_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
  @HiveField(14)
  String? get listingDate =>
      throw _privateConstructorUsedError; // 仕入れ確定した後はデフォルト false とするが、仕入れ時にはデフォルト true で、
// 仕入れ画面で切り替えられるように、永続化はしないがメンバとして値を持っておく
  bool get autogenSku => throw _privateConstructorUsedError;
  @HiveField(15, defaultValue: "")
  String get conditionText => throw _privateConstructorUsedError;
  @HiveField(16, defaultValue: 0)
  int get otherCost => throw _privateConstructorUsedError;

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
      @HiveField(14) String? listingDate,
      bool autogenSku,
      @HiveField(15, defaultValue: "") String conditionText,
      @HiveField(16, defaultValue: 0) int otherCost});

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
    Object? listingDate = freezed,
    Object? autogenSku = freezed,
    Object? conditionText = freezed,
    Object? otherCost = freezed,
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
      listingDate: listingDate == freezed
          ? _value.listingDate
          : listingDate // ignore: cast_nullable_to_non_nullable
              as String?,
      autogenSku: autogenSku == freezed
          ? _value.autogenSku
          : autogenSku // ignore: cast_nullable_to_non_nullable
              as bool,
      conditionText: conditionText == freezed
          ? _value.conditionText
          : conditionText // ignore: cast_nullable_to_non_nullable
              as String,
      otherCost: otherCost == freezed
          ? _value.otherCost
          : otherCost // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$_StockItemCopyWith<$Res> implements $StockItemCopyWith<$Res> {
  factory _$$_StockItemCopyWith(
          _$_StockItem value, $Res Function(_$_StockItem) then) =
      __$$_StockItemCopyWithImpl<$Res>;
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
      @HiveField(14) String? listingDate,
      bool autogenSku,
      @HiveField(15, defaultValue: "") String conditionText,
      @HiveField(16, defaultValue: 0) int otherCost});

  @override
  $AsinDataCopyWith<$Res> get item;
}

/// @nodoc
class __$$_StockItemCopyWithImpl<$Res> extends _$StockItemCopyWithImpl<$Res>
    implements _$$_StockItemCopyWith<$Res> {
  __$$_StockItemCopyWithImpl(
      _$_StockItem _value, $Res Function(_$_StockItem) _then)
      : super(_value, (v) => _then(v as _$_StockItem));

  @override
  _$_StockItem get _value => super._value as _$_StockItem;

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
    Object? listingDate = freezed,
    Object? autogenSku = freezed,
    Object? conditionText = freezed,
    Object? otherCost = freezed,
  }) {
    return _then(_$_StockItem(
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
      listingDate: listingDate == freezed
          ? _value.listingDate
          : listingDate // ignore: cast_nullable_to_non_nullable
              as String?,
      autogenSku: autogenSku == freezed
          ? _value.autogenSku
          : autogenSku // ignore: cast_nullable_to_non_nullable
              as bool,
      conditionText: conditionText == freezed
          ? _value.conditionText
          : conditionText // ignore: cast_nullable_to_non_nullable
              as String,
      otherCost: otherCost == freezed
          ? _value.otherCost
          : otherCost // ignore: cast_nullable_to_non_nullable
              as int,
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
      @HiveField(14) this.listingDate,
      this.autogenSku = false,
      @HiveField(15, defaultValue: "") this.conditionText = "",
      @HiveField(16, defaultValue: 0) this.otherCost = 0});

  @override
  @HiveField(0)
  final String purchaseDate;
  @override
  @JsonKey()
  @HiveField(1)
  final int purchasePrice;
  @override
  @JsonKey()
  @HiveField(2)
  final int sellPrice;
  @override
  @JsonKey()
  @HiveField(3)
  final bool useFba;
  @override
  @JsonKey()
  @HiveField(4)
  final int profitPerItem;
  @override
  @JsonKey()
  @HiveField(5)
  final int amount;
  @override
  @JsonKey()
  @HiveField(6)
  final ItemCondition condition;
  @override
  @JsonKey()
  @HiveField(7)
  final ItemSubCondition subCondition;
  @override
  @JsonKey()
  @HiveField(8)
  final String sku;
  @override
  @JsonKey()
  @HiveField(9)
  final String memo;
  @override
  @HiveField(10)
  final AsinData item;
  @override
  @JsonKey()
  @HiveField(11, defaultValue: "")
  final String retailer;
// 主キー
  @override
  @HiveField(12, defaultValue: "")
  final String id;
// マイグレーションのために -1 にする(-1 の場合は要マイグレーション)
  @override
  @JsonKey()
  @HiveField(13, defaultValue: -1)
  final int breakEven;
  @override
  @HiveField(14)
  final String? listingDate;
// 仕入れ確定した後はデフォルト false とするが、仕入れ時にはデフォルト true で、
// 仕入れ画面で切り替えられるように、永続化はしないがメンバとして値を持っておく
  @override
  @JsonKey()
  final bool autogenSku;
  @override
  @JsonKey()
  @HiveField(15, defaultValue: "")
  final String conditionText;
  @override
  @JsonKey()
  @HiveField(16, defaultValue: 0)
  final int otherCost;

  @override
  String toString() {
    return 'StockItem(purchaseDate: $purchaseDate, purchasePrice: $purchasePrice, sellPrice: $sellPrice, useFba: $useFba, profitPerItem: $profitPerItem, amount: $amount, condition: $condition, subCondition: $subCondition, sku: $sku, memo: $memo, item: $item, retailer: $retailer, id: $id, breakEven: $breakEven, listingDate: $listingDate, autogenSku: $autogenSku, conditionText: $conditionText, otherCost: $otherCost)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StockItem &&
            const DeepCollectionEquality()
                .equals(other.purchaseDate, purchaseDate) &&
            const DeepCollectionEquality()
                .equals(other.purchasePrice, purchasePrice) &&
            const DeepCollectionEquality().equals(other.sellPrice, sellPrice) &&
            const DeepCollectionEquality().equals(other.useFba, useFba) &&
            const DeepCollectionEquality()
                .equals(other.profitPerItem, profitPerItem) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.condition, condition) &&
            const DeepCollectionEquality()
                .equals(other.subCondition, subCondition) &&
            const DeepCollectionEquality().equals(other.sku, sku) &&
            const DeepCollectionEquality().equals(other.memo, memo) &&
            const DeepCollectionEquality().equals(other.item, item) &&
            const DeepCollectionEquality().equals(other.retailer, retailer) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.breakEven, breakEven) &&
            const DeepCollectionEquality()
                .equals(other.listingDate, listingDate) &&
            const DeepCollectionEquality()
                .equals(other.autogenSku, autogenSku) &&
            const DeepCollectionEquality()
                .equals(other.conditionText, conditionText) &&
            const DeepCollectionEquality().equals(other.otherCost, otherCost));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(purchaseDate),
      const DeepCollectionEquality().hash(purchasePrice),
      const DeepCollectionEquality().hash(sellPrice),
      const DeepCollectionEquality().hash(useFba),
      const DeepCollectionEquality().hash(profitPerItem),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(condition),
      const DeepCollectionEquality().hash(subCondition),
      const DeepCollectionEquality().hash(sku),
      const DeepCollectionEquality().hash(memo),
      const DeepCollectionEquality().hash(item),
      const DeepCollectionEquality().hash(retailer),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(breakEven),
      const DeepCollectionEquality().hash(listingDate),
      const DeepCollectionEquality().hash(autogenSku),
      const DeepCollectionEquality().hash(conditionText),
      const DeepCollectionEquality().hash(otherCost));

  @JsonKey(ignore: true)
  @override
  _$$_StockItemCopyWith<_$_StockItem> get copyWith =>
      __$$_StockItemCopyWithImpl<_$_StockItem>(this, _$identity);
}

abstract class _StockItem implements StockItem {
  const factory _StockItem(
      {@HiveField(0) required final String purchaseDate,
      @HiveField(1) final int purchasePrice,
      @HiveField(2) final int sellPrice,
      @HiveField(3) final bool useFba,
      @HiveField(4) final int profitPerItem,
      @HiveField(5) final int amount,
      @HiveField(6) final ItemCondition condition,
      @HiveField(7) final ItemSubCondition subCondition,
      @HiveField(8) final String sku,
      @HiveField(9) final String memo,
      @HiveField(10) required final AsinData item,
      @HiveField(11, defaultValue: "") final String retailer,
      @HiveField(12, defaultValue: "") required final String id,
      @HiveField(13, defaultValue: -1) final int breakEven,
      @HiveField(14) final String? listingDate,
      final bool autogenSku,
      @HiveField(15, defaultValue: "") final String conditionText,
      @HiveField(16, defaultValue: 0) final int otherCost}) = _$_StockItem;

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
  @HiveField(14)
  String? get listingDate;
  @override // 仕入れ確定した後はデフォルト false とするが、仕入れ時にはデフォルト true で、
// 仕入れ画面で切り替えられるように、永続化はしないがメンバとして値を持っておく
  bool get autogenSku;
  @override
  @HiveField(15, defaultValue: "")
  String get conditionText;
  @override
  @HiveField(16, defaultValue: 0)
  int get otherCost;
  @override
  @JsonKey(ignore: true)
  _$$_StockItemCopyWith<_$_StockItem> get copyWith =>
      throw _privateConstructorUsedError;
}
