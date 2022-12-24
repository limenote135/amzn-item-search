// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offer_stocks.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$OfferStocksParamCopyWithImpl<$Res, OfferStocksParam>;
  @useResult
  $Res call({String asin, String sellerId});
}

/// @nodoc
class _$OfferStocksParamCopyWithImpl<$Res, $Val extends OfferStocksParam>
    implements $OfferStocksParamCopyWith<$Res> {
  _$OfferStocksParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? asin = null,
    Object? sellerId = null,
  }) {
    return _then(_value.copyWith(
      asin: null == asin
          ? _value.asin
          : asin // ignore: cast_nullable_to_non_nullable
              as String,
      sellerId: null == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OfferStocksParamCopyWith<$Res>
    implements $OfferStocksParamCopyWith<$Res> {
  factory _$$_OfferStocksParamCopyWith(
          _$_OfferStocksParam value, $Res Function(_$_OfferStocksParam) then) =
      __$$_OfferStocksParamCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String asin, String sellerId});
}

/// @nodoc
class __$$_OfferStocksParamCopyWithImpl<$Res>
    extends _$OfferStocksParamCopyWithImpl<$Res, _$_OfferStocksParam>
    implements _$$_OfferStocksParamCopyWith<$Res> {
  __$$_OfferStocksParamCopyWithImpl(
      _$_OfferStocksParam _value, $Res Function(_$_OfferStocksParam) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? asin = null,
    Object? sellerId = null,
  }) {
    return _then(_$_OfferStocksParam(
      asin: null == asin
          ? _value.asin
          : asin // ignore: cast_nullable_to_non_nullable
              as String,
      sellerId: null == sellerId
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
            other is _$_OfferStocksParam &&
            (identical(other.asin, asin) || other.asin == asin) &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, asin, sellerId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OfferStocksParamCopyWith<_$_OfferStocksParam> get copyWith =>
      __$$_OfferStocksParamCopyWithImpl<_$_OfferStocksParam>(this, _$identity);
}

abstract class _OfferStocksParam implements OfferStocksParam {
  const factory _OfferStocksParam(
      {required final String asin,
      required final String sellerId}) = _$_OfferStocksParam;

  @override
  String get asin;
  @override
  String get sellerId;
  @override
  @JsonKey(ignore: true)
  _$$_OfferStocksParamCopyWith<_$_OfferStocksParam> get copyWith =>
      throw _privateConstructorUsedError;
}
