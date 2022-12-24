// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchSettings {
  @HiveField(0)
  SearchType get type => throw _privateConstructorUsedError;
  @HiveField(1)
  UsedSubCondition get usedSubCondition => throw _privateConstructorUsedError;
  @HiveField(2)
  bool get useFba => throw _privateConstructorUsedError;
  @HiveField(3)
  bool get priorFba => throw _privateConstructorUsedError;
  @HiveField(4, defaultValue: true)
  bool get continuousCameraRead => throw _privateConstructorUsedError;
  @HiveField(5, defaultValue: false)
  bool get continuousInput => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchSettingsCopyWith<SearchSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchSettingsCopyWith<$Res> {
  factory $SearchSettingsCopyWith(
          SearchSettings value, $Res Function(SearchSettings) then) =
      _$SearchSettingsCopyWithImpl<$Res, SearchSettings>;
  @useResult
  $Res call(
      {@HiveField(0) SearchType type,
      @HiveField(1) UsedSubCondition usedSubCondition,
      @HiveField(2) bool useFba,
      @HiveField(3) bool priorFba,
      @HiveField(4, defaultValue: true) bool continuousCameraRead,
      @HiveField(5, defaultValue: false) bool continuousInput});
}

/// @nodoc
class _$SearchSettingsCopyWithImpl<$Res, $Val extends SearchSettings>
    implements $SearchSettingsCopyWith<$Res> {
  _$SearchSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? usedSubCondition = null,
    Object? useFba = null,
    Object? priorFba = null,
    Object? continuousCameraRead = null,
    Object? continuousInput = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SearchType,
      usedSubCondition: null == usedSubCondition
          ? _value.usedSubCondition
          : usedSubCondition // ignore: cast_nullable_to_non_nullable
              as UsedSubCondition,
      useFba: null == useFba
          ? _value.useFba
          : useFba // ignore: cast_nullable_to_non_nullable
              as bool,
      priorFba: null == priorFba
          ? _value.priorFba
          : priorFba // ignore: cast_nullable_to_non_nullable
              as bool,
      continuousCameraRead: null == continuousCameraRead
          ? _value.continuousCameraRead
          : continuousCameraRead // ignore: cast_nullable_to_non_nullable
              as bool,
      continuousInput: null == continuousInput
          ? _value.continuousInput
          : continuousInput // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchSettingsCopyWith<$Res>
    implements $SearchSettingsCopyWith<$Res> {
  factory _$$_SearchSettingsCopyWith(
          _$_SearchSettings value, $Res Function(_$_SearchSettings) then) =
      __$$_SearchSettingsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) SearchType type,
      @HiveField(1) UsedSubCondition usedSubCondition,
      @HiveField(2) bool useFba,
      @HiveField(3) bool priorFba,
      @HiveField(4, defaultValue: true) bool continuousCameraRead,
      @HiveField(5, defaultValue: false) bool continuousInput});
}

/// @nodoc
class __$$_SearchSettingsCopyWithImpl<$Res>
    extends _$SearchSettingsCopyWithImpl<$Res, _$_SearchSettings>
    implements _$$_SearchSettingsCopyWith<$Res> {
  __$$_SearchSettingsCopyWithImpl(
      _$_SearchSettings _value, $Res Function(_$_SearchSettings) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? usedSubCondition = null,
    Object? useFba = null,
    Object? priorFba = null,
    Object? continuousCameraRead = null,
    Object? continuousInput = null,
  }) {
    return _then(_$_SearchSettings(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SearchType,
      usedSubCondition: null == usedSubCondition
          ? _value.usedSubCondition
          : usedSubCondition // ignore: cast_nullable_to_non_nullable
              as UsedSubCondition,
      useFba: null == useFba
          ? _value.useFba
          : useFba // ignore: cast_nullable_to_non_nullable
              as bool,
      priorFba: null == priorFba
          ? _value.priorFba
          : priorFba // ignore: cast_nullable_to_non_nullable
              as bool,
      continuousCameraRead: null == continuousCameraRead
          ? _value.continuousCameraRead
          : continuousCameraRead // ignore: cast_nullable_to_non_nullable
              as bool,
      continuousInput: null == continuousInput
          ? _value.continuousInput
          : continuousInput // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@HiveType(typeId: searchSettingsTypeId)
class _$_SearchSettings implements _SearchSettings {
  const _$_SearchSettings(
      {@HiveField(0) this.type = SearchType.jan,
      @HiveField(1) this.usedSubCondition = UsedSubCondition.all,
      @HiveField(2) this.useFba = true,
      @HiveField(3) this.priorFba = true,
      @HiveField(4, defaultValue: true) this.continuousCameraRead = true,
      @HiveField(5, defaultValue: false) this.continuousInput = false});

  @override
  @JsonKey()
  @HiveField(0)
  final SearchType type;
  @override
  @JsonKey()
  @HiveField(1)
  final UsedSubCondition usedSubCondition;
  @override
  @JsonKey()
  @HiveField(2)
  final bool useFba;
  @override
  @JsonKey()
  @HiveField(3)
  final bool priorFba;
  @override
  @JsonKey()
  @HiveField(4, defaultValue: true)
  final bool continuousCameraRead;
  @override
  @JsonKey()
  @HiveField(5, defaultValue: false)
  final bool continuousInput;

  @override
  String toString() {
    return 'SearchSettings(type: $type, usedSubCondition: $usedSubCondition, useFba: $useFba, priorFba: $priorFba, continuousCameraRead: $continuousCameraRead, continuousInput: $continuousInput)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchSettings &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.usedSubCondition, usedSubCondition) ||
                other.usedSubCondition == usedSubCondition) &&
            (identical(other.useFba, useFba) || other.useFba == useFba) &&
            (identical(other.priorFba, priorFba) ||
                other.priorFba == priorFba) &&
            (identical(other.continuousCameraRead, continuousCameraRead) ||
                other.continuousCameraRead == continuousCameraRead) &&
            (identical(other.continuousInput, continuousInput) ||
                other.continuousInput == continuousInput));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, usedSubCondition, useFba,
      priorFba, continuousCameraRead, continuousInput);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchSettingsCopyWith<_$_SearchSettings> get copyWith =>
      __$$_SearchSettingsCopyWithImpl<_$_SearchSettings>(this, _$identity);
}

abstract class _SearchSettings implements SearchSettings {
  const factory _SearchSettings(
          {@HiveField(0) final SearchType type,
          @HiveField(1) final UsedSubCondition usedSubCondition,
          @HiveField(2) final bool useFba,
          @HiveField(3) final bool priorFba,
          @HiveField(4, defaultValue: true) final bool continuousCameraRead,
          @HiveField(5, defaultValue: false) final bool continuousInput}) =
      _$_SearchSettings;

  @override
  @HiveField(0)
  SearchType get type;
  @override
  @HiveField(1)
  UsedSubCondition get usedSubCondition;
  @override
  @HiveField(2)
  bool get useFba;
  @override
  @HiveField(3)
  bool get priorFba;
  @override
  @HiveField(4, defaultValue: true)
  bool get continuousCameraRead;
  @override
  @HiveField(5, defaultValue: false)
  bool get continuousInput;
  @override
  @JsonKey(ignore: true)
  _$$_SearchSettingsCopyWith<_$_SearchSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
