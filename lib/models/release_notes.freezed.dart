// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'release_notes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReleaseNotes _$ReleaseNotesFromJson(Map<String, dynamic> json) {
  return _ReleaseNotes.fromJson(json);
}

/// @nodoc
class _$ReleaseNotesTearOff {
  const _$ReleaseNotesTearOff();

  _ReleaseNotes call({required String version, required String text}) {
    return _ReleaseNotes(
      version: version,
      text: text,
    );
  }

  ReleaseNotes fromJson(Map<String, Object?> json) {
    return ReleaseNotes.fromJson(json);
  }
}

/// @nodoc
const $ReleaseNotes = _$ReleaseNotesTearOff();

/// @nodoc
mixin _$ReleaseNotes {
  String get version => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReleaseNotesCopyWith<ReleaseNotes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReleaseNotesCopyWith<$Res> {
  factory $ReleaseNotesCopyWith(
          ReleaseNotes value, $Res Function(ReleaseNotes) then) =
      _$ReleaseNotesCopyWithImpl<$Res>;
  $Res call({String version, String text});
}

/// @nodoc
class _$ReleaseNotesCopyWithImpl<$Res> implements $ReleaseNotesCopyWith<$Res> {
  _$ReleaseNotesCopyWithImpl(this._value, this._then);

  final ReleaseNotes _value;
  // ignore: unused_field
  final $Res Function(ReleaseNotes) _then;

  @override
  $Res call({
    Object? version = freezed,
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ReleaseNotesCopyWith<$Res>
    implements $ReleaseNotesCopyWith<$Res> {
  factory _$ReleaseNotesCopyWith(
          _ReleaseNotes value, $Res Function(_ReleaseNotes) then) =
      __$ReleaseNotesCopyWithImpl<$Res>;
  @override
  $Res call({String version, String text});
}

/// @nodoc
class __$ReleaseNotesCopyWithImpl<$Res> extends _$ReleaseNotesCopyWithImpl<$Res>
    implements _$ReleaseNotesCopyWith<$Res> {
  __$ReleaseNotesCopyWithImpl(
      _ReleaseNotes _value, $Res Function(_ReleaseNotes) _then)
      : super(_value, (v) => _then(v as _ReleaseNotes));

  @override
  _ReleaseNotes get _value => super._value as _ReleaseNotes;

  @override
  $Res call({
    Object? version = freezed,
    Object? text = freezed,
  }) {
    return _then(_ReleaseNotes(
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_ReleaseNotes implements _ReleaseNotes {
  const _$_ReleaseNotes({required this.version, required this.text});

  factory _$_ReleaseNotes.fromJson(Map<String, dynamic> json) =>
      _$$_ReleaseNotesFromJson(json);

  @override
  final String version;
  @override
  final String text;

  @override
  String toString() {
    return 'ReleaseNotes(version: $version, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReleaseNotes &&
            const DeepCollectionEquality().equals(other.version, version) &&
            const DeepCollectionEquality().equals(other.text, text));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(version),
      const DeepCollectionEquality().hash(text));

  @JsonKey(ignore: true)
  @override
  _$ReleaseNotesCopyWith<_ReleaseNotes> get copyWith =>
      __$ReleaseNotesCopyWithImpl<_ReleaseNotes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReleaseNotesToJson(this);
  }
}

abstract class _ReleaseNotes implements ReleaseNotes {
  const factory _ReleaseNotes({required String version, required String text}) =
      _$_ReleaseNotes;

  factory _ReleaseNotes.fromJson(Map<String, dynamic> json) =
      _$_ReleaseNotes.fromJson;

  @override
  String get version;
  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$ReleaseNotesCopyWith<_ReleaseNotes> get copyWith =>
      throw _privateConstructorUsedError;
}
