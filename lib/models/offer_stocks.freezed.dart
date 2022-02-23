// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'offer_stocks.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$OfferStocksParamTearOff {
  const _$OfferStocksParamTearOff();

  _OfferStocksParam call({required String asin, required String sellerId}) {
    return _OfferStocksParam(
      asin: asin,
      sellerId: sellerId,
    );
  }
}

/// @nodoc
const $OfferStocksParam = _$OfferStocksParamTearOff();

/// @nodoc
mixin _$OfferStocksParam {
  String get asin => throw _privateConstructorUsedError;
  String get sellerId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OfferStocksParamCopyWith<OfferStocksParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfferStocksParamCopyWith<$Res> {
  factory $OfferStocksParamCopyWith(
          OfferStocksParam value, $Res Function(OfferStocksParam) then) =
      _$OfferStocksParamCopyWithImpl<$Res>;
  $Res call({String asin, String sellerId});
}

/// @nodoc
class _$OfferStocksParamCopyWithImpl<$Res>
    implements $OfferStocksParamCopyWith<$Res> {
  _$OfferStocksParamCopyWithImpl(this._value, this._then);

  final OfferStocksParam _value;
  // ignore: unused_field
  final $Res Function(OfferStocksParam) _then;

  @override
  $Res call({
    Object? asin = freezed,
    Object? sellerId = freezed,
  }) {
    return _then(_value.copyWith(
      asin: asin == freezed
          ? _value.asin
          : asin // ignore: cast_nullable_to_non_nullable
              as String,
      sellerId: sellerId == freezed
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$OfferStocksParamCopyWith<$Res>
    implements $OfferStocksParamCopyWith<$Res> {
  factory _$OfferStocksParamCopyWith(
          _OfferStocksParam value, $Res Function(_OfferStocksParam) then) =
      __$OfferStocksParamCopyWithImpl<$Res>;
  @override
  $Res call({String asin, String sellerId});
}

/// @nodoc
class __$OfferStocksParamCopyWithImpl<$Res>
    extends _$OfferStocksParamCopyWithImpl<$Res>
    implements _$OfferStocksParamCopyWith<$Res> {
  __$OfferStocksParamCopyWithImpl(
      _OfferStocksParam _value, $Res Function(_OfferStocksParam) _then)
      : super(_value, (v) => _then(v as _OfferStocksParam));

  @override
  _OfferStocksParam get _value => super._value as _OfferStocksParam;

  @override
  $Res call({
    Object? asin = freezed,
    Object? sellerId = freezed,
  }) {
    return _then(_OfferStocksParam(
      asin: asin == freezed
          ? _value.asin
          : asin // ignore: cast_nullable_to_non_nullable
              as String,
      sellerId: sellerId == freezed
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_OfferStocksParam implements _OfferStocksParam {
  const _$_OfferStocksParam({required this.asin, required this.sellerId});

  @override
  final String asin;
  @override
  final String sellerId;

  @override
  String toString() {
    return 'OfferStocksParam(asin: $asin, sellerId: $sellerId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OfferStocksParam &&
            const DeepCollectionEquality().equals(other.asin, asin) &&
            const DeepCollectionEquality().equals(other.sellerId, sellerId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(asin),
      const DeepCollectionEquality().hash(sellerId));

  @JsonKey(ignore: true)
  @override
  _$OfferStocksParamCopyWith<_OfferStocksParam> get copyWith =>
      __$OfferStocksParamCopyWithImpl<_OfferStocksParam>(this, _$identity);
}

abstract class _OfferStocksParam implements OfferStocksParam {
  const factory _OfferStocksParam(
      {required String asin, required String sellerId}) = _$_OfferStocksParam;

  @override
  String get asin;
  @override
  String get sellerId;
  @override
  @JsonKey(ignore: true)
  _$OfferStocksParamCopyWith<_OfferStocksParam> get copyWith =>
      throw _privateConstructorUsedError;
}
