// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'search_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SearchSettingsTearOff {
  const _$SearchSettingsTearOff();

// ignore: unused_element
  _SearchSettings call(
      {@HiveField(0) SearchType type = SearchType.jan,
      @HiveField(1) UsedSubCondition usedSubCondition = UsedSubCondition.all,
      @HiveField(2) bool useFba = false,
      @HiveField(3) bool priorFba = false}) {
    return _SearchSettings(
      type: type,
      usedSubCondition: usedSubCondition,
      useFba: useFba,
      priorFba: priorFba,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SearchSettings = _$SearchSettingsTearOff();

/// @nodoc
mixin _$SearchSettings {
  @HiveField(0)
  SearchType get type;
  @HiveField(1)
  UsedSubCondition get usedSubCondition;
  @HiveField(2)
  bool get useFba;
  @HiveField(3)
  bool get priorFba;

  $SearchSettingsCopyWith<SearchSettings> get copyWith;
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
      @HiveField(3) bool priorFba});
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
    Object type = freezed,
    Object usedSubCondition = freezed,
    Object useFba = freezed,
    Object priorFba = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed ? _value.type : type as SearchType,
      usedSubCondition: usedSubCondition == freezed
          ? _value.usedSubCondition
          : usedSubCondition as UsedSubCondition,
      useFba: useFba == freezed ? _value.useFba : useFba as bool,
      priorFba: priorFba == freezed ? _value.priorFba : priorFba as bool,
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
      @HiveField(3) bool priorFba});
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
    Object type = freezed,
    Object usedSubCondition = freezed,
    Object useFba = freezed,
    Object priorFba = freezed,
  }) {
    return _then(_SearchSettings(
      type: type == freezed ? _value.type : type as SearchType,
      usedSubCondition: usedSubCondition == freezed
          ? _value.usedSubCondition
          : usedSubCondition as UsedSubCondition,
      useFba: useFba == freezed ? _value.useFba : useFba as bool,
      priorFba: priorFba == freezed ? _value.priorFba : priorFba as bool,
    ));
  }
}

@HiveType(typeId: searchSettingsTypeId)

/// @nodoc
class _$_SearchSettings implements _SearchSettings {
  const _$_SearchSettings(
      {@HiveField(0) this.type = SearchType.jan,
      @HiveField(1) this.usedSubCondition = UsedSubCondition.all,
      @HiveField(2) this.useFba = false,
      @HiveField(3) this.priorFba = false})
      : assert(type != null),
        assert(usedSubCondition != null),
        assert(useFba != null),
        assert(priorFba != null);

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

  @override
  String toString() {
    return 'SearchSettings(type: $type, usedSubCondition: $usedSubCondition, useFba: $useFba, priorFba: $priorFba)';
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
                    .equals(other.priorFba, priorFba)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(usedSubCondition) ^
      const DeepCollectionEquality().hash(useFba) ^
      const DeepCollectionEquality().hash(priorFba);

  @override
  _$SearchSettingsCopyWith<_SearchSettings> get copyWith =>
      __$SearchSettingsCopyWithImpl<_SearchSettings>(this, _$identity);
}

abstract class _SearchSettings implements SearchSettings {
  const factory _SearchSettings(
      {@HiveField(0) SearchType type,
      @HiveField(1) UsedSubCondition usedSubCondition,
      @HiveField(2) bool useFba,
      @HiveField(3) bool priorFba}) = _$_SearchSettings;

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
  _$SearchSettingsCopyWith<_SearchSettings> get copyWith;
}
