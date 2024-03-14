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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
  @JsonKey(includeFromJson: false, includeToJson: false)
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
  @HiveField(14, defaultValue: false)
  bool get isHazmat => throw _privateConstructorUsedError;
  @HiveField(15, defaultValue: SizeType.normal)
  @SizeTypeConverter()
  SizeType get sizeType => throw _privateConstructorUsedError;
  @HiveField(16, defaultValue: 0)
  int get smallFee => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  int get defaultPurchasePrice => throw _privateConstructorUsedError;
  @HiveField(17, defaultValue: HazmatType.nonHazmat)
  @HazmatTypeConverter()
  HazmatType get hazmatType => throw _privateConstructorUsedError;

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
      {@HiveField(0) String jan,
      @HiveField(1) String asin,
      @HiveField(2) int listPrice,
      @HiveField(3) String imageUrl,
      @HiveField(4) String title,
      @HiveField(5) int rank,
      @HiveField(6) String quantity,
      @HiveField(7) ItemPrices? prices,
      @HiveField(8)
      @JsonKey(includeFromJson: false, includeToJson: false)
      Uint8List? imageData,
      @HiveField(9, defaultValue: "") @ItemCategoryConverter() String category,
      @HiveField(10) bool? sellByAmazon,
      @HiveField(11, defaultValue: defaultListingRestrictions)
      @JsonKey()
      ListingRestrictions restrictions,
      @HiveField(12, defaultValue: "") String model,
      @HiveField(13, defaultValue: "") String variationRoot,
      @HiveField(14, defaultValue: false) bool isHazmat,
      @HiveField(15, defaultValue: SizeType.normal)
      @SizeTypeConverter()
      SizeType sizeType,
      @HiveField(16, defaultValue: 0) int smallFee,
      @JsonKey(includeFromJson: false, includeToJson: false)
      int defaultPurchasePrice,
      @HiveField(17, defaultValue: HazmatType.nonHazmat)
      @HazmatTypeConverter()
      HazmatType hazmatType});

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
    Object? isHazmat = null,
    Object? sizeType = null,
    Object? smallFee = null,
    Object? defaultPurchasePrice = null,
    Object? hazmatType = null,
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
      isHazmat: null == isHazmat
          ? _value.isHazmat
          : isHazmat // ignore: cast_nullable_to_non_nullable
              as bool,
      sizeType: null == sizeType
          ? _value.sizeType
          : sizeType // ignore: cast_nullable_to_non_nullable
              as SizeType,
      smallFee: null == smallFee
          ? _value.smallFee
          : smallFee // ignore: cast_nullable_to_non_nullable
              as int,
      defaultPurchasePrice: null == defaultPurchasePrice
          ? _value.defaultPurchasePrice
          : defaultPurchasePrice // ignore: cast_nullable_to_non_nullable
              as int,
      hazmatType: null == hazmatType
          ? _value.hazmatType
          : hazmatType // ignore: cast_nullable_to_non_nullable
              as HazmatType,
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
abstract class _$$AsinDataImplCopyWith<$Res>
    implements $AsinDataCopyWith<$Res> {
  factory _$$AsinDataImplCopyWith(
          _$AsinDataImpl value, $Res Function(_$AsinDataImpl) then) =
      __$$AsinDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String jan,
      @HiveField(1) String asin,
      @HiveField(2) int listPrice,
      @HiveField(3) String imageUrl,
      @HiveField(4) String title,
      @HiveField(5) int rank,
      @HiveField(6) String quantity,
      @HiveField(7) ItemPrices? prices,
      @HiveField(8)
      @JsonKey(includeFromJson: false, includeToJson: false)
      Uint8List? imageData,
      @HiveField(9, defaultValue: "") @ItemCategoryConverter() String category,
      @HiveField(10) bool? sellByAmazon,
      @HiveField(11, defaultValue: defaultListingRestrictions)
      @JsonKey()
      ListingRestrictions restrictions,
      @HiveField(12, defaultValue: "") String model,
      @HiveField(13, defaultValue: "") String variationRoot,
      @HiveField(14, defaultValue: false) bool isHazmat,
      @HiveField(15, defaultValue: SizeType.normal)
      @SizeTypeConverter()
      SizeType sizeType,
      @HiveField(16, defaultValue: 0) int smallFee,
      @JsonKey(includeFromJson: false, includeToJson: false)
      int defaultPurchasePrice,
      @HiveField(17, defaultValue: HazmatType.nonHazmat)
      @HazmatTypeConverter()
      HazmatType hazmatType});

  @override
  $ItemPricesCopyWith<$Res>? get prices;
  @override
  $ListingRestrictionsCopyWith<$Res> get restrictions;
}

