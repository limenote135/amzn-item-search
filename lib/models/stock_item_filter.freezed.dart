// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_item_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StockItemFilter {
  String? get keyword => throw _privateConstructorUsedError;
  ListingState get listingState => throw _privateConstructorUsedError;
  ProductCondition get productCondition => throw _privateConstructorUsedError;
  FulfilmentChannel get channel => throw _privateConstructorUsedError;
  int? get purchasePriceLower => throw _privateConstructorUsedError;
  int? get purchasePriceUpper => throw _privateConstructorUsedError;
  int? get sellPriceLower => throw _privateConstructorUsedError;
  int? get sellPriceUpper => throw _privateConstructorUsedError;
  DateTimeRange? get purchaseDateRange => throw _privateConstructorUsedError;
  String? get retailer => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String? keyword,
            ListingState listingState,
            ProductCondition productCondition,
            FulfilmentChannel channel,
            int? purchasePriceLower,
            int? purchasePriceUpper,
            int? sellPriceLower,
            int? sellPriceUpper,
            DateTimeRange? purchaseDateRange,
            String? retailer)
        $default,
  ) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String? keyword,
            ListingState listingState,
            ProductCondition productCondition,
            FulfilmentChannel channel,
            int? purchasePriceLower,
            int? purchasePriceUpper,
            int? sellPriceLower,
            int? sellPriceUpper,
            DateTimeRange? purchaseDateRange,
            String? retailer)?
        $default, {
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of StockItemFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockItemFilterCopyWith<StockItemFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockItemFilterCopyWith<$Res> {
  factory $StockItemFilterCopyWith(
          StockItemFilter value, $Res Function(StockItemFilter) then) =
      _$StockItemFilterCopyWithImpl<$Res, StockItemFilter>;
  @useResult
  $Res call(
      {String? keyword,
      ListingState listingState,
      ProductCondition productCondition,
      FulfilmentChannel channel,
      int? purchasePriceLower,
      int? purchasePriceUpper,
      int? sellPriceLower,
      int? sellPriceUpper,
      DateTimeRange? purchaseDateRange,
      String? retailer});
}

/// @nodoc
class _$StockItemFilterCopyWithImpl<$Res, $Val extends StockItemFilter>
    implements $StockItemFilterCopyWith<$Res> {
  _$StockItemFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockItemFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = freezed,
    Object? listingState = null,
    Object? productCondition = null,
    Object? channel = null,
    Object? purchasePriceLower = freezed,
    Object? purchasePriceUpper = freezed,
    Object? sellPriceLower = freezed,
    Object? sellPriceUpper = freezed,
    Object? purchaseDateRange = freezed,
    Object? retailer = freezed,
  }) {
    return _then(_value.copyWith(
      keyword: freezed == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String?,
      listingState: null == listingState
          ? _value.listingState
          : listingState // ignore: cast_nullable_to_non_nullable
              as ListingState,
      productCondition: null == productCondition
          ? _value.productCondition
          : productCondition // ignore: cast_nullable_to_non_nullable
              as ProductCondition,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as FulfilmentChannel,
      purchasePriceLower: freezed == purchasePriceLower
          ? _value.purchasePriceLower
          : purchasePriceLower // ignore: cast_nullable_to_non_nullable
              as int?,
      purchasePriceUpper: freezed == purchasePriceUpper
          ? _value.purchasePriceUpper
          : purchasePriceUpper // ignore: cast_nullable_to_non_nullable
              as int?,
      sellPriceLower: freezed == sellPriceLower
          ? _value.sellPriceLower
          : sellPriceLower // ignore: cast_nullable_to_non_nullable
              as int?,
      sellPriceUpper: freezed == sellPriceUpper
          ? _value.sellPriceUpper
          : sellPriceUpper // ignore: cast_nullable_to_non_nullable
              as int?,
      purchaseDateRange: freezed == purchaseDateRange
          ? _value.purchaseDateRange
          : purchaseDateRange // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
      retailer: freezed == retailer
          ? _value.retailer
          : retailer // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockItemFilterImplCopyWith<$Res>
    implements $StockItemFilterCopyWith<$Res> {
  factory _$$StockItemFilterImplCopyWith(_$StockItemFilterImpl value,
          $Res Function(_$StockItemFilterImpl) then) =
      __$$StockItemFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? keyword,
      ListingState listingState,
      ProductCondition productCondition,
      FulfilmentChannel channel,
      int? purchasePriceLower,
      int? purchasePriceUpper,
      int? sellPriceLower,
      int? sellPriceUpper,
      DateTimeRange? purchaseDateRange,
      String? retailer});
}

/// @nodoc
class __$$StockItemFilterImplCopyWithImpl<$Res>
    extends _$StockItemFilterCopyWithImpl<$Res, _$StockItemFilterImpl>
    implements _$$StockItemFilterImplCopyWith<$Res> {
  __$$StockItemFilterImplCopyWithImpl(
      _$StockItemFilterImpl _value, $Res Function(_$StockItemFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockItemFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = freezed,
    Object? listingState = null,
    Object? productCondition = null,
    Object? channel = null,
    Object? purchasePriceLower = freezed,
    Object? purchasePriceUpper = freezed,
    Object? sellPriceLower = freezed,
    Object? sellPriceUpper = freezed,
    Object? purchaseDateRange = freezed,
    Object? retailer = freezed,
  }) {
    return _then(_$StockItemFilterImpl(
      keyword: freezed == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String?,
      listingState: null == listingState
          ? _value.listingState
          : listingState // ignore: cast_nullable_to_non_nullable
              as ListingState,
      productCondition: null == productCondition
          ? _value.productCondition
          : productCondition // ignore: cast_nullable_to_non_nullable
              as ProductCondition,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as FulfilmentChannel,
      purchasePriceLower: freezed == purchasePriceLower
          ? _value.purchasePriceLower
          : purchasePriceLower // ignore: cast_nullable_to_non_nullable
              as int?,
      purchasePriceUpper: freezed == purchasePriceUpper
          ? _value.purchasePriceUpper
          : purchasePriceUpper // ignore: cast_nullable_to_non_nullable
              as int?,
      sellPriceLower: freezed == sellPriceLower
          ? _value.sellPriceLower
          : sellPriceLower // ignore: cast_nullable_to_non_nullable
              as int?,
      sellPriceUpper: freezed == sellPriceUpper
          ? _value.sellPriceUpper
          : sellPriceUpper // ignore: cast_nullable_to_non_nullable
              as int?,
      purchaseDateRange: freezed == purchaseDateRange
          ? _value.purchaseDateRange
          : purchaseDateRange // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
      retailer: freezed == retailer
          ? _value.retailer
          : retailer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$StockItemFilterImpl implements _StockItemFilter {
  const _$StockItemFilterImpl(
      {this.keyword,
      this.listingState = ListingState.all,
      this.productCondition = ProductCondition.all,
      this.channel = FulfilmentChannel.all,
      this.purchasePriceLower,
      this.purchasePriceUpper,
      this.sellPriceLower,
      this.sellPriceUpper,
      this.purchaseDateRange,
      this.retailer});

  @override
  final String? keyword;
  @override
  @JsonKey()
  final ListingState listingState;
  @override
  @JsonKey()
  final ProductCondition productCondition;
  @override
  @JsonKey()
  final FulfilmentChannel channel;
  @override
  final int? purchasePriceLower;
  @override
  final int? purchasePriceUpper;
  @override
  final int? sellPriceLower;
  @override
  final int? sellPriceUpper;
  @override
  final DateTimeRange? purchaseDateRange;
  @override
  final String? retailer;

  @override
  String toString() {
    return 'StockItemFilter(keyword: $keyword, listingState: $listingState, productCondition: $productCondition, channel: $channel, purchasePriceLower: $purchasePriceLower, purchasePriceUpper: $purchasePriceUpper, sellPriceLower: $sellPriceLower, sellPriceUpper: $sellPriceUpper, purchaseDateRange: $purchaseDateRange, retailer: $retailer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockItemFilterImpl &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            (identical(other.listingState, listingState) ||
                other.listingState == listingState) &&
            (identical(other.productCondition, productCondition) ||
                other.productCondition == productCondition) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.purchasePriceLower, purchasePriceLower) ||
                other.purchasePriceLower == purchasePriceLower) &&
            (identical(other.purchasePriceUpper, purchasePriceUpper) ||
                other.purchasePriceUpper == purchasePriceUpper) &&
            (identical(other.sellPriceLower, sellPriceLower) ||
                other.sellPriceLower == sellPriceLower) &&
            (identical(other.sellPriceUpper, sellPriceUpper) ||
                other.sellPriceUpper == sellPriceUpper) &&
            (identical(other.purchaseDateRange, purchaseDateRange) ||
                other.purchaseDateRange == purchaseDateRange) &&
            (identical(other.retailer, retailer) ||
                other.retailer == retailer));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      keyword,
      listingState,
      productCondition,
      channel,
      purchasePriceLower,
      purchasePriceUpper,
      sellPriceLower,
      sellPriceUpper,
      purchaseDateRange,
      retailer);

  /// Create a copy of StockItemFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockItemFilterImplCopyWith<_$StockItemFilterImpl> get copyWith =>
      __$$StockItemFilterImplCopyWithImpl<_$StockItemFilterImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String? keyword,
            ListingState listingState,
            ProductCondition productCondition,
            FulfilmentChannel channel,
            int? purchasePriceLower,
            int? purchasePriceUpper,
            int? sellPriceLower,
            int? sellPriceUpper,
            DateTimeRange? purchaseDateRange,
            String? retailer)
        $default,
  ) {
    return $default(
        keyword,
        listingState,
        productCondition,
        channel,
        purchasePriceLower,
        purchasePriceUpper,
        sellPriceLower,
        sellPriceUpper,
        purchaseDateRange,
        retailer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String? keyword,
            ListingState listingState,
            ProductCondition productCondition,
            FulfilmentChannel channel,
            int? purchasePriceLower,
            int? purchasePriceUpper,
            int? sellPriceLower,
            int? sellPriceUpper,
            DateTimeRange? purchaseDateRange,
            String? retailer)?
        $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
          keyword,
          listingState,
          productCondition,
          channel,
          purchasePriceLower,
          purchasePriceUpper,
          sellPriceLower,
          sellPriceUpper,
          purchaseDateRange,
          retailer);
    }
    return orElse();
  }
}

abstract class _StockItemFilter implements StockItemFilter {
  const factory _StockItemFilter(
      {final String? keyword,
      final ListingState listingState,
      final ProductCondition productCondition,
      final FulfilmentChannel channel,
      final int? purchasePriceLower,
      final int? purchasePriceUpper,
      final int? sellPriceLower,
      final int? sellPriceUpper,
      final DateTimeRange? purchaseDateRange,
      final String? retailer}) = _$StockItemFilterImpl;

  @override
  String? get keyword;
  @override
  ListingState get listingState;
  @override
  ProductCondition get productCondition;
  @override
  FulfilmentChannel get channel;
  @override
  int? get purchasePriceLower;
  @override
  int? get purchasePriceUpper;
  @override
  int? get sellPriceLower;
  @override
  int? get sellPriceUpper;
  @override
  DateTimeRange? get purchaseDateRange;
  @override
  String? get retailer;

  /// Create a copy of StockItemFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockItemFilterImplCopyWith<_$StockItemFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
