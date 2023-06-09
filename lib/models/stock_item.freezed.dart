// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  @HiveField(17, defaultValue: <String>[])
  List<String> get images => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StockItemCopyWith<StockItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockItemCopyWith<$Res> {
  factory $StockItemCopyWith(StockItem value, $Res Function(StockItem) then) =
      _$StockItemCopyWithImpl<$Res, StockItem>;
  @useResult
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
      @HiveField(16, defaultValue: 0) int otherCost,
      @HiveField(17, defaultValue: <String>[]) List<String> images});

  $AsinDataCopyWith<$Res> get item;
}

/// @nodoc
class _$StockItemCopyWithImpl<$Res, $Val extends StockItem>
    implements $StockItemCopyWith<$Res> {
  _$StockItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseDate = null,
    Object? purchasePrice = null,
    Object? sellPrice = null,
    Object? useFba = null,
    Object? profitPerItem = null,
    Object? amount = null,
    Object? condition = null,
    Object? subCondition = null,
    Object? sku = null,
    Object? memo = null,
    Object? item = null,
    Object? retailer = null,
    Object? id = null,
    Object? breakEven = null,
    Object? listingDate = freezed,
    Object? autogenSku = null,
    Object? conditionText = null,
    Object? otherCost = null,
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      purchaseDate: null == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      purchasePrice: null == purchasePrice
          ? _value.purchasePrice
          : purchasePrice // ignore: cast_nullable_to_non_nullable
              as int,
      sellPrice: null == sellPrice
          ? _value.sellPrice
          : sellPrice // ignore: cast_nullable_to_non_nullable
              as int,
      useFba: null == useFba
          ? _value.useFba
          : useFba // ignore: cast_nullable_to_non_nullable
              as bool,
      profitPerItem: null == profitPerItem
          ? _value.profitPerItem
          : profitPerItem // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as ItemCondition,
      subCondition: null == subCondition
          ? _value.subCondition
          : subCondition // ignore: cast_nullable_to_non_nullable
              as ItemSubCondition,
      sku: null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as AsinData,
      retailer: null == retailer
          ? _value.retailer
          : retailer // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      breakEven: null == breakEven
          ? _value.breakEven
          : breakEven // ignore: cast_nullable_to_non_nullable
              as int,
      listingDate: freezed == listingDate
          ? _value.listingDate
          : listingDate // ignore: cast_nullable_to_non_nullable
              as String?,
      autogenSku: null == autogenSku
          ? _value.autogenSku
          : autogenSku // ignore: cast_nullable_to_non_nullable
              as bool,
      conditionText: null == conditionText
          ? _value.conditionText
          : conditionText // ignore: cast_nullable_to_non_nullable
              as String,
      otherCost: null == otherCost
          ? _value.otherCost
          : otherCost // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AsinDataCopyWith<$Res> get item {
    return $AsinDataCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_StockItemCopyWith<$Res> implements $StockItemCopyWith<$Res> {
  factory _$$_StockItemCopyWith(
          _$_StockItem value, $Res Function(_$_StockItem) then) =
      __$$_StockItemCopyWithImpl<$Res>;
  @override
  @useResult
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
      @HiveField(16, defaultValue: 0) int otherCost,
      @HiveField(17, defaultValue: <String>[]) List<String> images});

  @override
  $AsinDataCopyWith<$Res> get item;
}

