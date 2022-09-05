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
