// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listing_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListingItem _$ListingItemFromJson(Map<String, dynamic> json) {
  return _ListingItem.fromJson(json);
}

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
  List<String> get images => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListingItemCopyWith<ListingItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListingItemCopyWith<$Res> {
  factory $ListingItemCopyWith(
          ListingItem value, $Res Function(ListingItem) then) =
      _$ListingItemCopyWithImpl<$Res, ListingItem>;
  @useResult
  $Res call(
      {String sku,
      String asin,
      int sellPrice,
      int amount,
      ItemCondition condition,
      ItemSubCondition subCondition,
      bool useFba,
      String conditionText,
      List<String> images});
}

/// @nodoc
class _$ListingItemCopyWithImpl<$Res, $Val extends ListingItem>
    implements $ListingItemCopyWith<$Res> {
  _$ListingItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sku = null,
    Object? asin = null,
    Object? sellPrice = null,
    Object? amount = null,
    Object? condition = null,
    Object? subCondition = null,
    Object? useFba = null,
    Object? conditionText = null,
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      sku: null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      asin: null == asin
          ? _value.asin
          : asin // ignore: cast_nullable_to_non_nullable
              as String,
      sellPrice: null == sellPrice
          ? _value.sellPrice
          : sellPrice // ignore: cast_nullable_to_non_nullable
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
      useFba: null == useFba
          ? _value.useFba
          : useFba // ignore: cast_nullable_to_non_nullable
              as bool,
      conditionText: null == conditionText
          ? _value.conditionText
          : conditionText // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ListingItemCopyWith<$Res>
    implements $ListingItemCopyWith<$Res> {
  factory _$$_ListingItemCopyWith(
          _$_ListingItem value, $Res Function(_$_ListingItem) then) =
      __$$_ListingItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sku,
      String asin,
      int sellPrice,
      int amount,
      ItemCondition condition,
      ItemSubCondition subCondition,
      bool useFba,
      String conditionText,
      List<String> images});
}

/// @nodoc
class __$$_ListingItemCopyWithImpl<$Res>
    extends _$ListingItemCopyWithImpl<$Res, _$_ListingItem>
    implements _$$_ListingItemCopyWith<$Res> {
  __$$_ListingItemCopyWithImpl(
      _$_ListingItem _value, $Res Function(_$_ListingItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sku = null,
    Object? asin = null,
    Object? sellPrice = null,
    Object? amount = null,
    Object? condition = null,
    Object? subCondition = null,
    Object? useFba = null,
    Object? conditionText = null,
    Object? images = null,
  }) {
    return _then(_$_ListingItem(
      sku: null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      asin: null == asin
          ? _value.asin
          : asin // ignore: cast_nullable_to_non_nullable
              as String,
      sellPrice: null == sellPrice
          ? _value.sellPrice
          : sellPrice // ignore: cast_nullable_to_non_nullable
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
      useFba: null == useFba
          ? _value.useFba
          : useFba // ignore: cast_nullable_to_non_nullable
              as bool,
      conditionText: null == conditionText
          ? _value.conditionText
          : conditionText // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      required this.conditionText,
      final List<String> images = const <String>[]})
      : _images = images;

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
  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'ListingItem(sku: $sku, asin: $asin, sellPrice: $sellPrice, amount: $amount, condition: $condition, subCondition: $subCondition, useFba: $useFba, conditionText: $conditionText, images: $images)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListingItem &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.asin, asin) || other.asin == asin) &&
            (identical(other.sellPrice, sellPrice) ||
                other.sellPrice == sellPrice) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.subCondition, subCondition) ||
                other.subCondition == subCondition) &&
            (identical(other.useFba, useFba) || other.useFba == useFba) &&
            (identical(other.conditionText, conditionText) ||
                other.conditionText == conditionText) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sku,
      asin,
      sellPrice,
      amount,
      condition,
      subCondition,
      useFba,
      conditionText,
      const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListingItemCopyWith<_$_ListingItem> get copyWith =>
      __$$_ListingItemCopyWithImpl<_$_ListingItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListingItemToJson(
      this,
    );
  }
}

abstract class _ListingItem implements ListingItem {
  const factory _ListingItem(
      {required final String sku,
      required final String asin,
      required final int sellPrice,
      required final int amount,
      required final ItemCondition condition,
      required final ItemSubCondition subCondition,
      required final bool useFba,
      required final String conditionText,
      final List<String> images}) = _$_ListingItem;

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
  List<String> get images;
  @override
  @JsonKey(ignore: true)
  _$$_ListingItemCopyWith<_$_ListingItem> get copyWith =>
      throw _privateConstructorUsedError;
}
