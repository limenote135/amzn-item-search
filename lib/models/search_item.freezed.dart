// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchItem {
  @HiveField(0)
  String get searchDate => throw _privateConstructorUsedError;
  @HiveField(1)
  String get jan => throw _privateConstructorUsedError;
  @HiveField(2)
  List<AsinData> get asins => throw _privateConstructorUsedError;
  int get defaultPurchasePrice => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchItemCopyWith<SearchItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchItemCopyWith<$Res> {
  factory $SearchItemCopyWith(
          SearchItem value, $Res Function(SearchItem) then) =
      _$SearchItemCopyWithImpl<$Res, SearchItem>;
  @useResult
  $Res call(
      {@HiveField(0) String searchDate,
      @HiveField(1) String jan,
      @HiveField(2) List<AsinData> asins,
      int defaultPurchasePrice});
}

/// @nodoc
class _$SearchItemCopyWithImpl<$Res, $Val extends SearchItem>
    implements $SearchItemCopyWith<$Res> {
  _$SearchItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchDate = null,
    Object? jan = null,
    Object? asins = null,
    Object? defaultPurchasePrice = null,
  }) {
    return _then(_value.copyWith(
      searchDate: null == searchDate
          ? _value.searchDate
          : searchDate // ignore: cast_nullable_to_non_nullable
              as String,
      jan: null == jan
          ? _value.jan
          : jan // ignore: cast_nullable_to_non_nullable
              as String,
      asins: null == asins
          ? _value.asins
          : asins // ignore: cast_nullable_to_non_nullable
              as List<AsinData>,
      defaultPurchasePrice: null == defaultPurchasePrice
          ? _value.defaultPurchasePrice
          : defaultPurchasePrice // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchItemImplCopyWith<$Res>
    implements $SearchItemCopyWith<$Res> {
  factory _$$SearchItemImplCopyWith(
          _$SearchItemImpl value, $Res Function(_$SearchItemImpl) then) =
      __$$SearchItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String searchDate,
      @HiveField(1) String jan,
      @HiveField(2) List<AsinData> asins,
      int defaultPurchasePrice});
}

/// @nodoc
class __$$SearchItemImplCopyWithImpl<$Res>
    extends _$SearchItemCopyWithImpl<$Res, _$SearchItemImpl>
    implements _$$SearchItemImplCopyWith<$Res> {
  __$$SearchItemImplCopyWithImpl(
      _$SearchItemImpl _value, $Res Function(_$SearchItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchDate = null,
    Object? jan = null,
    Object? asins = null,
    Object? defaultPurchasePrice = null,
  }) {
    return _then(_$SearchItemImpl(
      searchDate: null == searchDate
          ? _value.searchDate
          : searchDate // ignore: cast_nullable_to_non_nullable
              as String,
      jan: null == jan
          ? _value.jan
          : jan // ignore: cast_nullable_to_non_nullable
              as String,
      asins: null == asins
          ? _value._asins
          : asins // ignore: cast_nullable_to_non_nullable
              as List<AsinData>,
      defaultPurchasePrice: null == defaultPurchasePrice
          ? _value.defaultPurchasePrice
          : defaultPurchasePrice // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@HiveType(typeId: itemTypeId)
class _$SearchItemImpl implements _SearchItem {
  const _$SearchItemImpl(
      {@HiveField(0) required this.searchDate,
      @HiveField(1) required this.jan,
      @HiveField(2) final List<AsinData> asins = const <AsinData>[],
      this.defaultPurchasePrice = 0})
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
    if (_asins is EqualUnmodifiableListView) return _asins;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_asins);
  }

  @override
  @JsonKey()
  final int defaultPurchasePrice;

  @override
  String toString() {
    return 'SearchItem(searchDate: $searchDate, jan: $jan, asins: $asins, defaultPurchasePrice: $defaultPurchasePrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchItemImpl &&
            (identical(other.searchDate, searchDate) ||
                other.searchDate == searchDate) &&
            (identical(other.jan, jan) || other.jan == jan) &&
            const DeepCollectionEquality().equals(other._asins, _asins) &&
            (identical(other.defaultPurchasePrice, defaultPurchasePrice) ||
                other.defaultPurchasePrice == defaultPurchasePrice));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchDate, jan,
      const DeepCollectionEquality().hash(_asins), defaultPurchasePrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchItemImplCopyWith<_$SearchItemImpl> get copyWith =>
      __$$SearchItemImplCopyWithImpl<_$SearchItemImpl>(this, _$identity);
}

abstract class _SearchItem implements SearchItem {
  const factory _SearchItem(
      {@HiveField(0) required final String searchDate,
      @HiveField(1) required final String jan,
      @HiveField(2) final List<AsinData> asins,
      final int defaultPurchasePrice}) = _$SearchItemImpl;

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
  int get defaultPurchasePrice;
  @override
  @JsonKey(ignore: true)
  _$$SearchItemImplCopyWith<_$SearchItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
