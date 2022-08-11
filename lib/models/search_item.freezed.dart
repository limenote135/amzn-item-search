// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchItem {
  @HiveField(0)
  String get searchDate => throw _privateConstructorUsedError;
  @HiveField(1)
  String get jan => throw _privateConstructorUsedError;
  @HiveField(2)
  List<AsinData> get asins => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchItemCopyWith<SearchItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchItemCopyWith<$Res> {
  factory $SearchItemCopyWith(
          SearchItem value, $Res Function(SearchItem) then) =
      _$SearchItemCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String searchDate,
      @HiveField(1) String jan,
      @HiveField(2) List<AsinData> asins});
}

/// @nodoc
class _$SearchItemCopyWithImpl<$Res> implements $SearchItemCopyWith<$Res> {
  _$SearchItemCopyWithImpl(this._value, this._then);

  final SearchItem _value;
  // ignore: unused_field
  final $Res Function(SearchItem) _then;

  @override
  $Res call({
    Object? searchDate = freezed,
    Object? jan = freezed,
    Object? asins = freezed,
  }) {
    return _then(_value.copyWith(
      searchDate: searchDate == freezed
          ? _value.searchDate
          : searchDate // ignore: cast_nullable_to_non_nullable
              as String,
      jan: jan == freezed
          ? _value.jan
          : jan // ignore: cast_nullable_to_non_nullable
              as String,
      asins: asins == freezed
          ? _value.asins
          : asins // ignore: cast_nullable_to_non_nullable
              as List<AsinData>,
    ));
  }
}

/// @nodoc
abstract class _$$_SearchItemCopyWith<$Res>
    implements $SearchItemCopyWith<$Res> {
  factory _$$_SearchItemCopyWith(
          _$_SearchItem value, $Res Function(_$_SearchItem) then) =
      __$$_SearchItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String searchDate,
      @HiveField(1) String jan,
      @HiveField(2) List<AsinData> asins});
}

/// @nodoc
class __$$_SearchItemCopyWithImpl<$Res> extends _$SearchItemCopyWithImpl<$Res>
    implements _$$_SearchItemCopyWith<$Res> {
  __$$_SearchItemCopyWithImpl(
      _$_SearchItem _value, $Res Function(_$_SearchItem) _then)
      : super(_value, (v) => _then(v as _$_SearchItem));

  @override
  _$_SearchItem get _value => super._value as _$_SearchItem;

  @override
  $Res call({
    Object? searchDate = freezed,
    Object? jan = freezed,
    Object? asins = freezed,
  }) {
    return _then(_$_SearchItem(
      searchDate: searchDate == freezed
          ? _value.searchDate
          : searchDate // ignore: cast_nullable_to_non_nullable
              as String,
      jan: jan == freezed
          ? _value.jan
          : jan // ignore: cast_nullable_to_non_nullable
              as String,
      asins: asins == freezed
          ? _value._asins
          : asins // ignore: cast_nullable_to_non_nullable
              as List<AsinData>,
    ));
  }
}

/// @nodoc

@HiveType(typeId: itemTypeId)
class _$_SearchItem implements _SearchItem {
  const _$_SearchItem(
      {@HiveField(0) required this.searchDate,
      @HiveField(1) required this.jan,
      @HiveField(2) final List<AsinData> asins = const <AsinData>[]})
      : _asins = asins;

  @override
  @HiveField(0)
  final String searchDate;
  @override
  @HiveField(1)
  final String jan;
  final List<AsinData> _asins;
  @override
  @JsonKey()
  @HiveField(2)
  List<AsinData> get asins {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_asins);
  }

  @override
  String toString() {
    return 'SearchItem(searchDate: $searchDate, jan: $jan, asins: $asins)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchItem &&
            const DeepCollectionEquality()
                .equals(other.searchDate, searchDate) &&
            const DeepCollectionEquality().equals(other.jan, jan) &&
            const DeepCollectionEquality().equals(other._asins, _asins));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(searchDate),
      const DeepCollectionEquality().hash(jan),
      const DeepCollectionEquality().hash(_asins));

  @JsonKey(ignore: true)
  @override
  _$$_SearchItemCopyWith<_$_SearchItem> get copyWith =>
      __$$_SearchItemCopyWithImpl<_$_SearchItem>(this, _$identity);
}

abstract class _SearchItem implements SearchItem {
  const factory _SearchItem(
      {@HiveField(0) required final String searchDate,
      @HiveField(1) required final String jan,
      @HiveField(2) final List<AsinData> asins}) = _$_SearchItem;

