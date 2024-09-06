// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'keepa.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KeepaTokenStatusResponse _$KeepaTokenStatusResponseFromJson(
    Map<String, dynamic> json) {
  return _KeepaTokenStatusResponse.fromJson(json);
}

/// @nodoc
mixin _$KeepaTokenStatusResponse {
  int get timestamp => throw _privateConstructorUsedError;
  int get tokensLeft => throw _privateConstructorUsedError;
  int get refillIn => throw _privateConstructorUsedError;
  int get refillRate => throw _privateConstructorUsedError;
  int get tokenFlowReduction => throw _privateConstructorUsedError;
  int get tokensConsumed => throw _privateConstructorUsedError;
  int get processingTimeInMs => throw _privateConstructorUsedError;
  KeepaError? get error => throw _privateConstructorUsedError;

  /// Serializes this KeepaTokenStatusResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KeepaTokenStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KeepaTokenStatusResponseCopyWith<KeepaTokenStatusResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeepaTokenStatusResponseCopyWith<$Res> {
  factory $KeepaTokenStatusResponseCopyWith(KeepaTokenStatusResponse value,
          $Res Function(KeepaTokenStatusResponse) then) =
      _$KeepaTokenStatusResponseCopyWithImpl<$Res, KeepaTokenStatusResponse>;
  @useResult
  $Res call(
      {int timestamp,
      int tokensLeft,
      int refillIn,
      int refillRate,
      int tokenFlowReduction,
      int tokensConsumed,
      int processingTimeInMs,
      KeepaError? error});

  $KeepaErrorCopyWith<$Res>? get error;
}

/// @nodoc
class _$KeepaTokenStatusResponseCopyWithImpl<$Res,
        $Val extends KeepaTokenStatusResponse>
    implements $KeepaTokenStatusResponseCopyWith<$Res> {
  _$KeepaTokenStatusResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KeepaTokenStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? tokensLeft = null,
    Object? refillIn = null,
    Object? refillRate = null,
    Object? tokenFlowReduction = null,
    Object? tokensConsumed = null,
    Object? processingTimeInMs = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      tokensLeft: null == tokensLeft
          ? _value.tokensLeft
          : tokensLeft // ignore: cast_nullable_to_non_nullable
              as int,
      refillIn: null == refillIn
          ? _value.refillIn
          : refillIn // ignore: cast_nullable_to_non_nullable
              as int,
      refillRate: null == refillRate
          ? _value.refillRate
          : refillRate // ignore: cast_nullable_to_non_nullable
              as int,
      tokenFlowReduction: null == tokenFlowReduction
          ? _value.tokenFlowReduction
          : tokenFlowReduction // ignore: cast_nullable_to_non_nullable
              as int,
      tokensConsumed: null == tokensConsumed
          ? _value.tokensConsumed
          : tokensConsumed // ignore: cast_nullable_to_non_nullable
              as int,
      processingTimeInMs: null == processingTimeInMs
          ? _value.processingTimeInMs
          : processingTimeInMs // ignore: cast_nullable_to_non_nullable
              as int,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as KeepaError?,
    ) as $Val);
  }

  /// Create a copy of KeepaTokenStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KeepaErrorCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $KeepaErrorCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$KeepaTokenStatusResponseImplCopyWith<$Res>
    implements $KeepaTokenStatusResponseCopyWith<$Res> {
  factory _$$KeepaTokenStatusResponseImplCopyWith(
          _$KeepaTokenStatusResponseImpl value,
          $Res Function(_$KeepaTokenStatusResponseImpl) then) =
      __$$KeepaTokenStatusResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int timestamp,
      int tokensLeft,
      int refillIn,
      int refillRate,
      int tokenFlowReduction,
      int tokensConsumed,
      int processingTimeInMs,
      KeepaError? error});

  @override
  $KeepaErrorCopyWith<$Res>? get error;
}

