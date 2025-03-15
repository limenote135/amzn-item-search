// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asin_offers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AsinOffers {
  bool get isValidNew => throw _privateConstructorUsedError;
  bool get isValidUsed => throw _privateConstructorUsedError;
  bool get isValidCart => throw _privateConstructorUsedError;
  int get newTotal => throw _privateConstructorUsedError;
  int get usedTotal => throw _privateConstructorUsedError;
  OfferItem? get cart => throw _privateConstructorUsedError;
  List<OfferItem> get newOffers => throw _privateConstructorUsedError;
  List<OfferItem> get usedOffers => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            bool isValidNew,
            bool isValidUsed,
            bool isValidCart,
            int newTotal,
            int usedTotal,
            OfferItem? cart,
            List<OfferItem> newOffers,
            List<OfferItem> usedOffers)
        $default,
  ) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            bool isValidNew,
            bool isValidUsed,
            bool isValidCart,
            int newTotal,
            int usedTotal,
            OfferItem? cart,
            List<OfferItem> newOffers,
            List<OfferItem> usedOffers)?
        $default, {
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of AsinOffers
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AsinOffersCopyWith<AsinOffers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AsinOffersCopyWith<$Res> {
  factory $AsinOffersCopyWith(
          AsinOffers value, $Res Function(AsinOffers) then) =
      _$AsinOffersCopyWithImpl<$Res, AsinOffers>;
  @useResult
  $Res call(
      {bool isValidNew,
      bool isValidUsed,
      bool isValidCart,
      int newTotal,
      int usedTotal,
      OfferItem? cart,
      List<OfferItem> newOffers,
      List<OfferItem> usedOffers});

  $OfferItemCopyWith<$Res>? get cart;
}

/// @nodoc
class _$AsinOffersCopyWithImpl<$Res, $Val extends AsinOffers>
    implements $AsinOffersCopyWith<$Res> {
  _$AsinOffersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AsinOffers
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isValidNew = null,
    Object? isValidUsed = null,
    Object? isValidCart = null,
    Object? newTotal = null,
    Object? usedTotal = null,
    Object? cart = freezed,
    Object? newOffers = null,
    Object? usedOffers = null,
  }) {
    return _then(_value.copyWith(
      isValidNew: null == isValidNew
          ? _value.isValidNew
          : isValidNew // ignore: cast_nullable_to_non_nullable
              as bool,
      isValidUsed: null == isValidUsed
          ? _value.isValidUsed
          : isValidUsed // ignore: cast_nullable_to_non_nullable
              as bool,
      isValidCart: null == isValidCart
          ? _value.isValidCart
          : isValidCart // ignore: cast_nullable_to_non_nullable
              as bool,
      newTotal: null == newTotal
          ? _value.newTotal
          : newTotal // ignore: cast_nullable_to_non_nullable
              as int,
      usedTotal: null == usedTotal
          ? _value.usedTotal
          : usedTotal // ignore: cast_nullable_to_non_nullable
              as int,
      cart: freezed == cart
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as OfferItem?,
      newOffers: null == newOffers
          ? _value.newOffers
          : newOffers // ignore: cast_nullable_to_non_nullable
              as List<OfferItem>,
      usedOffers: null == usedOffers
          ? _value.usedOffers
          : usedOffers // ignore: cast_nullable_to_non_nullable
              as List<OfferItem>,
    ) as $Val);
  }

  /// Create a copy of AsinOffers
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OfferItemCopyWith<$Res>? get cart {
    if (_value.cart == null) {
      return null;
    }

    return $OfferItemCopyWith<$Res>(_value.cart!, (value) {
      return _then(_value.copyWith(cart: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AsinOffersImplCopyWith<$Res>
    implements $AsinOffersCopyWith<$Res> {
  factory _$$AsinOffersImplCopyWith(
          _$AsinOffersImpl value, $Res Function(_$AsinOffersImpl) then) =
      __$$AsinOffersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isValidNew,
      bool isValidUsed,
      bool isValidCart,
      int newTotal,
      int usedTotal,
      OfferItem? cart,
      List<OfferItem> newOffers,
      List<OfferItem> usedOffers});

  @override
  $OfferItemCopyWith<$Res>? get cart;
}

/// @nodoc
class __$$AsinOffersImplCopyWithImpl<$Res>
    extends _$AsinOffersCopyWithImpl<$Res, _$AsinOffersImpl>
    implements _$$AsinOffersImplCopyWith<$Res> {
  __$$AsinOffersImplCopyWithImpl(
      _$AsinOffersImpl _value, $Res Function(_$AsinOffersImpl) _then)
      : super(_value, _then);

  /// Create a copy of AsinOffers
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isValidNew = null,
    Object? isValidUsed = null,
    Object? isValidCart = null,
    Object? newTotal = null,
    Object? usedTotal = null,
    Object? cart = freezed,
    Object? newOffers = null,
    Object? usedOffers = null,
  }) {
    return _then(_$AsinOffersImpl(
      isValidNew: null == isValidNew
          ? _value.isValidNew
          : isValidNew // ignore: cast_nullable_to_non_nullable
              as bool,
      isValidUsed: null == isValidUsed
          ? _value.isValidUsed
          : isValidUsed // ignore: cast_nullable_to_non_nullable
              as bool,
      isValidCart: null == isValidCart
          ? _value.isValidCart
          : isValidCart // ignore: cast_nullable_to_non_nullable
              as bool,
      newTotal: null == newTotal
          ? _value.newTotal
          : newTotal // ignore: cast_nullable_to_non_nullable
              as int,
      usedTotal: null == usedTotal
          ? _value.usedTotal
          : usedTotal // ignore: cast_nullable_to_non_nullable
              as int,
      cart: freezed == cart
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as OfferItem?,
      newOffers: null == newOffers
          ? _value._newOffers
          : newOffers // ignore: cast_nullable_to_non_nullable
              as List<OfferItem>,
      usedOffers: null == usedOffers
          ? _value._usedOffers
          : usedOffers // ignore: cast_nullable_to_non_nullable
              as List<OfferItem>,
    ));
  }
}

/// @nodoc

class _$AsinOffersImpl implements _AsinOffers {
  const _$AsinOffersImpl(
      {this.isValidNew = false,
      this.isValidUsed = false,
      this.isValidCart = false,
      this.newTotal = 0,
      this.usedTotal = 0,
      this.cart = null,
      final List<OfferItem> newOffers = const <OfferItem>[],
      final List<OfferItem> usedOffers = const <OfferItem>[]})
      : _newOffers = newOffers,
        _usedOffers = usedOffers;

  @override
  @JsonKey()
  final bool isValidNew;
  @override
  @JsonKey()
  final bool isValidUsed;
  @override
  @JsonKey()
  final bool isValidCart;
  @override
  @JsonKey()
  final int newTotal;
  @override
  @JsonKey()
  final int usedTotal;
  @override
  @JsonKey()
  final OfferItem? cart;
  final List<OfferItem> _newOffers;
  @override
  @JsonKey()
  List<OfferItem> get newOffers {
    if (_newOffers is EqualUnmodifiableListView) return _newOffers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newOffers);
  }

  final List<OfferItem> _usedOffers;
  @override
  @JsonKey()
  List<OfferItem> get usedOffers {
    if (_usedOffers is EqualUnmodifiableListView) return _usedOffers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_usedOffers);
  }

  @override
  String toString() {
    return 'AsinOffers(isValidNew: $isValidNew, isValidUsed: $isValidUsed, isValidCart: $isValidCart, newTotal: $newTotal, usedTotal: $usedTotal, cart: $cart, newOffers: $newOffers, usedOffers: $usedOffers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AsinOffersImpl &&
            (identical(other.isValidNew, isValidNew) ||
                other.isValidNew == isValidNew) &&
            (identical(other.isValidUsed, isValidUsed) ||
                other.isValidUsed == isValidUsed) &&
            (identical(other.isValidCart, isValidCart) ||
                other.isValidCart == isValidCart) &&
            (identical(other.newTotal, newTotal) ||
                other.newTotal == newTotal) &&
            (identical(other.usedTotal, usedTotal) ||
                other.usedTotal == usedTotal) &&
            (identical(other.cart, cart) || other.cart == cart) &&
            const DeepCollectionEquality()
                .equals(other._newOffers, _newOffers) &&
            const DeepCollectionEquality()
                .equals(other._usedOffers, _usedOffers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isValidNew,
      isValidUsed,
      isValidCart,
      newTotal,
      usedTotal,
      cart,
      const DeepCollectionEquality().hash(_newOffers),
      const DeepCollectionEquality().hash(_usedOffers));

  /// Create a copy of AsinOffers
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AsinOffersImplCopyWith<_$AsinOffersImpl> get copyWith =>
      __$$AsinOffersImplCopyWithImpl<_$AsinOffersImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            bool isValidNew,
            bool isValidUsed,
            bool isValidCart,
            int newTotal,
            int usedTotal,
            OfferItem? cart,
            List<OfferItem> newOffers,
            List<OfferItem> usedOffers)
        $default,
  ) {
    return $default(isValidNew, isValidUsed, isValidCart, newTotal, usedTotal,
        cart, newOffers, usedOffers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            bool isValidNew,
            bool isValidUsed,
            bool isValidCart,
            int newTotal,
            int usedTotal,
            OfferItem? cart,
            List<OfferItem> newOffers,
            List<OfferItem> usedOffers)?
        $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(isValidNew, isValidUsed, isValidCart, newTotal, usedTotal,
          cart, newOffers, usedOffers);
    }
    return orElse();
  }
}

abstract class _AsinOffers implements AsinOffers {
  const factory _AsinOffers(
      {final bool isValidNew,
      final bool isValidUsed,
      final bool isValidCart,
      final int newTotal,
      final int usedTotal,
      final OfferItem? cart,
      final List<OfferItem> newOffers,
      final List<OfferItem> usedOffers}) = _$AsinOffersImpl;

  @override
  bool get isValidNew;
  @override
  bool get isValidUsed;
  @override
  bool get isValidCart;
  @override
  int get newTotal;
  @override
  int get usedTotal;
  @override
  OfferItem? get cart;
  @override
  List<OfferItem> get newOffers;
  @override
  List<OfferItem> get usedOffers;

  /// Create a copy of AsinOffers
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AsinOffersImplCopyWith<_$AsinOffersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
