// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calc_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CalculateData {
  String get displayText => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  CalcOp get op => throw _privateConstructorUsedError;
  bool get inputComplete => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String displayText, double total, CalcOp op, bool inputComplete)
        $default,
  ) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String displayText, double total, CalcOp op, bool inputComplete)?
        $default, {
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of CalculateData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CalculateDataCopyWith<CalculateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalculateDataCopyWith<$Res> {
  factory $CalculateDataCopyWith(
          CalculateData value, $Res Function(CalculateData) then) =
      _$CalculateDataCopyWithImpl<$Res, CalculateData>;
  @useResult
  $Res call({String displayText, double total, CalcOp op, bool inputComplete});
}

/// @nodoc
class _$CalculateDataCopyWithImpl<$Res, $Val extends CalculateData>
    implements $CalculateDataCopyWith<$Res> {
  _$CalculateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CalculateData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayText = null,
    Object? total = null,
    Object? op = null,
    Object? inputComplete = null,
  }) {
    return _then(_value.copyWith(
      displayText: null == displayText
          ? _value.displayText
          : displayText // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      op: null == op
          ? _value.op
          : op // ignore: cast_nullable_to_non_nullable
              as CalcOp,
      inputComplete: null == inputComplete
          ? _value.inputComplete
          : inputComplete // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalculateDataImplCopyWith<$Res>
    implements $CalculateDataCopyWith<$Res> {
  factory _$$CalculateDataImplCopyWith(
          _$CalculateDataImpl value, $Res Function(_$CalculateDataImpl) then) =
      __$$CalculateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String displayText, double total, CalcOp op, bool inputComplete});
}

/// @nodoc
class __$$CalculateDataImplCopyWithImpl<$Res>
    extends _$CalculateDataCopyWithImpl<$Res, _$CalculateDataImpl>
    implements _$$CalculateDataImplCopyWith<$Res> {
  __$$CalculateDataImplCopyWithImpl(
      _$CalculateDataImpl _value, $Res Function(_$CalculateDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of CalculateData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayText = null,
    Object? total = null,
    Object? op = null,
    Object? inputComplete = null,
  }) {
    return _then(_$CalculateDataImpl(
      displayText: null == displayText
          ? _value.displayText
          : displayText // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      op: null == op
          ? _value.op
          : op // ignore: cast_nullable_to_non_nullable
              as CalcOp,
      inputComplete: null == inputComplete
          ? _value.inputComplete
          : inputComplete // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CalculateDataImpl implements _CalculateData {
  const _$CalculateDataImpl(
      {this.displayText = "0",
      this.total = 0,
      this.op = CalcOp.plus,
      this.inputComplete = true});

  @override
  @JsonKey()
  final String displayText;
  @override
  @JsonKey()
  final double total;
  @override
  @JsonKey()
  final CalcOp op;
  @override
  @JsonKey()
  final bool inputComplete;

  @override
  String toString() {
    return 'CalculateData(displayText: $displayText, total: $total, op: $op, inputComplete: $inputComplete)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalculateDataImpl &&
            (identical(other.displayText, displayText) ||
                other.displayText == displayText) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.op, op) || other.op == op) &&
            (identical(other.inputComplete, inputComplete) ||
                other.inputComplete == inputComplete));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, displayText, total, op, inputComplete);

  /// Create a copy of CalculateData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CalculateDataImplCopyWith<_$CalculateDataImpl> get copyWith =>
      __$$CalculateDataImplCopyWithImpl<_$CalculateDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String displayText, double total, CalcOp op, bool inputComplete)
        $default,
  ) {
    return $default(displayText, total, op, inputComplete);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String displayText, double total, CalcOp op, bool inputComplete)?
        $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(displayText, total, op, inputComplete);
    }
    return orElse();
  }
}

abstract class _CalculateData implements CalculateData {
  const factory _CalculateData(
      {final String displayText,
      final double total,
      final CalcOp op,
      final bool inputComplete}) = _$CalculateDataImpl;

  @override
  String get displayText;
  @override
  double get total;
  @override
  CalcOp get op;
  @override
  bool get inputComplete;

  /// Create a copy of CalculateData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CalculateDataImplCopyWith<_$CalculateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
