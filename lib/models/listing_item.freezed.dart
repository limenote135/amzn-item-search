// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'listing_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListingItem _$ListingItemFromJson(Map<String, dynamic> json) {
  return _ListingItem.fromJson(json);
}

/// @nodoc
class _$ListingItemTearOff {
  const _$ListingItemTearOff();

  _ListingItem call(
      {required String sku,
      required String asin,
      required int sellPrice,
      required int amount,
      required ItemCondition condition,
      required ItemSubCondition subCondition,
      required bool useFba,
      required String conditionText}) {
    return _ListingItem(
      sku: sku,
      asin: asin,
      sellPrice: sellPrice,
      amount: amount,
      condition: condition,
      subCondition: subCondition,
      useFba: useFba,
      conditionText: conditionText,
    );
  }

  ListingItem fromJson(Map<String, Object?> json) {
    return ListingItem.fromJson(json);
  }
}

/// @nodoc
const $ListingItem = _$ListingItemTearOff();

/// @nodoc
mixin _$ListingItem {
  String get sku => throw _privateConstructorUsedError;
  String get asin => throw _privateConstructorUsedError;
  int get sellPrice => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  ItemCondition get condition => throw _privateConstructorUsedError;
  ItemSubCondition get subCondition => throw _privateConstructorUsedError;
  bool get useFba => throw _privateConstructorUsedError;
  String get conditionText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListingItemCopyWith<ListingItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListingItemCopyWith<$Res> {
  factory $ListingItemCopyWith(
          ListingItem value, $Res Function(ListingItem) then) =
      _$ListingItemCopyWithImpl<$Res>;
  $Res call(
      {String sku,
      String asin,
      int sellPrice,
      int amount,
      ItemCondition condition,
      ItemSubCondition subCondition,
      bool useFba,
      String conditionText});
}

/// @nodoc
class _$ListingItemCopyWithImpl<$Res> implements $ListingItemCopyWith<$Res> {
  _$ListingItemCopyWithImpl(this._value, this._then);

  final ListingItem _value;
  // ignore: unused_field
  final $Res Function(ListingItem) _then;

  @override
  $Res call({
    Object? sku = freezed,
    Object? asin = freezed,
    Object? sellPrice = freezed,
    Object? amount = freezed,
    Object? condition = freezed,
    Object? subCondition = freezed,
    Object? useFba = freezed,
    Object? conditionText = freezed,
  }) {
    return _then(_value.copyWith(
      sku: sku == freezed
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      asin: asin == freezed
          ? _value.asin
          : asin // ignore: cast_nullable_to_non_nullable
              as String,
      sellPrice: sellPrice == freezed
          ? _value.sellPrice
          : sellPrice // ignore: cast_nullable_to_non_nullable
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
      useFba: useFba == freezed
          ? _value.useFba
          : useFba // ignore: cast_nullable_to_non_nullable
              as bool,
      conditionText: conditionText == freezed
          ? _value.conditionText
          : conditionText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ListingItemCopyWith<$Res>
    implements $ListingItemCopyWith<$Res> {
  factory _$ListingItemCopyWith(
          _ListingItem value, $Res Function(_ListingItem) then) =
      __$ListingItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {String sku,
      String asin,
      int sellPrice,
      int amount,
      ItemCondition condition,
      ItemSubCondition subCondition,
      bool useFba,
      String conditionText});
}

/// @nodoc
class __$ListingItemCopyWithImpl<$Res> extends _$ListingItemCopyWithImpl<$Res>
    implements _$ListingItemCopyWith<$Res> {
  __$ListingItemCopyWithImpl(
      _ListingItem _value, $Res Function(_ListingItem) _then)
      : super(_value, (v) => _then(v as _ListingItem));

  @override
  _ListingItem get _value => super._value as _ListingItem;

  @override
  $Res call({
    Object? sku = freezed,
    Object? asin = freezed,
    Object? sellPrice = freezed,
    Object? amount = freezed,
    Object? condition = freezed,
    Object? subCondition = freezed,
    Object? useFba = freezed,
    Object? conditionText = freezed,
  }) {
    return _then(_ListingItem(
      sku: sku == freezed
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      asin: asin == freezed
          ? _value.asin
          : asin // ignore: cast_nullable_to_non_nullable
              as String,
      sellPrice: sellPrice == freezed
          ? _value.sellPrice
          : sellPrice // ignore: cast_nullable_to_non_nullable
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
      useFba: useFba == freezed
          ? _value.useFba
          : useFba // ignore: cast_nullable_to_non_nullable
              as bool,
      conditionText: conditionText == freezed
          ? _value.conditionText
          : conditionText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_ListingItem implements _ListingItem {
  const _$_ListingItem(
      {required this.sku,
      required this.asin,
      required this.sellPrice,
      required this.amount,
      required this.condition,
      required this.subCondition,
      required this.useFba,
      required this.conditionText});

  factory _$_ListingItem.fromJson(Map<String, dynamic> json) =>
      _$$_ListingItemFromJson(json);

  @override
  final String sku;
  @override
  final String asin;
  @override
  final int sellPrice;
  @override
  final int amount;
  @override
  final ItemCondition condition;
  @override
  final ItemSubCondition subCondition;
  @override
  final bool useFba;
  @override
  final String conditionText;

  @override
  String toString() {
    return 'ListingItem(sku: $sku, asin: $asin, sellPrice: $sellPrice, amount: $amount, condition: $condition, subCondition: $subCondition, useFba: $useFba, conditionText: $conditionText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListingItem &&
            const DeepCollectionEquality().equals(other.sku, sku) &&
            const DeepCollectionEquality().equals(other.asin, asin) &&
            const DeepCollectionEquality().equals(other.sellPrice, sellPrice) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.condition, condition) &&
            const DeepCollectionEquality()
                .equals(other.subCondition, subCondition) &&
            const DeepCollectionEquality().equals(other.useFba, useFba) &&
            const DeepCollectionEquality()
                .equals(other.conditionText, conditionText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(sku),
      const DeepCollectionEquality().hash(asin),
      const DeepCollectionEquality().hash(sellPrice),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(condition),
      const DeepCollectionEquality().hash(subCondition),
      const DeepCollectionEquality().hash(useFba),
      const DeepCollectionEquality().hash(conditionText));

  @JsonKey(ignore: true)
  @override
  _$ListingItemCopyWith<_ListingItem> get copyWith =>
      __$ListingItemCopyWithImpl<_ListingItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListingItemToJson(this);
  }
}

abstract class _ListingItem implements ListingItem {
  const factory _ListingItem(
      {required String sku,
      required String asin,
      required int sellPrice,
      required int amount,
      required ItemCondition condition,
      required ItemSubCondition subCondition,
      required bool useFba,
      required String conditionText}) = _$_ListingItem;

  factory _ListingItem.fromJson(Map<String, dynamic> json) =
      _$_ListingItem.fromJson;

  @override
  String get sku;
  @override
  String get asin;
  @override
  int get sellPrice;
  @override
  int get amount;
  @override
  ItemCondition get condition;
  @override
  ItemSubCondition get subCondition;
  @override
  bool get useFba;
  @override
  String get conditionText;
  @override
  @JsonKey(ignore: true)
  _$ListingItemCopyWith<_ListingItem> get copyWith =>
      throw _privateConstructorUsedError;
}
