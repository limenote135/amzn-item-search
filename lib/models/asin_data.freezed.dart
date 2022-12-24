// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asin_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AsinData _$AsinDataFromJson(Map<String, dynamic> json) {
  return _AsinData.fromJson(json);
}

/// @nodoc
mixin _$AsinData {
  @HiveField(0)
  String get jan => throw _privateConstructorUsedError;
  @HiveField(1)
  String get asin => throw _privateConstructorUsedError;
  @HiveField(2)
  int get listPrice => throw _privateConstructorUsedError; // 参考価格
  @HiveField(3)
  String get imageUrl => throw _privateConstructorUsedError;
  @HiveField(4)
  String get title => throw _privateConstructorUsedError;
  @HiveField(5)
  int get rank => throw _privateConstructorUsedError;
  @HiveField(6)
  String get quantity => throw _privateConstructorUsedError; // セット数
  @HiveField(7)
  ItemPrices? get prices => throw _privateConstructorUsedError;
  @HiveField(8)
  @JsonKey(ignore: true)
  Uint8List? get imageData => throw _privateConstructorUsedError;
  @HiveField(9, defaultValue: "")
  @ItemCategoryConverter()
  String get category => throw _privateConstructorUsedError;
  @HiveField(10)
  bool? get sellByAmazon => throw _privateConstructorUsedError;
  @HiveField(11, defaultValue: defaultListingRestrictions)
  @JsonKey()
  ListingRestrictions get restrictions => throw _privateConstructorUsedError;
  @HiveField(12, defaultValue: "")
  String get model => throw _privateConstructorUsedError;
  @HiveField(13, defaultValue: "")
  String get variationRoot => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AsinDataCopyWith<AsinData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AsinDataCopyWith<$Res> {
  factory $AsinDataCopyWith(AsinData value, $Res Function(AsinData) then) =
      _$AsinDataCopyWithImpl<$Res, AsinData>;
  @useResult
  $Res call(
      {@HiveField(0)
          String jan,
      @HiveField(1)
          String asin,
      @HiveField(2)
          int listPrice,
      @HiveField(3)
          String imageUrl,
      @HiveField(4)
          String title,
      @HiveField(5)
          int rank,
      @HiveField(6)
          String quantity,
      @HiveField(7)
          ItemPrices? prices,
      @HiveField(8)
      @JsonKey(ignore: true)
          Uint8List? imageData,
      @HiveField(9, defaultValue: "")
      @ItemCategoryConverter()
          String category,
      @HiveField(10)
          bool? sellByAmazon,
      @HiveField(11, defaultValue: defaultListingRestrictions)
      @JsonKey()
          ListingRestrictions restrictions,
      @HiveField(12, defaultValue: "")
          String model,
      @HiveField(13, defaultValue: "")
          String variationRoot});

  $ItemPricesCopyWith<$Res>? get prices;
  $ListingRestrictionsCopyWith<$Res> get restrictions;
}

/// @nodoc
class _$AsinDataCopyWithImpl<$Res, $Val extends AsinData>
    implements $AsinDataCopyWith<$Res> {
  _$AsinDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jan = null,
    Object? asin = null,
    Object? listPrice = null,
    Object? imageUrl = null,
    Object? title = null,
    Object? rank = null,
    Object? quantity = null,
    Object? prices = freezed,
    Object? imageData = freezed,
    Object? category = null,
    Object? sellByAmazon = freezed,
    Object? restrictions = null,
    Object? model = null,
    Object? variationRoot = null,
  }) {
    return _then(_value.copyWith(
      jan: null == jan
          ? _value.jan
          : jan // ignore: cast_nullable_to_non_nullable
              as String,
      asin: null == asin
          ? _value.asin
          : asin // ignore: cast_nullable_to_non_nullable
              as String,
      listPrice: null == listPrice
          ? _value.listPrice
          : listPrice // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      prices: freezed == prices
          ? _value.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as ItemPrices?,
      imageData: freezed == imageData
          ? _value.imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      sellByAmazon: freezed == sellByAmazon
          ? _value.sellByAmazon
          : sellByAmazon // ignore: cast_nullable_to_non_nullable
              as bool?,
      restrictions: null == restrictions
          ? _value.restrictions
          : restrictions // ignore: cast_nullable_to_non_nullable
              as ListingRestrictions,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      variationRoot: null == variationRoot
          ? _value.variationRoot
          : variationRoot // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ItemPricesCopyWith<$Res>? get prices {
    if (_value.prices == null) {
      return null;
    }

    return $ItemPricesCopyWith<$Res>(_value.prices!, (value) {
      return _then(_value.copyWith(prices: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ListingRestrictionsCopyWith<$Res> get restrictions {
    return $ListingRestrictionsCopyWith<$Res>(_value.restrictions, (value) {
      return _then(_value.copyWith(restrictions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AsinDataCopyWith<$Res> implements $AsinDataCopyWith<$Res> {
  factory _$$_AsinDataCopyWith(
          _$_AsinData value, $Res Function(_$_AsinData) then) =
      __$$_AsinDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0)
          String jan,
      @HiveField(1)
          String asin,
      @HiveField(2)
          int listPrice,
      @HiveField(3)
          String imageUrl,
      @HiveField(4)
          String title,
      @HiveField(5)
          int rank,
      @HiveField(6)
          String quantity,
      @HiveField(7)
          ItemPrices? prices,
      @HiveField(8)
      @JsonKey(ignore: true)
          Uint8List? imageData,
      @HiveField(9, defaultValue: "")
      @ItemCategoryConverter()
          String category,
      @HiveField(10)
          bool? sellByAmazon,
      @HiveField(11, defaultValue: defaultListingRestrictions)
      @JsonKey()
          ListingRestrictions restrictions,
      @HiveField(12, defaultValue: "")
          String model,
      @HiveField(13, defaultValue: "")
          String variationRoot});

  @override
  $ItemPricesCopyWith<$Res>? get prices;
  @override
  $ListingRestrictionsCopyWith<$Res> get restrictions;
}

/// @nodoc
class __$$_AsinDataCopyWithImpl<$Res>
    extends _$AsinDataCopyWithImpl<$Res, _$_AsinData>
    implements _$$_AsinDataCopyWith<$Res> {
  __$$_AsinDataCopyWithImpl(
      _$_AsinData _value, $Res Function(_$_AsinData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jan = null,
    Object? asin = null,
    Object? listPrice = null,
    Object? imageUrl = null,
    Object? title = null,
    Object? rank = null,
    Object? quantity = null,
    Object? prices = freezed,
    Object? imageData = freezed,
    Object? category = null,
    Object? sellByAmazon = freezed,
    Object? restrictions = null,
    Object? model = null,
    Object? variationRoot = null,
  }) {
    return _then(_$_AsinData(
      jan: null == jan
          ? _value.jan
          : jan // ignore: cast_nullable_to_non_nullable
              as String,
      asin: null == asin
          ? _value.asin
          : asin // ignore: cast_nullable_to_non_nullable
              as String,
      listPrice: null == listPrice
          ? _value.listPrice
          : listPrice // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      prices: freezed == prices
          ? _value.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as ItemPrices?,
      imageData: freezed == imageData
          ? _value.imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      sellByAmazon: freezed == sellByAmazon
          ? _value.sellByAmazon
          : sellByAmazon // ignore: cast_nullable_to_non_nullable
              as bool?,
      restrictions: null == restrictions
          ? _value.restrictions
          : restrictions // ignore: cast_nullable_to_non_nullable
              as ListingRestrictions,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      variationRoot: null == variationRoot
          ? _value.variationRoot
          : variationRoot // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
@HiveType(typeId: asinDataTypeId)
class _$_AsinData implements _AsinData {
  const _$_AsinData(
      {@HiveField(0)
          this.jan = "",
      @HiveField(1)
          required this.asin,
      @HiveField(2)
          this.listPrice = 0,
      @HiveField(3)
          required this.imageUrl,
      @HiveField(4)
          required this.title,
      @HiveField(5)
          this.rank = 0,
      @HiveField(6)
          this.quantity = " - ",
      @HiveField(7)
          this.prices,
      @HiveField(8)
      @JsonKey(ignore: true)
          this.imageData,
      @HiveField(9, defaultValue: "")
      @ItemCategoryConverter()
          required this.category,
      @HiveField(10)
          this.sellByAmazon,
      @HiveField(11, defaultValue: defaultListingRestrictions)
      @JsonKey()
          this.restrictions = defaultListingRestrictions,
      @HiveField(12, defaultValue: "")
          this.model = "",
      @HiveField(13, defaultValue: "")
          this.variationRoot = ""});

  factory _$_AsinData.fromJson(Map<String, dynamic> json) =>
      _$$_AsinDataFromJson(json);

  @override
  @JsonKey()
  @HiveField(0)
  final String jan;
  @override
  @HiveField(1)
  final String asin;
  @override
  @JsonKey()
  @HiveField(2)
  final int listPrice;
// 参考価格
  @override
  @HiveField(3)
  final String imageUrl;
  @override
  @HiveField(4)
  final String title;
  @override
  @JsonKey()
  @HiveField(5)
  final int rank;
  @override
  @JsonKey()
  @HiveField(6)
  final String quantity;
// セット数
  @override
  @HiveField(7)
  final ItemPrices? prices;
  @override
  @HiveField(8)
  @JsonKey(ignore: true)
  final Uint8List? imageData;
  @override
  @HiveField(9, defaultValue: "")
  @ItemCategoryConverter()
  final String category;
  @override
  @HiveField(10)
  final bool? sellByAmazon;
  @override
  @HiveField(11, defaultValue: defaultListingRestrictions)
  @JsonKey()
  final ListingRestrictions restrictions;
  @override
  @JsonKey()
  @HiveField(12, defaultValue: "")
  final String model;
  @override
  @JsonKey()
  @HiveField(13, defaultValue: "")
  final String variationRoot;

  @override
  String toString() {
    return 'AsinData(jan: $jan, asin: $asin, listPrice: $listPrice, imageUrl: $imageUrl, title: $title, rank: $rank, quantity: $quantity, prices: $prices, imageData: $imageData, category: $category, sellByAmazon: $sellByAmazon, restrictions: $restrictions, model: $model, variationRoot: $variationRoot)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AsinData &&
            (identical(other.jan, jan) || other.jan == jan) &&
            (identical(other.asin, asin) || other.asin == asin) &&
            (identical(other.listPrice, listPrice) ||
                other.listPrice == listPrice) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.prices, prices) || other.prices == prices) &&
            const DeepCollectionEquality().equals(other.imageData, imageData) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.sellByAmazon, sellByAmazon) ||
                other.sellByAmazon == sellByAmazon) &&
            (identical(other.restrictions, restrictions) ||
                other.restrictions == restrictions) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.variationRoot, variationRoot) ||
                other.variationRoot == variationRoot));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      jan,
      asin,
      listPrice,
      imageUrl,
      title,
      rank,
      quantity,
      prices,
      const DeepCollectionEquality().hash(imageData),
      category,
      sellByAmazon,
      restrictions,
      model,
      variationRoot);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AsinDataCopyWith<_$_AsinData> get copyWith =>
      __$$_AsinDataCopyWithImpl<_$_AsinData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AsinDataToJson(
      this,
    );
  }
}

abstract class _AsinData implements AsinData {
  const factory _AsinData(
      {@HiveField(0)
          final String jan,
      @HiveField(1)
          required final String asin,
      @HiveField(2)
          final int listPrice,
      @HiveField(3)
          required final String imageUrl,
      @HiveField(4)
          required final String title,
      @HiveField(5)
          final int rank,
      @HiveField(6)
          final String quantity,
      @HiveField(7)
          final ItemPrices? prices,
      @HiveField(8)
      @JsonKey(ignore: true)
          final Uint8List? imageData,
      @HiveField(9, defaultValue: "")
      @ItemCategoryConverter()
          required final String category,
      @HiveField(10)
          final bool? sellByAmazon,
      @HiveField(11, defaultValue: defaultListingRestrictions)
      @JsonKey()
          final ListingRestrictions restrictions,
      @HiveField(12, defaultValue: "")
          final String model,
      @HiveField(13, defaultValue: "")
          final String variationRoot}) = _$_AsinData;

  factory _AsinData.fromJson(Map<String, dynamic> json) = _$_AsinData.fromJson;

  @override
  @HiveField(0)
  String get jan;
  @override
  @HiveField(1)
  String get asin;
  @override
  @HiveField(2)
  int get listPrice;
  @override // 参考価格
  @HiveField(3)
  String get imageUrl;
  @override
  @HiveField(4)
  String get title;
  @override
  @HiveField(5)
  int get rank;
  @override
  @HiveField(6)
  String get quantity;
  @override // セット数
  @HiveField(7)
  ItemPrices? get prices;
  @override
  @HiveField(8)
  @JsonKey(ignore: true)
  Uint8List? get imageData;
  @override
  @HiveField(9, defaultValue: "")
  @ItemCategoryConverter()
  String get category;
  @override
  @HiveField(10)
  bool? get sellByAmazon;
  @override
  @HiveField(11, defaultValue: defaultListingRestrictions)
  @JsonKey()
  ListingRestrictions get restrictions;
  @override
  @HiveField(12, defaultValue: "")
  String get model;
  @override
  @HiveField(13, defaultValue: "")
  String get variationRoot;
  @override
  @JsonKey(ignore: true)
  _$$_AsinDataCopyWith<_$_AsinData> get copyWith =>
      throw _privateConstructorUsedError;
}

ListingRestrictions _$ListingRestrictionsFromJson(Map<String, dynamic> json) {
  return _ListingRestrictions.fromJson(json);
}

/// @nodoc
mixin _$ListingRestrictions {
  @HiveField(0)
  @JsonKey(name: "new", defaultValue: false)
  bool get newItem => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(defaultValue: false)
  bool get used => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListingRestrictionsCopyWith<ListingRestrictions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListingRestrictionsCopyWith<$Res> {
  factory $ListingRestrictionsCopyWith(
          ListingRestrictions value, $Res Function(ListingRestrictions) then) =
      _$ListingRestrictionsCopyWithImpl<$Res, ListingRestrictions>;
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: "new", defaultValue: false) bool newItem,
      @HiveField(1) @JsonKey(defaultValue: false) bool used});
}

/// @nodoc
class _$ListingRestrictionsCopyWithImpl<$Res, $Val extends ListingRestrictions>
    implements $ListingRestrictionsCopyWith<$Res> {
  _$ListingRestrictionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newItem = null,
    Object? used = null,
  }) {
    return _then(_value.copyWith(
      newItem: null == newItem
          ? _value.newItem
          : newItem // ignore: cast_nullable_to_non_nullable
              as bool,
      used: null == used
          ? _value.used
          : used // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ListingRestrictionsCopyWith<$Res>
    implements $ListingRestrictionsCopyWith<$Res> {
  factory _$$_ListingRestrictionsCopyWith(_$_ListingRestrictions value,
          $Res Function(_$_ListingRestrictions) then) =
      __$$_ListingRestrictionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: "new", defaultValue: false) bool newItem,
      @HiveField(1) @JsonKey(defaultValue: false) bool used});
}

/// @nodoc
class __$$_ListingRestrictionsCopyWithImpl<$Res>
    extends _$ListingRestrictionsCopyWithImpl<$Res, _$_ListingRestrictions>
    implements _$$_ListingRestrictionsCopyWith<$Res> {
  __$$_ListingRestrictionsCopyWithImpl(_$_ListingRestrictions _value,
      $Res Function(_$_ListingRestrictions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newItem = null,
    Object? used = null,
  }) {
    return _then(_$_ListingRestrictions(
      newItem: null == newItem
          ? _value.newItem
          : newItem // ignore: cast_nullable_to_non_nullable
              as bool,
      used: null == used
          ? _value.used
          : used // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
@HiveType(typeId: listingRestrictionTypeId)
class _$_ListingRestrictions implements _ListingRestrictions {
  const _$_ListingRestrictions(
      {@HiveField(0)
      @JsonKey(name: "new", defaultValue: false)
          this.newItem = false,
      @HiveField(1)
      @JsonKey(defaultValue: false)
          this.used = false});

  factory _$_ListingRestrictions.fromJson(Map<String, dynamic> json) =>
      _$$_ListingRestrictionsFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: "new", defaultValue: false)
  final bool newItem;
  @override
  @HiveField(1)
  @JsonKey(defaultValue: false)
  final bool used;

  @override
  String toString() {
    return 'ListingRestrictions(newItem: $newItem, used: $used)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListingRestrictions &&
            (identical(other.newItem, newItem) || other.newItem == newItem) &&
            (identical(other.used, used) || other.used == used));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, newItem, used);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListingRestrictionsCopyWith<_$_ListingRestrictions> get copyWith =>
      __$$_ListingRestrictionsCopyWithImpl<_$_ListingRestrictions>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListingRestrictionsToJson(
      this,
    );
  }
}

abstract class _ListingRestrictions implements ListingRestrictions {
  const factory _ListingRestrictions(
      {@HiveField(0)
      @JsonKey(name: "new", defaultValue: false)
          final bool newItem,
      @HiveField(1)
      @JsonKey(defaultValue: false)
          final bool used}) = _$_ListingRestrictions;

  factory _ListingRestrictions.fromJson(Map<String, dynamic> json) =
      _$_ListingRestrictions.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: "new", defaultValue: false)
  bool get newItem;
  @override
  @HiveField(1)
  @JsonKey(defaultValue: false)
  bool get used;
  @override
  @JsonKey(ignore: true)
  _$$_ListingRestrictionsCopyWith<_$_ListingRestrictions> get copyWith =>
      throw _privateConstructorUsedError;
}
