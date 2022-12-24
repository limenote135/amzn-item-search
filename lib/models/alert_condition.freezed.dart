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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
abstract class _$$_AlertConditionCopyWith<$Res>
    implements $AlertConditionCopyWith<$Res> {
  factory _$$_AlertConditionCopyWith(
          _$_AlertCondition value, $Res Function(_$_AlertCondition) then) =
      __$$_AlertConditionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: "t") AlertType type,
      @HiveField(1) @JsonKey(name: "v") int value});
}

/// @nodoc
class __$$_AlertConditionCopyWithImpl<$Res>
    extends _$AlertConditionCopyWithImpl<$Res, _$_AlertCondition>
    implements _$$_AlertConditionCopyWith<$Res> {
  __$$_AlertConditionCopyWithImpl(
      _$_AlertCondition _value, $Res Function(_$_AlertCondition) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? value = null,
  }) {
    return _then(_$_AlertCondition(
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
class _$_AlertCondition implements _AlertCondition {
  const _$_AlertCondition(
      {@HiveField(0) @JsonKey(name: "t") required this.type,
      @HiveField(1) @JsonKey(name: "v") this.value = 0});

  factory _$_AlertCondition.fromJson(Map<String, dynamic> json) =>
      _$$_AlertConditionFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AlertCondition &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AlertConditionCopyWith<_$_AlertCondition> get copyWith =>
      __$$_AlertConditionCopyWithImpl<_$_AlertCondition>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AlertConditionToJson(
      this,
    );
  }
}

abstract class _AlertCondition implements AlertCondition {
  const factory _AlertCondition(
      {@HiveField(0) @JsonKey(name: "t") required final AlertType type,
      @HiveField(1) @JsonKey(name: "v") final int value}) = _$_AlertCondition;

  factory _AlertCondition.fromJson(Map<String, dynamic> json) =
      _$_AlertCondition.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: "t")
  AlertType get type;
  @override
  @HiveField(1)
  @JsonKey(name: "v")
  int get value;
  @override
  @JsonKey(ignore: true)
  _$$_AlertConditionCopyWith<_$_AlertCondition> get copyWith =>
      throw _privateConstructorUsedError;
}
