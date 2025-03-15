// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_search_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WordSearchHistory {
  @HiveField(0)
  String get keyword => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@HiveField(0) String keyword) $default,
  ) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@HiveField(0) String keyword)? $default, {
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of WordSearchHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WordSearchHistoryCopyWith<WordSearchHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordSearchHistoryCopyWith<$Res> {
  factory $WordSearchHistoryCopyWith(
          WordSearchHistory value, $Res Function(WordSearchHistory) then) =
      _$WordSearchHistoryCopyWithImpl<$Res, WordSearchHistory>;
  @useResult
  $Res call({@HiveField(0) String keyword});
}

/// @nodoc
class _$WordSearchHistoryCopyWithImpl<$Res, $Val extends WordSearchHistory>
    implements $WordSearchHistoryCopyWith<$Res> {
  _$WordSearchHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WordSearchHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = null,
  }) {
    return _then(_value.copyWith(
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WordSearchHistoryImplCopyWith<$Res>
    implements $WordSearchHistoryCopyWith<$Res> {
  factory _$$WordSearchHistoryImplCopyWith(_$WordSearchHistoryImpl value,
          $Res Function(_$WordSearchHistoryImpl) then) =
      __$$WordSearchHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) String keyword});
}

/// @nodoc
class __$$WordSearchHistoryImplCopyWithImpl<$Res>
    extends _$WordSearchHistoryCopyWithImpl<$Res, _$WordSearchHistoryImpl>
    implements _$$WordSearchHistoryImplCopyWith<$Res> {
  __$$WordSearchHistoryImplCopyWithImpl(_$WordSearchHistoryImpl _value,
      $Res Function(_$WordSearchHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of WordSearchHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = null,
  }) {
    return _then(_$WordSearchHistoryImpl(
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@HiveType(typeId: wordSearchHistoryTypeId)
class _$WordSearchHistoryImpl implements _WordSearchHistory {
  const _$WordSearchHistoryImpl({@HiveField(0) required this.keyword});

  @override
  @HiveField(0)
  final String keyword;

  @override
  String toString() {
    return 'WordSearchHistory(keyword: $keyword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordSearchHistoryImpl &&
            (identical(other.keyword, keyword) || other.keyword == keyword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, keyword);

  /// Create a copy of WordSearchHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WordSearchHistoryImplCopyWith<_$WordSearchHistoryImpl> get copyWith =>
      __$$WordSearchHistoryImplCopyWithImpl<_$WordSearchHistoryImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@HiveField(0) String keyword) $default,
  ) {
    return $default(keyword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@HiveField(0) String keyword)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(keyword);
    }
    return orElse();
  }
}

abstract class _WordSearchHistory implements WordSearchHistory {
  const factory _WordSearchHistory(
      {@HiveField(0) required final String keyword}) = _$WordSearchHistoryImpl;

  @override
  @HiveField(0)
  String get keyword;

  /// Create a copy of WordSearchHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WordSearchHistoryImplCopyWith<_$WordSearchHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
