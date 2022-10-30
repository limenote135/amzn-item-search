// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'word_search_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WordSearchHistory {
  @HiveField(0)
  String get keyword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WordSearchHistoryCopyWith<WordSearchHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordSearchHistoryCopyWith<$Res> {
  factory $WordSearchHistoryCopyWith(
          WordSearchHistory value, $Res Function(WordSearchHistory) then) =
      _$WordSearchHistoryCopyWithImpl<$Res>;
  $Res call({@HiveField(0) String keyword});
}

/// @nodoc
class _$WordSearchHistoryCopyWithImpl<$Res>
    implements $WordSearchHistoryCopyWith<$Res> {
  _$WordSearchHistoryCopyWithImpl(this._value, this._then);

  final WordSearchHistory _value;
  // ignore: unused_field
  final $Res Function(WordSearchHistory) _then;

  @override
  $Res call({
    Object? keyword = freezed,
  }) {
    return _then(_value.copyWith(
      keyword: keyword == freezed
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_WordSearchHistoryCopyWith<$Res>
    implements $WordSearchHistoryCopyWith<$Res> {
  factory _$$_WordSearchHistoryCopyWith(_$_WordSearchHistory value,
          $Res Function(_$_WordSearchHistory) then) =
      __$$_WordSearchHistoryCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) String keyword});
}

/// @nodoc
class __$$_WordSearchHistoryCopyWithImpl<$Res>
    extends _$WordSearchHistoryCopyWithImpl<$Res>
    implements _$$_WordSearchHistoryCopyWith<$Res> {
  __$$_WordSearchHistoryCopyWithImpl(
      _$_WordSearchHistory _value, $Res Function(_$_WordSearchHistory) _then)
      : super(_value, (v) => _then(v as _$_WordSearchHistory));

  @override
  _$_WordSearchHistory get _value => super._value as _$_WordSearchHistory;

  @override
  $Res call({
    Object? keyword = freezed,
  }) {
    return _then(_$_WordSearchHistory(
      keyword: keyword == freezed
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@HiveType(typeId: wordSearchHistoryTypeId)
class _$_WordSearchHistory implements _WordSearchHistory {
  const _$_WordSearchHistory({@HiveField(0) required this.keyword});

  @override
  @HiveField(0)
  final String keyword;

  @override
  String toString() {
    return 'WordSearchHistory(keyword: $keyword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WordSearchHistory &&
            const DeepCollectionEquality().equals(other.keyword, keyword));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(keyword));

  @JsonKey(ignore: true)
  @override
  _$$_WordSearchHistoryCopyWith<_$_WordSearchHistory> get copyWith =>
      __$$_WordSearchHistoryCopyWithImpl<_$_WordSearchHistory>(
          this, _$identity);
}

abstract class _WordSearchHistory implements WordSearchHistory {
  const factory _WordSearchHistory(
      {@HiveField(0) required final String keyword}) = _$_WordSearchHistory;

  @override
  @HiveField(0)
  String get keyword;
  @override
  @JsonKey(ignore: true)
  _$$_WordSearchHistoryCopyWith<_$_WordSearchHistory> get copyWith =>
      throw _privateConstructorUsedError;
}
