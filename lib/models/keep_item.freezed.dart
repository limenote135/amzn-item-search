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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
  bool get isUpdating => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @HiveField(0) String id,
            @HiveField(1) AsinData item,
            @HiveField(2) String keepDate,
            @HiveField(3, defaultValue: "") String memo,
            bool isUpdating)
        $default,
  ) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @HiveField(0) String id,
            @HiveField(1) AsinData item,
            @HiveField(2) String keepDate,
            @HiveField(3, defaultValue: "") String memo,
            bool isUpdating)?
        $default, {
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of KeepItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      @HiveField(3, defaultValue: "") String memo,
      bool isUpdating});

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

  /// Create a copy of KeepItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? item = null,
    Object? keepDate = null,
    Object? memo = null,
    Object? isUpdating = null,
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
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of KeepItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsinDataCopyWith<$Res> get item {
    return $AsinDataCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$KeepItemImplCopyWith<$Res>
    implements $KeepItemCopyWith<$Res> {
  factory _$$KeepItemImplCopyWith(
          _$KeepItemImpl value, $Res Function(_$KeepItemImpl) then) =
      __$$KeepItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) AsinData item,
      @HiveField(2) String keepDate,
      @HiveField(3, defaultValue: "") String memo,
      bool isUpdating});

  @override
  $AsinDataCopyWith<$Res> get item;
}

/// @nodoc
class __$$KeepItemImplCopyWithImpl<$Res>
    extends _$KeepItemCopyWithImpl<$Res, _$KeepItemImpl>
    implements _$$KeepItemImplCopyWith<$Res> {
  __$$KeepItemImplCopyWithImpl(
      _$KeepItemImpl _value, $Res Function(_$KeepItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of KeepItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? item = null,
    Object? keepDate = null,
    Object? memo = null,
    Object? isUpdating = null,
  }) {
    return _then(_$KeepItemImpl(
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
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@HiveType(typeId: keepItemTypeId)
class _$KeepItemImpl implements _KeepItem {
  const _$KeepItemImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.item,
      @HiveField(2) required this.keepDate,
      @HiveField(3, defaultValue: "") this.memo = "",
      this.isUpdating = false});

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
  @JsonKey()
  final bool isUpdating;

  @override
  String toString() {
    return 'KeepItem(id: $id, item: $item, keepDate: $keepDate, memo: $memo, isUpdating: $isUpdating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KeepItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.keepDate, keepDate) ||
                other.keepDate == keepDate) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.isUpdating, isUpdating) ||
                other.isUpdating == isUpdating));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, item, keepDate, memo, isUpdating);

  /// Create a copy of KeepItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KeepItemImplCopyWith<_$KeepItemImpl> get copyWith =>
      __$$KeepItemImplCopyWithImpl<_$KeepItemImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @HiveField(0) String id,
            @HiveField(1) AsinData item,
            @HiveField(2) String keepDate,
            @HiveField(3, defaultValue: "") String memo,
            bool isUpdating)
        $default,
  ) {
    return $default(id, item, keepDate, memo, isUpdating);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @HiveField(0) String id,
            @HiveField(1) AsinData item,
            @HiveField(2) String keepDate,
            @HiveField(3, defaultValue: "") String memo,
            bool isUpdating)?
        $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, item, keepDate, memo, isUpdating);
    }
    return orElse();
  }
}

abstract class _KeepItem implements KeepItem {
  const factory _KeepItem(
      {@HiveField(0) required final String id,
      @HiveField(1) required final AsinData item,
      @HiveField(2) required final String keepDate,
      @HiveField(3, defaultValue: "") final String memo,
      final bool isUpdating}) = _$KeepItemImpl;

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
  bool get isUpdating;

  /// Create a copy of KeepItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KeepItemImplCopyWith<_$KeepItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
