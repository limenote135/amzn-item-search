// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'search_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SearchSettingsTearOff {
  const _$SearchSettingsTearOff();

  _SearchSettings call(
      {@HiveField(0) SearchType type = SearchType.jan,
      @HiveField(1) UsedSubCondition usedSubCondition = UsedSubCondition.all,
      @HiveField(2) bool useFba = false,
      @HiveField(3) bool priorFba = false,
      @HiveField(4, defaultValue: true) bool continuousCameraRead = true}) {
    return _SearchSettings(
      type: type,
      usedSubCondition: usedSubCondition,
      useFba: useFba,
      priorFba: priorFba,
      continuousCameraRead: continuousCameraRead,
    );
  }
}

/// @nodoc
const $SearchSettings = _$SearchSettingsTearOff();

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

  @JsonKey(ignore: true)
  $SearchSettingsCopyWith<SearchSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchSettingsCopyWith<$Res> {
  factory $SearchSettingsCopyWith(
          SearchSettings value, $Res Function(SearchSettings) then) =
      _$SearchSettingsCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) SearchType type,
      @HiveField(1) UsedSubCondition usedSubCondition,
      @HiveField(2) bool useFba,
      @HiveField(3) bool priorFba,
      @HiveField(4, defaultValue: true) bool continuousCameraRead});
}

/// @nodoc
class _$SearchSettingsCopyWithImpl<$Res>
    implements $SearchSettingsCopyWith<$Res> {
  _$SearchSettingsCopyWithImpl(this._value, this._then);

  final SearchSettings _value;
  // ignore: unused_field
  final $Res Function(SearchSettings) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? usedSubCondition = freezed,
    Object? useFba = freezed,
    Object? priorFba = freezed,
    Object? continuousCameraRead = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SearchType,
      usedSubCondition: usedSubCondition == freezed
          ? _value.usedSubCondition
          : usedSubCondition // ignore: cast_nullable_to_non_nullable
              as UsedSubCondition,
      useFba: useFba == freezed
          ? _value.useFba
          : useFba // ignore: cast_nullable_to_non_nullable
              as bool,
      priorFba: priorFba == freezed
          ? _value.priorFba
          : priorFba // ignore: cast_nullable_to_non_nullable
              as bool,
      continuousCameraRead: continuousCameraRead == freezed
          ? _value.continuousCameraRead
          : continuousCameraRead // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$SearchSettingsCopyWith<$Res>
    implements $SearchSettingsCopyWith<$Res> {
  factory _$SearchSettingsCopyWith(
          _SearchSettings value, $Res Function(_SearchSettings) then) =
      __$SearchSettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) SearchType type,
      @HiveField(1) UsedSubCondition usedSubCondition,
      @HiveField(2) bool useFba,
      @HiveField(3) bool priorFba,
      @HiveField(4, defaultValue: true) bool continuousCameraRead});
}

/// @nodoc
class __$SearchSettingsCopyWithImpl<$Res>
    extends _$SearchSettingsCopyWithImpl<$Res>
    implements _$SearchSettingsCopyWith<$Res> {
  __$SearchSettingsCopyWithImpl(
      _SearchSettings _value, $Res Function(_SearchSettings) _then)
      : super(_value, (v) => _then(v as _SearchSettings));

  @override
  _SearchSettings get _value => super._value as _SearchSettings;

  @override
  $Res call({
    Object? type = freezed,
    Object? usedSubCondition = freezed,
    Object? useFba = freezed,
    Object? priorFba = freezed,
    Object? continuousCameraRead = freezed,
  }) {
    return _then(_SearchSettings(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SearchType,
      usedSubCondition: usedSubCondition == freezed
          ? _value.usedSubCondition
          : usedSubCondition // ignore: cast_nullable_to_non_nullable
              as UsedSubCondition,
      useFba: useFba == freezed
          ? _value.useFba
          : useFba // ignore: cast_nullable_to_non_nullable
              as bool,
      priorFba: priorFba == freezed
          ? _value.priorFba
          : priorFba // ignore: cast_nullable_to_non_nullable
              as bool,
      continuousCameraRead: continuousCameraRead == freezed
          ? _value.continuousCameraRead
          : continuousCameraRead // ignore: cast_nullable_to_non_nullable
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
      @HiveField(2) this.useFba = false,
      @HiveField(3) this.priorFba = false,
      @HiveField(4, defaultValue: true) this.continuousCameraRead = true});

  @JsonKey(defaultValue: SearchType.jan)
  @override
  @HiveField(0)
  final SearchType type;
  @JsonKey(defaultValue: UsedSubCondition.all)
  @override
  @HiveField(1)
  final UsedSubCondition usedSubCondition;
  @JsonKey(defaultValue: false)
  @override
  @HiveField(2)
  final bool useFba;
  @JsonKey(defaultValue: false)
  @override
  @HiveField(3)
  final bool priorFba;
  @JsonKey(defaultValue: true)
  @override
  @HiveField(4, defaultValue: true)
  final bool continuousCameraRead;

  @override
  String toString() {
    return 'SearchSettings(type: $type, usedSubCondition: $usedSubCondition, useFba: $useFba, priorFba: $priorFba, continuousCameraRead: $continuousCameraRead)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SearchSettings &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.usedSubCondition, usedSubCondition) ||
                const DeepCollectionEquality()
                    .equals(other.usedSubCondition, usedSubCondition)) &&
            (identical(other.useFba, useFba) ||
                const DeepCollectionEquality().equals(other.useFba, useFba)) &&
            (identical(other.priorFba, priorFba) ||
                const DeepCollectionEquality()
                    .equals(other.priorFba, priorFba)) &&
            (identical(other.continuousCameraRead, continuousCameraRead) ||
                const DeepCollectionEquality()
                    .equals(other.continuousCameraRead, continuousCameraRead)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(usedSubCondition) ^
      const DeepCollectionEquality().hash(useFba) ^
      const DeepCollectionEquality().hash(priorFba) ^
      const DeepCollectionEquality().hash(continuousCameraRead);

  @JsonKey(ignore: true)
  @override
  _$SearchSettingsCopyWith<_SearchSettings> get copyWith =>
      __$SearchSettingsCopyWithImpl<_SearchSettings>(this, _$identity);
}

abstract class _SearchSettings implements SearchSettings {
  const factory _SearchSettings(
          {@HiveField(0) SearchType type,
          @HiveField(1) UsedSubCondition usedSubCondition,
          @HiveField(2) bool useFba,
          @HiveField(3) bool priorFba,
          @HiveField(4, defaultValue: true) bool continuousCameraRead}) =
      _$_SearchSettings;

  @override
  @HiveField(0)
  SearchType get type => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  UsedSubCondition get usedSubCondition => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  bool get useFba => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  bool get priorFba => throw _privateConstructorUsedError;
  @override
  @HiveField(4, defaultValue: true)
  bool get continuousCameraRead => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SearchSettingsCopyWith<_SearchSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