/// @nodoc
class __$$_StockItemCopyWithImpl<$Res>
    extends _$StockItemCopyWithImpl<$Res, _$_StockItem>
    implements _$$_StockItemCopyWith<$Res> {
  __$$_StockItemCopyWithImpl(
      _$_StockItem _value, $Res Function(_$_StockItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseDate = null,
    Object? purchasePrice = null,
    Object? sellPrice = null,
    Object? useFba = null,
    Object? profitPerItem = null,
    Object? amount = null,
    Object? condition = null,
    Object? subCondition = null,
    Object? sku = null,
    Object? memo = null,
    Object? item = null,
    Object? retailer = null,
    Object? id = null,
    Object? breakEven = null,
    Object? listingDate = freezed,
    Object? autogenSku = null,
    Object? conditionText = null,
    Object? otherCost = null,
    Object? images = null,
  }) {
    return _then(_$_StockItem(
      purchaseDate: null == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      purchasePrice: null == purchasePrice
          ? _value.purchasePrice
          : purchasePrice // ignore: cast_nullable_to_non_nullable
              as int,
      sellPrice: null == sellPrice
          ? _value.sellPrice
          : sellPrice // ignore: cast_nullable_to_non_nullable
              as int,
      useFba: null == useFba
          ? _value.useFba
          : useFba // ignore: cast_nullable_to_non_nullable
              as bool,
      profitPerItem: null == profitPerItem
          ? _value.profitPerItem
          : profitPerItem // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as ItemCondition,
      subCondition: null == subCondition
          ? _value.subCondition
          : subCondition // ignore: cast_nullable_to_non_nullable
              as ItemSubCondition,
      sku: null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as AsinData,
      retailer: null == retailer
          ? _value.retailer
          : retailer // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      breakEven: null == breakEven
          ? _value.breakEven
          : breakEven // ignore: cast_nullable_to_non_nullable
              as int,
      listingDate: freezed == listingDate
          ? _value.listingDate
          : listingDate // ignore: cast_nullable_to_non_nullable
              as String?,
      autogenSku: null == autogenSku
          ? _value.autogenSku
          : autogenSku // ignore: cast_nullable_to_non_nullable
              as bool,
      conditionText: null == conditionText
          ? _value.conditionText
          : conditionText // ignore: cast_nullable_to_non_nullable
              as String,
      otherCost: null == otherCost
          ? _value.otherCost
          : otherCost // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

@HiveType(typeId: stockItemTypeId)
class _$_StockItem implements _StockItem {
  const _$_StockItem(
      {@HiveField(0)
          required this.purchaseDate,
      @HiveField(1)
          this.purchasePrice = 0,
      @HiveField(2)
          this.sellPrice = 0,
      @HiveField(3)
          this.useFba = true,
      @HiveField(4)
          this.profitPerItem = 0,
      @HiveField(5)
          this.amount = 1,
      @HiveField(6)
          this.condition = ItemCondition.newItem,
      @HiveField(7)
          this.subCondition = ItemSubCondition.newItem,
      @HiveField(8)
          this.sku = "",
      @HiveField(9)
          this.memo = "",
      @HiveField(10)
          required this.item,
      @HiveField(11, defaultValue: "")
          this.retailer = "",
      @HiveField(12, defaultValue: "")
          required this.id,
      @HiveField(13, defaultValue: -1)
          this.breakEven = 0,
      @HiveField(14)
          this.listingDate,
      this.autogenSku = false,
      @HiveField(15, defaultValue: "")
          this.conditionText = "",
      @HiveField(16, defaultValue: 0)
          this.otherCost = 0,
      @HiveField(17, defaultValue: <String>[])
          final List<String> images = const <String>[]})
      : _images = images;

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
  final List<String> _images;
  @override
  @JsonKey()
  @HiveField(17, defaultValue: <String>[])
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'StockItem(purchaseDate: $purchaseDate, purchasePrice: $purchasePrice, sellPrice: $sellPrice, useFba: $useFba, profitPerItem: $profitPerItem, amount: $amount, condition: $condition, subCondition: $subCondition, sku: $sku, memo: $memo, item: $item, retailer: $retailer, id: $id, breakEven: $breakEven, listingDate: $listingDate, autogenSku: $autogenSku, conditionText: $conditionText, otherCost: $otherCost, images: $images)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StockItem &&
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
            (identical(other.listingDate, listingDate) ||
                other.listingDate == listingDate) &&
            (identical(other.autogenSku, autogenSku) ||
                other.autogenSku == autogenSku) &&
            (identical(other.conditionText, conditionText) ||
                other.conditionText == conditionText) &&
            (identical(other.otherCost, otherCost) ||
                other.otherCost == otherCost) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @override
  int get hashCode => Object.hashAll([
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
        listingDate,
        autogenSku,
        conditionText,
        otherCost,
        const DeepCollectionEquality().hash(_images)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
          @HiveField(16, defaultValue: 0) final int otherCost,
          @HiveField(17, defaultValue: <String>[]) final List<String> images}) =
      _$_StockItem;

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
  @HiveField(17, defaultValue: <String>[])
  List<String> get images;
  @override
  @JsonKey(ignore: true)
  _$$_StockItemCopyWith<_$_StockItem> get copyWith =>
      throw _privateConstructorUsedError;
}
