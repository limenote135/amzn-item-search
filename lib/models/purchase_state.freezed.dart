// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PurchaseState {
  CustomerInfo get purchaseInfo => throw _privateConstructorUsedError;
  Offerings get offerings => throw _privateConstructorUsedError;

  /// Create a copy of PurchaseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PurchaseStateCopyWith<PurchaseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseStateCopyWith<$Res> {
  factory $PurchaseStateCopyWith(
          PurchaseState value, $Res Function(PurchaseState) then) =
      _$PurchaseStateCopyWithImpl<$Res, PurchaseState>;
  @useResult
  $Res call({CustomerInfo purchaseInfo, Offerings offerings});

  $CustomerInfoCopyWith<$Res> get purchaseInfo;
  $OfferingsCopyWith<$Res> get offerings;
}

/// @nodoc
class _$PurchaseStateCopyWithImpl<$Res, $Val extends PurchaseState>
    implements $PurchaseStateCopyWith<$Res> {
  _$PurchaseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseInfo = null,
    Object? offerings = null,
  }) {
    return _then(_value.copyWith(
      purchaseInfo: null == purchaseInfo
          ? _value.purchaseInfo
          : purchaseInfo // ignore: cast_nullable_to_non_nullable
              as CustomerInfo,
      offerings: null == offerings
          ? _value.offerings
          : offerings // ignore: cast_nullable_to_non_nullable
              as Offerings,
    ) as $Val);
  }

  /// Create a copy of PurchaseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerInfoCopyWith<$Res> get purchaseInfo {
    return $CustomerInfoCopyWith<$Res>(_value.purchaseInfo, (value) {
      return _then(_value.copyWith(purchaseInfo: value) as $Val);
    });
  }

  /// Create a copy of PurchaseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OfferingsCopyWith<$Res> get offerings {
    return $OfferingsCopyWith<$Res>(_value.offerings, (value) {
      return _then(_value.copyWith(offerings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PurchaseStateImplCopyWith<$Res>
    implements $PurchaseStateCopyWith<$Res> {
  factory _$$PurchaseStateImplCopyWith(
          _$PurchaseStateImpl value, $Res Function(_$PurchaseStateImpl) then) =
      __$$PurchaseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CustomerInfo purchaseInfo, Offerings offerings});

  @override
  $CustomerInfoCopyWith<$Res> get purchaseInfo;
  @override
  $OfferingsCopyWith<$Res> get offerings;
}

/// @nodoc
class __$$PurchaseStateImplCopyWithImpl<$Res>
    extends _$PurchaseStateCopyWithImpl<$Res, _$PurchaseStateImpl>
    implements _$$PurchaseStateImplCopyWith<$Res> {
  __$$PurchaseStateImplCopyWithImpl(
      _$PurchaseStateImpl _value, $Res Function(_$PurchaseStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseInfo = null,
    Object? offerings = null,
  }) {
    return _then(_$PurchaseStateImpl(
      purchaseInfo: null == purchaseInfo
          ? _value.purchaseInfo
          : purchaseInfo // ignore: cast_nullable_to_non_nullable
              as CustomerInfo,
      offerings: null == offerings
          ? _value.offerings
          : offerings // ignore: cast_nullable_to_non_nullable
              as Offerings,
    ));
  }
}

/// @nodoc

class _$PurchaseStateImpl implements _PurchaseState {
  const _$PurchaseStateImpl(
      {required this.purchaseInfo, required this.offerings});

  @override
  final CustomerInfo purchaseInfo;
  @override
  final Offerings offerings;

  @override
  String toString() {
    return 'PurchaseState(purchaseInfo: $purchaseInfo, offerings: $offerings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseStateImpl &&
            (identical(other.purchaseInfo, purchaseInfo) ||
                other.purchaseInfo == purchaseInfo) &&
            (identical(other.offerings, offerings) ||
                other.offerings == offerings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, purchaseInfo, offerings);

  /// Create a copy of PurchaseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseStateImplCopyWith<_$PurchaseStateImpl> get copyWith =>
      __$$PurchaseStateImplCopyWithImpl<_$PurchaseStateImpl>(this, _$identity);
}

abstract class _PurchaseState implements PurchaseState {
  const factory _PurchaseState(
      {required final CustomerInfo purchaseInfo,
      required final Offerings offerings}) = _$PurchaseStateImpl;

  @override
  CustomerInfo get purchaseInfo;
  @override
  Offerings get offerings;

  /// Create a copy of PurchaseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PurchaseStateImplCopyWith<_$PurchaseStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