  @override
  @HiveField(0)
  String get searchDate;
  @override
  @HiveField(1)
  String get jan;
  @override
  @HiveField(2)
  List<AsinData> get asins;
  @override
  @JsonKey(ignore: true)
  _$$_SearchItemCopyWith<_$_SearchItem> get copyWith =>
      throw _privateConstructorUsedError;
}

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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AsinDataCopyWith<AsinData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AsinDataCopyWith<$Res> {
  factory $AsinDataCopyWith(AsinData value, $Res Function(AsinData) then) =
      _$AsinDataCopyWithImpl<$Res>;
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
          String model});

  $ItemPricesCopyWith<$Res>? get prices;
  $ListingRestrictionsCopyWith<$Res> get restrictions;
}

/// @nodoc
class _$AsinDataCopyWithImpl<$Res> implements $AsinDataCopyWith<$Res> {
  _$AsinDataCopyWithImpl(this._value, this._then);

  final AsinData _value;
  // ignore: unused_field
  final $Res Function(AsinData) _then;

  @override
  $Res call({
    Object? jan = freezed,
    Object? asin = freezed,
    Object? listPrice = freezed,
    Object? imageUrl = freezed,
    Object? title = freezed,
    Object? rank = freezed,
    Object? quantity = freezed,
    Object? prices = freezed,
    Object? imageData = freezed,
    Object? category = freezed,
    Object? sellByAmazon = freezed,
    Object? restrictions = freezed,
    Object? model = freezed,
  }) {
    return _then(_value.copyWith(
      jan: jan == freezed
          ? _value.jan
          : jan // ignore: cast_nullable_to_non_nullable
              as String,
      asin: asin == freezed
          ? _value.asin
          : asin // ignore: cast_nullable_to_non_nullable
              as String,
      listPrice: listPrice == freezed
          ? _value.listPrice
          : listPrice // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      rank: rank == freezed
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      prices: prices == freezed
          ? _value.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as ItemPrices?,
      imageData: imageData == freezed
          ? _value.imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      sellByAmazon: sellByAmazon == freezed
          ? _value.sellByAmazon
          : sellByAmazon // ignore: cast_nullable_to_non_nullable
              as bool?,
      restrictions: restrictions == freezed
          ? _value.restrictions
          : restrictions // ignore: cast_nullable_to_non_nullable
              as ListingRestrictions,
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $ItemPricesCopyWith<$Res>? get prices {
    if (_value.prices == null) {
      return null;
    }

    return $ItemPricesCopyWith<$Res>(_value.prices!, (value) {
      return _then(_value.copyWith(prices: value));
    });
  }

  @override
  $ListingRestrictionsCopyWith<$Res> get restrictions {
    return $ListingRestrictionsCopyWith<$Res>(_value.restrictions, (value) {
      return _then(_value.copyWith(restrictions: value));
    });
  }
}

/// @nodoc
abstract class _$$_AsinDataCopyWith<$Res> implements $AsinDataCopyWith<$Res> {
  factory _$$_AsinDataCopyWith(
          _$_AsinData value, $Res Function(_$_AsinData) then) =
      __$$_AsinDataCopyWithImpl<$Res>;
  @override
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
          String model});

  @override
  $ItemPricesCopyWith<$Res>? get prices;
  @override
  $ListingRestrictionsCopyWith<$Res> get restrictions;
}

/// @nodoc
class __$$_AsinDataCopyWithImpl<$Res> extends _$AsinDataCopyWithImpl<$Res>
    implements _$$_AsinDataCopyWith<$Res> {
  __$$_AsinDataCopyWithImpl(
      _$_AsinData _value, $Res Function(_$_AsinData) _then)
      : super(_value, (v) => _then(v as _$_AsinData));

  @override
  _$_AsinData get _value => super._value as _$_AsinData;

  @override
  $Res call({
    Object? jan = freezed,
    Object? asin = freezed,
    Object? listPrice = freezed,
    Object? imageUrl = freezed,
    Object? title = freezed,
    Object? rank = freezed,
    Object? quantity = freezed,
    Object? prices = freezed,
    Object? imageData = freezed,
    Object? category = freezed,
    Object? sellByAmazon = freezed,
    Object? restrictions = freezed,
    Object? model = freezed,
  }) {
    return _then(_$_AsinData(
      jan: jan == freezed
          ? _value.jan
          : jan // ignore: cast_nullable_to_non_nullable
              as String,
      asin: asin == freezed
          ? _value.asin
          : asin // ignore: cast_nullable_to_non_nullable
              as String,
      listPrice: listPrice == freezed
          ? _value.listPrice
          : listPrice // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      rank: rank == freezed
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      prices: prices == freezed
          ? _value.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as ItemPrices?,
      imageData: imageData == freezed
          ? _value.imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      sellByAmazon: sellByAmazon == freezed
          ? _value.sellByAmazon
          : sellByAmazon // ignore: cast_nullable_to_non_nullable
              as bool?,
      restrictions: restrictions == freezed
          ? _value.restrictions
          : restrictions // ignore: cast_nullable_to_non_nullable
              as ListingRestrictions,
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
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
          this.model = ""});

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
  String toString() {
    return 'AsinData(jan: $jan, asin: $asin, listPrice: $listPrice, imageUrl: $imageUrl, title: $title, rank: $rank, quantity: $quantity, prices: $prices, imageData: $imageData, category: $category, sellByAmazon: $sellByAmazon, restrictions: $restrictions, model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AsinData &&
            const DeepCollectionEquality().equals(other.jan, jan) &&
            const DeepCollectionEquality().equals(other.asin, asin) &&
            const DeepCollectionEquality().equals(other.listPrice, listPrice) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.rank, rank) &&
            const DeepCollectionEquality().equals(other.quantity, quantity) &&
            const DeepCollectionEquality().equals(other.prices, prices) &&
            const DeepCollectionEquality().equals(other.imageData, imageData) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality()
                .equals(other.sellByAmazon, sellByAmazon) &&
            const DeepCollectionEquality()
                .equals(other.restrictions, restrictions) &&
            const DeepCollectionEquality().equals(other.model, model));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(jan),
      const DeepCollectionEquality().hash(asin),
      const DeepCollectionEquality().hash(listPrice),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(rank),
      const DeepCollectionEquality().hash(quantity),
      const DeepCollectionEquality().hash(prices),
      const DeepCollectionEquality().hash(imageData),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(sellByAmazon),
      const DeepCollectionEquality().hash(restrictions),
      const DeepCollectionEquality().hash(model));

