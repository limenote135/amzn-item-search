// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alert_condition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AlertCondition _$AlertConditionFromJson(Map<String, dynamic> json) {
  return _AlertCondition.fromJson(json);
}

/// @nodoc
mixin _$AlertCondition {
  @HiveField(0)
  @JsonKey(name: "t")
  AlertType get type => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: "v")
  int get value => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@HiveField(0) @JsonKey(name: "t") AlertType type,
            @HiveField(1) @JsonKey(name: "v") int value)
        $default,
  ) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@HiveField(0) @JsonKey(name: "t") AlertType type,
            @HiveField(1) @JsonKey(name: "v") int value)?
        $default, {
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this AlertCondition to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AlertCondition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AlertConditionCopyWith<AlertCondition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlertConditionCopyWith<$Res> {
  factory $AlertConditionCopyWith(
          AlertCondition value, $Res Function(AlertCondition) then) =
      _$AlertConditionCopyWithImpl<$Res, AlertCondition>;
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: "t") AlertType type,
      @HiveField(1) @JsonKey(name: "v") int value});
}

/// @nodoc
class _$AlertConditionCopyWithImpl<$Res, $Val extends AlertCondition>
    implements $AlertConditionCopyWith<$Res> {
  _$AlertConditionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AlertCondition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AlertType,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlertConditionImplCopyWith<$Res>
    implements $AlertConditionCopyWith<$Res> {
  factory _$$AlertConditionImplCopyWith(_$AlertConditionImpl value,
          $Res Function(_$AlertConditionImpl) then) =
      __$$AlertConditionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: "t") AlertType type,
      @HiveField(1) @JsonKey(name: "v") int value});
}

/// @nodoc
class __$$AlertConditionImplCopyWithImpl<$Res>
    extends _$AlertConditionCopyWithImpl<$Res, _$AlertConditionImpl>
    implements _$$AlertConditionImplCopyWith<$Res> {
  __$$AlertConditionImplCopyWithImpl(
      _$AlertConditionImpl _value, $Res Function(_$AlertConditionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AlertCondition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? value = null,
  }) {
    return _then(_$AlertConditionImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AlertType,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: alertConditionTypeId)
class _$AlertConditionImpl implements _AlertCondition {
  const _$AlertConditionImpl(
      {@HiveField(0) @JsonKey(name: "t") required this.type,
      @HiveField(1) @JsonKey(name: "v") this.value = 0});

  factory _$AlertConditionImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlertConditionImplFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: "t")
  final AlertType type;
  @override
  @HiveField(1)
  @JsonKey(name: "v")
  final int value;

  @override
  String toString() {
    return 'AlertCondition(type: $type, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlertConditionImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, value);

  /// Create a copy of AlertCondition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlertConditionImplCopyWith<_$AlertConditionImpl> get copyWith =>
      __$$AlertConditionImplCopyWithImpl<_$AlertConditionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@HiveField(0) @JsonKey(name: "t") AlertType type,
            @HiveField(1) @JsonKey(name: "v") int value)
        $default,
  ) {
    return $default(type, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@HiveField(0) @JsonKey(name: "t") AlertType type,
            @HiveField(1) @JsonKey(name: "v") int value)?
        $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(type, value);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AlertConditionImplToJson(
      this,
    );
  }
}

abstract class _AlertCondition implements AlertCondition {
  const factory _AlertCondition(
          {@HiveField(0) @JsonKey(name: "t") required final AlertType type,
          @HiveField(1) @JsonKey(name: "v") final int value}) =
      _$AlertConditionImpl;

  factory _AlertCondition.fromJson(Map<String, dynamic> json) =
      _$AlertConditionImpl.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: "t")
  AlertType get type;
  @override
  @HiveField(1)
  @JsonKey(name: "v")
  int get value;

  /// Create a copy of AlertCondition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlertConditionImplCopyWith<_$AlertConditionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