/// @nodoc
class __$$AsinDataImplCopyWithImpl<$Res>
    extends _$AsinDataCopyWithImpl<$Res, _$AsinDataImpl>
    implements _$$AsinDataImplCopyWith<$Res> {
  __$$AsinDataImplCopyWithImpl(
      _$AsinDataImpl _value, $Res Function(_$AsinDataImpl) _then)
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
    Object? isHazmat = null,
    Object? sizeType = null,
    Object? smallFee = null,
    Object? defaultPurchasePrice = null,
    Object? hazmatType = null,
  }) {
    return _then(_$AsinDataImpl(
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
      isHazmat: null == isHazmat
          ? _value.isHazmat
          : isHazmat // ignore: cast_nullable_to_non_nullable
              as bool,
      sizeType: null == sizeType
          ? _value.sizeType
          : sizeType // ignore: cast_nullable_to_non_nullable
              as SizeType,
      smallFee: null == smallFee
          ? _value.smallFee
          : smallFee // ignore: cast_nullable_to_non_nullable
              as int,
      defaultPurchasePrice: null == defaultPurchasePrice
          ? _value.defaultPurchasePrice
          : defaultPurchasePrice // ignore: cast_nullable_to_non_nullable
              as int,
      hazmatType: null == hazmatType
          ? _value.hazmatType
          : hazmatType // ignore: cast_nullable_to_non_nullable
              as HazmatType,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
@HiveType(typeId: asinDataTypeId)
class _$AsinDataImpl implements _AsinData {
  const _$AsinDataImpl(
      {@HiveField(0) this.jan = "",
      @HiveField(1) required this.asin,
      @HiveField(2) this.listPrice = 0,
      @HiveField(3) required this.imageUrl,
      @HiveField(4) required this.title,
      @HiveField(5) this.rank = 0,
      @HiveField(6) this.quantity = " - ",
      @HiveField(7) this.prices,
      @HiveField(8)
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.imageData,
      @HiveField(9, defaultValue: "")
      @ItemCategoryConverter()
      required this.category,
      @HiveField(10) this.sellByAmazon,
      @HiveField(11, defaultValue: defaultListingRestrictions)
      @JsonKey()
      this.restrictions = defaultListingRestrictions,
      @HiveField(12, defaultValue: "") this.model = "",
      @HiveField(13, defaultValue: "") this.variationRoot = "",
      @HiveField(14, defaultValue: false) this.isHazmat = false,
      @HiveField(15, defaultValue: SizeType.normal)
      @SizeTypeConverter()
      this.sizeType = SizeType.normal,
      @HiveField(16, defaultValue: 0) this.smallFee = 0,
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.defaultPurchasePrice = 0,
      @HiveField(17, defaultValue: HazmatType.nonHazmat)
      @HazmatTypeConverter()
      this.hazmatType = HazmatType.nonHazmat});

  factory _$AsinDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AsinDataImplFromJson(json);

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
  @JsonKey(includeFromJson: false, includeToJson: false)
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
  @JsonKey()
  @HiveField(14, defaultValue: false)
  final bool isHazmat;
  @override
  @JsonKey()
  @HiveField(15, defaultValue: SizeType.normal)
  @SizeTypeConverter()
  final SizeType sizeType;
  @override
  @JsonKey()
  @HiveField(16, defaultValue: 0)
  final int smallFee;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final int defaultPurchasePrice;
  @override
  @JsonKey()
  @HiveField(17, defaultValue: HazmatType.nonHazmat)
  @HazmatTypeConverter()
  final HazmatType hazmatType;

  @override
  String toString() {
    return 'AsinData(jan: $jan, asin: $asin, listPrice: $listPrice, imageUrl: $imageUrl, title: $title, rank: $rank, quantity: $quantity, prices: $prices, imageData: $imageData, category: $category, sellByAmazon: $sellByAmazon, restrictions: $restrictions, model: $model, variationRoot: $variationRoot, isHazmat: $isHazmat, sizeType: $sizeType, smallFee: $smallFee, defaultPurchasePrice: $defaultPurchasePrice, hazmatType: $hazmatType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AsinDataImpl &&
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
                other.variationRoot == variationRoot) &&
            (identical(other.isHazmat, isHazmat) ||
                other.isHazmat == isHazmat) &&
            (identical(other.sizeType, sizeType) ||
                other.sizeType == sizeType) &&
            (identical(other.smallFee, smallFee) ||
                other.smallFee == smallFee) &&
            (identical(other.defaultPurchasePrice, defaultPurchasePrice) ||
                other.defaultPurchasePrice == defaultPurchasePrice) &&
            (identical(other.hazmatType, hazmatType) ||
                other.hazmatType == hazmatType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
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
        variationRoot,
        isHazmat,
        sizeType,
        smallFee,
        defaultPurchasePrice,
        hazmatType
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AsinDataImplCopyWith<_$AsinDataImpl> get copyWith =>
      __$$AsinDataImplCopyWithImpl<_$AsinDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AsinDataImplToJson(
      this,
    );
  }
}

abstract class _AsinData implements AsinData {
  const factory _AsinData(
      {@HiveField(0) final String jan,
      @HiveField(1) required final String asin,
      @HiveField(2) final int listPrice,
      @HiveField(3) required final String imageUrl,
      @HiveField(4) required final String title,
      @HiveField(5) final int rank,
      @HiveField(6) final String quantity,
      @HiveField(7) final ItemPrices? prices,
      @HiveField(8)
      @JsonKey(includeFromJson: false, includeToJson: false)
      final Uint8List? imageData,
      @HiveField(9, defaultValue: "")
      @ItemCategoryConverter()
      required final String category,
      @HiveField(10) final bool? sellByAmazon,
      @HiveField(11, defaultValue: defaultListingRestrictions)
      @JsonKey()
      final ListingRestrictions restrictions,
      @HiveField(12, defaultValue: "") final String model,
      @HiveField(13, defaultValue: "") final String variationRoot,
      @HiveField(14, defaultValue: false) final bool isHazmat,
      @HiveField(15, defaultValue: SizeType.normal)
      @SizeTypeConverter()
      final SizeType sizeType,
      @HiveField(16, defaultValue: 0) final int smallFee,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final int defaultPurchasePrice,
      @HiveField(17, defaultValue: HazmatType.nonHazmat)
      @HazmatTypeConverter()
      final HazmatType hazmatType}) = _$AsinDataImpl;

  factory _AsinData.fromJson(Map<String, dynamic> json) =
      _$AsinDataImpl.fromJson;

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
  @JsonKey(includeFromJson: false, includeToJson: false)
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
  @HiveField(14, defaultValue: false)
  bool get isHazmat;
  @override
  @HiveField(15, defaultValue: SizeType.normal)
  @SizeTypeConverter()
  SizeType get sizeType;
  @override
  @HiveField(16, defaultValue: 0)
  int get smallFee;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  int get defaultPurchasePrice;
  @override
  @HiveField(17, defaultValue: HazmatType.nonHazmat)
  @HazmatTypeConverter()
  HazmatType get hazmatType;
  @override
  @JsonKey(ignore: true)
  _$$AsinDataImplCopyWith<_$AsinDataImpl> get copyWith =>
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
abstract class _$$ListingRestrictionsImplCopyWith<$Res>
    implements $ListingRestrictionsCopyWith<$Res> {
  factory _$$ListingRestrictionsImplCopyWith(_$ListingRestrictionsImpl value,
          $Res Function(_$ListingRestrictionsImpl) then) =
      __$$ListingRestrictionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: "new", defaultValue: false) bool newItem,
      @HiveField(1) @JsonKey(defaultValue: false) bool used});
}

/// @nodoc
class __$$ListingRestrictionsImplCopyWithImpl<$Res>
    extends _$ListingRestrictionsCopyWithImpl<$Res, _$ListingRestrictionsImpl>
    implements _$$ListingRestrictionsImplCopyWith<$Res> {
  __$$ListingRestrictionsImplCopyWithImpl(_$ListingRestrictionsImpl _value,
      $Res Function(_$ListingRestrictionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newItem = null,
    Object? used = null,
  }) {
    return _then(_$ListingRestrictionsImpl(
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
class _$ListingRestrictionsImpl implements _ListingRestrictions {
  const _$ListingRestrictionsImpl(
      {@HiveField(0)
      @JsonKey(name: "new", defaultValue: false)
      this.newItem = false,
      @HiveField(1) @JsonKey(defaultValue: false) this.used = false});

  factory _$ListingRestrictionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListingRestrictionsImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListingRestrictionsImpl &&
            (identical(other.newItem, newItem) || other.newItem == newItem) &&
            (identical(other.used, used) || other.used == used));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, newItem, used);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListingRestrictionsImplCopyWith<_$ListingRestrictionsImpl> get copyWith =>
      __$$ListingRestrictionsImplCopyWithImpl<_$ListingRestrictionsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListingRestrictionsImplToJson(
      this,
    );
  }
}

abstract class _ListingRestrictions implements ListingRestrictions {
  const factory _ListingRestrictions(
          {@HiveField(0)
          @JsonKey(name: "new", defaultValue: false)
          final bool newItem,
          @HiveField(1) @JsonKey(defaultValue: false) final bool used}) =
      _$ListingRestrictionsImpl;

  factory _ListingRestrictions.fromJson(Map<String, dynamic> json) =
      _$ListingRestrictionsImpl.fromJson;

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
  _$$ListingRestrictionsImplCopyWith<_$ListingRestrictionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
