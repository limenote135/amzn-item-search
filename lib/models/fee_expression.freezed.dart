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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FeeExpression _$FeeExpressionFromJson(Map<String, dynamic> json) {
  return _FeeExpression.fromJson(json);
}

/// @nodoc
mixin _$FeeExpression {
  @HiveField(0)
  int get moreThan => throw _privateConstructorUsedError;
  @HiveField(1)
  String get exp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
abstract class _$$_FeeExpressionCopyWith<$Res>
    implements $FeeExpressionCopyWith<$Res> {
  factory _$$_FeeExpressionCopyWith(
          _$_FeeExpression value, $Res Function(_$_FeeExpression) then) =
      __$$_FeeExpressionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) int moreThan, @HiveField(1) String exp});
}

/// @nodoc
class __$$_FeeExpressionCopyWithImpl<$Res>
    extends _$FeeExpressionCopyWithImpl<$Res, _$_FeeExpression>
    implements _$$_FeeExpressionCopyWith<$Res> {
  __$$_FeeExpressionCopyWithImpl(
      _$_FeeExpression _value, $Res Function(_$_FeeExpression) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? moreThan = null,
    Object? exp = null,
  }) {
    return _then(_$_FeeExpression(
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
class _$_FeeExpression implements _FeeExpression {
  const _$_FeeExpression(
      {@HiveField(0) this.moreThan = 0, @HiveField(1) this.exp = ""});

  factory _$_FeeExpression.fromJson(Map<String, dynamic> json) =>
      _$$_FeeExpressionFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FeeExpression &&
            (identical(other.moreThan, moreThan) ||
                other.moreThan == moreThan) &&
            (identical(other.exp, exp) || other.exp == exp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, moreThan, exp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FeeExpressionCopyWith<_$_FeeExpression> get copyWith =>
      __$$_FeeExpressionCopyWithImpl<_$_FeeExpression>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FeeExpressionToJson(
      this,
    );
  }
}

abstract class _FeeExpression implements FeeExpression {
  const factory _FeeExpression(
      {@HiveField(0) final int moreThan,
      @HiveField(1) final String exp}) = _$_FeeExpression;

  factory _FeeExpression.fromJson(Map<String, dynamic> json) =
      _$_FeeExpression.fromJson;

  @override
  @HiveField(0)
  int get moreThan;
  @override
  @HiveField(1)
  String get exp;
  @override
  @JsonKey(ignore: true)
  _$$_FeeExpressionCopyWith<_$_FeeExpression> get copyWith =>
      throw _privateConstructorUsedError;
}