/// @nodoc
class __$$KeepaTokenStatusResponseImplCopyWithImpl<$Res>
    extends _$KeepaTokenStatusResponseCopyWithImpl<$Res,
        _$KeepaTokenStatusResponseImpl>
    implements _$$KeepaTokenStatusResponseImplCopyWith<$Res> {
  __$$KeepaTokenStatusResponseImplCopyWithImpl(
      _$KeepaTokenStatusResponseImpl _value,
      $Res Function(_$KeepaTokenStatusResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of KeepaTokenStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? tokensLeft = null,
    Object? refillIn = null,
    Object? refillRate = null,
    Object? tokenFlowReduction = null,
    Object? tokensConsumed = null,
    Object? processingTimeInMs = null,
    Object? error = freezed,
  }) {
    return _then(_$KeepaTokenStatusResponseImpl(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      tokensLeft: null == tokensLeft
          ? _value.tokensLeft
          : tokensLeft // ignore: cast_nullable_to_non_nullable
              as int,
      refillIn: null == refillIn
          ? _value.refillIn
          : refillIn // ignore: cast_nullable_to_non_nullable
              as int,
      refillRate: null == refillRate
          ? _value.refillRate
          : refillRate // ignore: cast_nullable_to_non_nullable
              as int,
      tokenFlowReduction: null == tokenFlowReduction
          ? _value.tokenFlowReduction
          : tokenFlowReduction // ignore: cast_nullable_to_non_nullable
              as int,
      tokensConsumed: null == tokensConsumed
          ? _value.tokensConsumed
          : tokensConsumed // ignore: cast_nullable_to_non_nullable
              as int,
      processingTimeInMs: null == processingTimeInMs
          ? _value.processingTimeInMs
          : processingTimeInMs // ignore: cast_nullable_to_non_nullable
              as int,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as KeepaError?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _$KeepaTokenStatusResponseImpl implements _KeepaTokenStatusResponse {
  const _$KeepaTokenStatusResponseImpl(
      {required this.timestamp,
      required this.tokensLeft,
      required this.refillIn,
      required this.refillRate,
      required this.tokenFlowReduction,
      required this.tokensConsumed,
      required this.processingTimeInMs,
      this.error});

  factory _$KeepaTokenStatusResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$KeepaTokenStatusResponseImplFromJson(json);

  @override
  final int timestamp;
  @override
  final int tokensLeft;
  @override
  final int refillIn;
  @override
  final int refillRate;
  @override
  final int tokenFlowReduction;
  @override
  final int tokensConsumed;
  @override
  final int processingTimeInMs;
  @override
  final KeepaError? error;

  @override
  String toString() {
    return 'KeepaTokenStatusResponse(timestamp: $timestamp, tokensLeft: $tokensLeft, refillIn: $refillIn, refillRate: $refillRate, tokenFlowReduction: $tokenFlowReduction, tokensConsumed: $tokensConsumed, processingTimeInMs: $processingTimeInMs, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KeepaTokenStatusResponseImpl &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.tokensLeft, tokensLeft) ||
                other.tokensLeft == tokensLeft) &&
            (identical(other.refillIn, refillIn) ||
                other.refillIn == refillIn) &&
            (identical(other.refillRate, refillRate) ||
                other.refillRate == refillRate) &&
            (identical(other.tokenFlowReduction, tokenFlowReduction) ||
                other.tokenFlowReduction == tokenFlowReduction) &&
            (identical(other.tokensConsumed, tokensConsumed) ||
                other.tokensConsumed == tokensConsumed) &&
            (identical(other.processingTimeInMs, processingTimeInMs) ||
                other.processingTimeInMs == processingTimeInMs) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      timestamp,
      tokensLeft,
      refillIn,
      refillRate,
      tokenFlowReduction,
      tokensConsumed,
      processingTimeInMs,
      error);

  /// Create a copy of KeepaTokenStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KeepaTokenStatusResponseImplCopyWith<_$KeepaTokenStatusResponseImpl>
      get copyWith => __$$KeepaTokenStatusResponseImplCopyWithImpl<
          _$KeepaTokenStatusResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KeepaTokenStatusResponseImplToJson(
      this,
    );
  }
}

abstract class _KeepaTokenStatusResponse implements KeepaTokenStatusResponse {
  const factory _KeepaTokenStatusResponse(
      {required final int timestamp,
      required final int tokensLeft,
      required final int refillIn,
      required final int refillRate,
      required final int tokenFlowReduction,
      required final int tokensConsumed,
      required final int processingTimeInMs,
      final KeepaError? error}) = _$KeepaTokenStatusResponseImpl;

  factory _KeepaTokenStatusResponse.fromJson(Map<String, dynamic> json) =
      _$KeepaTokenStatusResponseImpl.fromJson;

  @override
  int get timestamp;
  @override
  int get tokensLeft;
  @override
  int get refillIn;
  @override
  int get refillRate;
  @override
  int get tokenFlowReduction;
  @override
  int get tokensConsumed;
  @override
  int get processingTimeInMs;
  @override
  KeepaError? get error;

  /// Create a copy of KeepaTokenStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KeepaTokenStatusResponseImplCopyWith<_$KeepaTokenStatusResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

KeepaError _$KeepaErrorFromJson(Map<String, dynamic> json) {
  return _KeepaError.fromJson(json);
}

/// @nodoc
mixin _$KeepaError {
  String? get type => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get details => throw _privateConstructorUsedError;

  /// Serializes this KeepaError to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KeepaError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KeepaErrorCopyWith<KeepaError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeepaErrorCopyWith<$Res> {
  factory $KeepaErrorCopyWith(
          KeepaError value, $Res Function(KeepaError) then) =
      _$KeepaErrorCopyWithImpl<$Res, KeepaError>;
  @useResult
  $Res call({String? type, String? message, String? details});
}

/// @nodoc
class _$KeepaErrorCopyWithImpl<$Res, $Val extends KeepaError>
    implements $KeepaErrorCopyWith<$Res> {
  _$KeepaErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KeepaError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? message = freezed,
    Object? details = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KeepaErrorImplCopyWith<$Res>
    implements $KeepaErrorCopyWith<$Res> {
  factory _$$KeepaErrorImplCopyWith(
          _$KeepaErrorImpl value, $Res Function(_$KeepaErrorImpl) then) =
      __$$KeepaErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? type, String? message, String? details});
}

/// @nodoc
class __$$KeepaErrorImplCopyWithImpl<$Res>
    extends _$KeepaErrorCopyWithImpl<$Res, _$KeepaErrorImpl>
    implements _$$KeepaErrorImplCopyWith<$Res> {
  __$$KeepaErrorImplCopyWithImpl(
      _$KeepaErrorImpl _value, $Res Function(_$KeepaErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of KeepaError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? message = freezed,
    Object? details = freezed,
  }) {
    return _then(_$KeepaErrorImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _$KeepaErrorImpl implements _KeepaError {
  const _$KeepaErrorImpl({this.type, this.message, this.details});

  factory _$KeepaErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$KeepaErrorImplFromJson(json);

  @override
  final String? type;
  @override
  final String? message;
  @override
  final String? details;

  @override
  String toString() {
    return 'KeepaError(type: $type, message: $message, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KeepaErrorImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, message, details);

  /// Create a copy of KeepaError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KeepaErrorImplCopyWith<_$KeepaErrorImpl> get copyWith =>
      __$$KeepaErrorImplCopyWithImpl<_$KeepaErrorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KeepaErrorImplToJson(
      this,
    );
  }
}

abstract class _KeepaError implements KeepaError {
  const factory _KeepaError(
      {final String? type,
      final String? message,
      final String? details}) = _$KeepaErrorImpl;

  factory _KeepaError.fromJson(Map<String, dynamic> json) =
      _$KeepaErrorImpl.fromJson;

  @override
  String? get type;
  @override
  String? get message;
  @override
  String? get details;

  /// Create a copy of KeepaError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KeepaErrorImplCopyWith<_$KeepaErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