  @JsonKey(ignore: true)
  @override
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
          final String model}) = _$_AsinData;

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
      _$ListingRestrictionsCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) @JsonKey(name: "new", defaultValue: false) bool newItem,
      @HiveField(1) @JsonKey(defaultValue: false) bool used});
}

/// @nodoc
class _$ListingRestrictionsCopyWithImpl<$Res>
    implements $ListingRestrictionsCopyWith<$Res> {
  _$ListingRestrictionsCopyWithImpl(this._value, this._then);

  final ListingRestrictions _value;
  // ignore: unused_field
  final $Res Function(ListingRestrictions) _then;

  @override
  $Res call({
    Object? newItem = freezed,
    Object? used = freezed,
  }) {
    return _then(_value.copyWith(
      newItem: newItem == freezed
          ? _value.newItem
          : newItem // ignore: cast_nullable_to_non_nullable
              as bool,
      used: used == freezed
          ? _value.used
          : used // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_ListingRestrictionsCopyWith<$Res>
    implements $ListingRestrictionsCopyWith<$Res> {
  factory _$$_ListingRestrictionsCopyWith(_$_ListingRestrictions value,
          $Res Function(_$_ListingRestrictions) then) =
      __$$_ListingRestrictionsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) @JsonKey(name: "new", defaultValue: false) bool newItem,
      @HiveField(1) @JsonKey(defaultValue: false) bool used});
}

/// @nodoc
class __$$_ListingRestrictionsCopyWithImpl<$Res>
    extends _$ListingRestrictionsCopyWithImpl<$Res>
    implements _$$_ListingRestrictionsCopyWith<$Res> {
  __$$_ListingRestrictionsCopyWithImpl(_$_ListingRestrictions _value,
      $Res Function(_$_ListingRestrictions) _then)
      : super(_value, (v) => _then(v as _$_ListingRestrictions));

  @override
  _$_ListingRestrictions get _value => super._value as _$_ListingRestrictions;

  @override
  $Res call({
    Object? newItem = freezed,
    Object? used = freezed,
  }) {
    return _then(_$_ListingRestrictions(
      newItem: newItem == freezed
          ? _value.newItem
          : newItem // ignore: cast_nullable_to_non_nullable
              as bool,
      used: used == freezed
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
            const DeepCollectionEquality().equals(other.newItem, newItem) &&
            const DeepCollectionEquality().equals(other.used, used));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(newItem),
      const DeepCollectionEquality().hash(used));

  @JsonKey(ignore: true)
  @override
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
