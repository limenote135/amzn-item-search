// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'keep_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$KeepItem {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  AsinData get item => throw _privateConstructorUsedError;
  @HiveField(2)
  String get keepDate => throw _privateConstructorUsedError;
  @HiveField(3, defaultValue: "")
  String get memo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $KeepItemCopyWith<KeepItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeepItemCopyWith<$Res> {
  factory $KeepItemCopyWith(KeepItem value, $Res Function(KeepItem) then) =
      _$KeepItemCopyWithImpl<$Res, KeepItem>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) AsinData item,
      @HiveField(2) String keepDate,
      @HiveField(3, defaultValue: "") String memo});

  $AsinDataCopyWith<$Res> get item;
}

/// @nodoc
class _$KeepItemCopyWithImpl<$Res, $Val extends KeepItem>
    implements $KeepItemCopyWith<$Res> {
  _$KeepItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? item = null,
    Object? keepDate = null,
    Object? memo = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as AsinData,
      keepDate: null == keepDate
          ? _value.keepDate
          : keepDate // ignore: cast_nullable_to_non_nullable
              as String,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AsinDataCopyWith<$Res> get item {
    return $AsinDataCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_KeepItemCopyWith<$Res> implements $KeepItemCopyWith<$Res> {
  factory _$$_KeepItemCopyWith(
          _$_KeepItem value, $Res Function(_$_KeepItem) then) =
      __$$_KeepItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) AsinData item,
      @HiveField(2) String keepDate,
      @HiveField(3, defaultValue: "") String memo});

  @override
  $AsinDataCopyWith<$Res> get item;
}

/// @nodoc
class __$$_KeepItemCopyWithImpl<$Res>
    extends _$KeepItemCopyWithImpl<$Res, _$_KeepItem>
    implements _$$_KeepItemCopyWith<$Res> {
  __$$_KeepItemCopyWithImpl(
      _$_KeepItem _value, $Res Function(_$_KeepItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? item = null,
    Object? keepDate = null,
    Object? memo = null,
  }) {
    return _then(_$_KeepItem(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as AsinData,
      keepDate: null == keepDate
          ? _value.keepDate
          : keepDate // ignore: cast_nullable_to_non_nullable
              as String,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@HiveType(typeId: keepItemTypeId)
class _$_KeepItem implements _KeepItem {
  const _$_KeepItem(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.item,
      @HiveField(2) required this.keepDate,
      @HiveField(3, defaultValue: "") this.memo = ""});

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final AsinData item;
  @override
  @HiveField(2)
  final String keepDate;
  @override
  @JsonKey()
  @HiveField(3, defaultValue: "")
  final String memo;

  @override
  String toString() {
    return 'KeepItem(id: $id, item: $item, keepDate: $keepDate, memo: $memo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KeepItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.keepDate, keepDate) ||
                other.keepDate == keepDate) &&
            (identical(other.memo, memo) || other.memo == memo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, item, keepDate, memo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KeepItemCopyWith<_$_KeepItem> get copyWith =>
      __$$_KeepItemCopyWithImpl<_$_KeepItem>(this, _$identity);
}

abstract class _KeepItem implements KeepItem {
  const factory _KeepItem(
      {@HiveField(0) required final String id,
      @HiveField(1) required final AsinData item,
      @HiveField(2) required final String keepDate,
      @HiveField(3, defaultValue: "") final String memo}) = _$_KeepItem;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  AsinData get item;
  @override
  @HiveField(2)
  String get keepDate;
  @override
  @HiveField(3, defaultValue: "")
  String get memo;
  @override
  @JsonKey(ignore: true)
  _$$_KeepItemCopyWith<_$_KeepItem> get copyWith =>
      throw _privateConstructorUsedError;
}
