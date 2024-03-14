// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera_read_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CameraReadData {
  String get code => throw _privateConstructorUsedError;
  DateTime get readAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CameraReadDataCopyWith<CameraReadData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraReadDataCopyWith<$Res> {
  factory $CameraReadDataCopyWith(
          CameraReadData value, $Res Function(CameraReadData) then) =
      _$CameraReadDataCopyWithImpl<$Res, CameraReadData>;
  @useResult
  $Res call({String code, DateTime readAt});
}

/// @nodoc
class _$CameraReadDataCopyWithImpl<$Res, $Val extends CameraReadData>
    implements $CameraReadDataCopyWith<$Res> {
  _$CameraReadDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? readAt = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      readAt: null == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CameraReadDataImplCopyWith<$Res>
    implements $CameraReadDataCopyWith<$Res> {
  factory _$$CameraReadDataImplCopyWith(_$CameraReadDataImpl value,
          $Res Function(_$CameraReadDataImpl) then) =
      __$$CameraReadDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, DateTime readAt});
}

/// @nodoc
class __$$CameraReadDataImplCopyWithImpl<$Res>
    extends _$CameraReadDataCopyWithImpl<$Res, _$CameraReadDataImpl>
    implements _$$CameraReadDataImplCopyWith<$Res> {
  __$$CameraReadDataImplCopyWithImpl(
      _$CameraReadDataImpl _value, $Res Function(_$CameraReadDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? readAt = null,
  }) {
    return _then(_$CameraReadDataImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      readAt: null == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$CameraReadDataImpl implements _CameraReadData {
  const _$CameraReadDataImpl({required this.code, required this.readAt});

  @override
  final String code;
  @override
  final DateTime readAt;

  @override
  String toString() {
    return 'CameraReadData(code: $code, readAt: $readAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CameraReadDataImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.readAt, readAt) || other.readAt == readAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, readAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CameraReadDataImplCopyWith<_$CameraReadDataImpl> get copyWith =>
      __$$CameraReadDataImplCopyWithImpl<_$CameraReadDataImpl>(
          this, _$identity);
}

abstract class _CameraReadData implements CameraReadData {
  const factory _CameraReadData(
      {required final String code,
      required final DateTime readAt}) = _$CameraReadDataImpl;

  @override
  String get code;
  @override
  DateTime get readAt;
  @override
  @JsonKey(ignore: true)
  _$$CameraReadDataImplCopyWith<_$CameraReadDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
