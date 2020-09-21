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
      {SearchType type = SearchType.jan,
      UsedSubCondition usedSubCondition = UsedSubCondition.all,
      bool useFba = false,
      bool priorFba = false}) {
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
  SearchType get type;
  UsedSubCondition get usedSubCondition;
  bool get useFba;
  bool get priorFba;

  $SearchSettingsCopyWith<SearchSettings> get copyWith;
}

/// @nodoc
abstract class $SearchSettingsCopyWith<$Res> {
  factory $SearchSettingsCopyWith(
          SearchSettings value, $Res Function(SearchSettings) then) =
      _$SearchSettingsCopyWithImpl<$Res>;
  $Res call(
      {SearchType type,
      UsedSubCondition usedSubCondition,
      bool useFba,
      bool priorFba});
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
      {SearchType type,
      UsedSubCondition usedSubCondition,
      bool useFba,
      bool priorFba});
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

/// @nodoc
class _$_SearchSettings implements _SearchSettings {
  const _$_SearchSettings(
      {this.type = SearchType.jan,
      this.usedSubCondition = UsedSubCondition.all,
      this.useFba = false,
      this.priorFba = false})
      : assert(type != null),
        assert(usedSubCondition != null),
        assert(useFba != null),
        assert(priorFba != null);

  @JsonKey(defaultValue: SearchType.jan)
  @override
  final SearchType type;
  @JsonKey(defaultValue: UsedSubCondition.all)
  @override
  final UsedSubCondition usedSubCondition;
  @JsonKey(defaultValue: false)
  @override
  final bool useFba;
  @JsonKey(defaultValue: false)
  @override
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
      {SearchType type,
      UsedSubCondition usedSubCondition,
      bool useFba,
      bool priorFba}) = _$_SearchSettings;

  @override
  SearchType get type;
  @override
  UsedSubCondition get usedSubCondition;
  @override
  bool get useFba;
  @override
  bool get priorFba;
  @override
  _$SearchSettingsCopyWith<_SearchSettings> get copyWith;
}
