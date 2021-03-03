// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'alert_condition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AlertConditionTearOff {
  const _$AlertConditionTearOff();

  _AlertCondition call(
      {@HiveField(0) required AlertType type, @HiveField(1) int value = 0}) {
    return _AlertCondition(
      type: type,
      value: value,
    );
  }
}

/// @nodoc
const $AlertCondition = _$AlertConditionTearOff();

/// @nodoc
mixin _$AlertCondition {
  @HiveField(0)
  AlertType get type => throw _privateConstructorUsedError;
  @HiveField(1)
  int get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AlertConditionCopyWith<AlertCondition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlertConditionCopyWith<$Res> {
  factory $AlertConditionCopyWith(
          AlertCondition value, $Res Function(AlertCondition) then) =
      _$AlertConditionCopyWithImpl<$Res>;
  $Res call({@HiveField(0) AlertType type, @HiveField(1) int value});
}

/// @nodoc
class _$AlertConditionCopyWithImpl<$Res>
    implements $AlertConditionCopyWith<$Res> {
  _$AlertConditionCopyWithImpl(this._value, this._then);

  final AlertCondition _value;
  // ignore: unused_field
  final $Res Function(AlertCondition) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AlertType,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$AlertConditionCopyWith<$Res>
    implements $AlertConditionCopyWith<$Res> {
  factory _$AlertConditionCopyWith(
          _AlertCondition value, $Res Function(_AlertCondition) then) =
      __$AlertConditionCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) AlertType type, @HiveField(1) int value});
}

/// @nodoc
class __$AlertConditionCopyWithImpl<$Res>
    extends _$AlertConditionCopyWithImpl<$Res>
    implements _$AlertConditionCopyWith<$Res> {
  __$AlertConditionCopyWithImpl(
      _AlertCondition _value, $Res Function(_AlertCondition) _then)
      : super(_value, (v) => _then(v as _AlertCondition));

  @override
  _AlertCondition get _value => super._value as _AlertCondition;

  @override
  $Res call({
    Object? type = freezed,
    Object? value = freezed,
  }) {
    return _then(_AlertCondition(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AlertType,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

@HiveType(typeId: alertConditionTypeId)

/// @nodoc
class _$_AlertCondition implements _AlertCondition {
  const _$_AlertCondition(
      {@HiveField(0) required this.type, @HiveField(1) this.value = 0});

  @override
  @HiveField(0)
  final AlertType type;
  @JsonKey(defaultValue: 0)
  @override
  @HiveField(1)
  final int value;

  @override
  String toString() {
    return 'AlertCondition(type: $type, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AlertCondition &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$AlertConditionCopyWith<_AlertCondition> get copyWith =>
      __$AlertConditionCopyWithImpl<_AlertCondition>(this, _$identity);
}

abstract class _AlertCondition implements AlertCondition {
  const factory _AlertCondition(
      {@HiveField(0) required AlertType type,
      @HiveField(1) int value}) = _$_AlertCondition;

  @override
  @HiveField(0)
  AlertType get type => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  int get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AlertConditionCopyWith<_AlertCondition> get copyWith =>
      throw _privateConstructorUsedError;
}
