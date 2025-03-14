// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fee_expression.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FeeExpression _$FeeExpressionFromJson(Map<String, dynamic> json) {
  return _FeeExpression.fromJson(json);
}

/// @nodoc
mixin _$FeeExpression {
  @HiveField(0)
  int get moreThan => throw _privateConstructorUsedError;
  @HiveField(1)
  String get exp => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@HiveField(0) int moreThan, @HiveField(1) String exp)
        $default,
  ) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@HiveField(0) int moreThan, @HiveField(1) String exp)?
        $default, {
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this FeeExpression to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeeExpression
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeeExpressionCopyWith<FeeExpression> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeeExpressionCopyWith<$Res> {
  factory $FeeExpressionCopyWith(
          FeeExpression value, $Res Function(FeeExpression) then) =
      _$FeeExpressionCopyWithImpl<$Res, FeeExpression>;
  @useResult
  $Res call({@HiveField(0) int moreThan, @HiveField(1) String exp});
}

/// @nodoc
class _$FeeExpressionCopyWithImpl<$Res, $Val extends FeeExpression>
    implements $FeeExpressionCopyWith<$Res> {
  _$FeeExpressionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeeExpression
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? moreThan = null,
    Object? exp = null,
  }) {
    return _then(_value.copyWith(
      moreThan: null == moreThan
          ? _value.moreThan
          : moreThan // ignore: cast_nullable_to_non_nullable
              as int,
      exp: null == exp
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeeExpressionImplCopyWith<$Res>
    implements $FeeExpressionCopyWith<$Res> {
  factory _$$FeeExpressionImplCopyWith(
          _$FeeExpressionImpl value, $Res Function(_$FeeExpressionImpl) then) =
      __$$FeeExpressionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) int moreThan, @HiveField(1) String exp});
}

/// @nodoc
class __$$FeeExpressionImplCopyWithImpl<$Res>
    extends _$FeeExpressionCopyWithImpl<$Res, _$FeeExpressionImpl>
    implements _$$FeeExpressionImplCopyWith<$Res> {
  __$$FeeExpressionImplCopyWithImpl(
      _$FeeExpressionImpl _value, $Res Function(_$FeeExpressionImpl) _then)
      : super(_value, _then);

  /// Create a copy of FeeExpression
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? moreThan = null,
    Object? exp = null,
  }) {
    return _then(_$FeeExpressionImpl(
      moreThan: null == moreThan
          ? _value.moreThan
          : moreThan // ignore: cast_nullable_to_non_nullable
              as int,
      exp: null == exp
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
@HiveType(typeId: feeExpressionTypeId)
class _$FeeExpressionImpl implements _FeeExpression {
  const _$FeeExpressionImpl(
      {@HiveField(0) this.moreThan = 0, @HiveField(1) this.exp = ""});

  factory _$FeeExpressionImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeeExpressionImplFromJson(json);

  @override
  @JsonKey()
  @HiveField(0)
  final int moreThan;
  @override
  @JsonKey()
  @HiveField(1)
  final String exp;

  @override
  String toString() {
    return 'FeeExpression(moreThan: $moreThan, exp: $exp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeeExpressionImpl &&
            (identical(other.moreThan, moreThan) ||
                other.moreThan == moreThan) &&
            (identical(other.exp, exp) || other.exp == exp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, moreThan, exp);

  /// Create a copy of FeeExpression
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeeExpressionImplCopyWith<_$FeeExpressionImpl> get copyWith =>
      __$$FeeExpressionImplCopyWithImpl<_$FeeExpressionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@HiveField(0) int moreThan, @HiveField(1) String exp)
        $default,
  ) {
    return $default(moreThan, exp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@HiveField(0) int moreThan, @HiveField(1) String exp)?
        $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(moreThan, exp);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FeeExpressionImplToJson(
      this,
    );
  }
}

abstract class _FeeExpression implements FeeExpression {
  const factory _FeeExpression(
      {@HiveField(0) final int moreThan,
      @HiveField(1) final String exp}) = _$FeeExpressionImpl;

  factory _FeeExpression.fromJson(Map<String, dynamic> json) =
      _$FeeExpressionImpl.fromJson;

  @override
  @HiveField(0)
  int get moreThan;
  @override
  @HiveField(1)
  String get exp;

  /// Create a copy of FeeExpression
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeeExpressionImplCopyWith<_$FeeExpressionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
