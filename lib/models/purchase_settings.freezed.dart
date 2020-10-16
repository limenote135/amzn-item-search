// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'purchase_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$PurchaseSettingsTearOff {
  const _$PurchaseSettingsTearOff();

// ignore: unused_element
  _PurchaseSettings call(
      {@required GlobalKey<FormState> formKey,
      int purchasePrice = 0,
      int sellPrice = 0,
      bool useFba = true,
      int amount = 1,
      PurchaseItemCondition condition = PurchaseItemCondition.newItem,
      String sku = "",
      String memo = ""}) {
    return _PurchaseSettings(
      formKey: formKey,
      purchasePrice: purchasePrice,
      sellPrice: sellPrice,
      useFba: useFba,
      amount: amount,
      condition: condition,
      sku: sku,
      memo: memo,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $PurchaseSettings = _$PurchaseSettingsTearOff();

/// @nodoc
mixin _$PurchaseSettings {
  GlobalKey<FormState> get formKey;
  int get purchasePrice;
  int get sellPrice;
  bool get useFba;
  int get amount;
  PurchaseItemCondition get condition;
  String get sku;
  String get memo;

  $PurchaseSettingsCopyWith<PurchaseSettings> get copyWith;
}

/// @nodoc
abstract class $PurchaseSettingsCopyWith<$Res> {
  factory $PurchaseSettingsCopyWith(
          PurchaseSettings value, $Res Function(PurchaseSettings) then) =
      _$PurchaseSettingsCopyWithImpl<$Res>;
  $Res call(
      {GlobalKey<FormState> formKey,
      int purchasePrice,
      int sellPrice,
      bool useFba,
      int amount,
      PurchaseItemCondition condition,
      String sku,
      String memo});
}

/// @nodoc
class _$PurchaseSettingsCopyWithImpl<$Res>
    implements $PurchaseSettingsCopyWith<$Res> {
  _$PurchaseSettingsCopyWithImpl(this._value, this._then);

  final PurchaseSettings _value;
  // ignore: unused_field
  final $Res Function(PurchaseSettings) _then;

  @override
  $Res call({
    Object formKey = freezed,
    Object purchasePrice = freezed,
    Object sellPrice = freezed,
    Object useFba = freezed,
    Object amount = freezed,
    Object condition = freezed,
    Object sku = freezed,
    Object memo = freezed,
  }) {
    return _then(_value.copyWith(
      formKey:
          formKey == freezed ? _value.formKey : formKey as GlobalKey<FormState>,
      purchasePrice: purchasePrice == freezed
          ? _value.purchasePrice
          : purchasePrice as int,
      sellPrice: sellPrice == freezed ? _value.sellPrice : sellPrice as int,
      useFba: useFba == freezed ? _value.useFba : useFba as bool,
      amount: amount == freezed ? _value.amount : amount as int,
      condition: condition == freezed
          ? _value.condition
          : condition as PurchaseItemCondition,
      sku: sku == freezed ? _value.sku : sku as String,
      memo: memo == freezed ? _value.memo : memo as String,
    ));
  }
}

/// @nodoc
abstract class _$PurchaseSettingsCopyWith<$Res>
    implements $PurchaseSettingsCopyWith<$Res> {
  factory _$PurchaseSettingsCopyWith(
          _PurchaseSettings value, $Res Function(_PurchaseSettings) then) =
      __$PurchaseSettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {GlobalKey<FormState> formKey,
      int purchasePrice,
      int sellPrice,
      bool useFba,
      int amount,
      PurchaseItemCondition condition,
      String sku,
      String memo});
}

/// @nodoc
class __$PurchaseSettingsCopyWithImpl<$Res>
    extends _$PurchaseSettingsCopyWithImpl<$Res>
    implements _$PurchaseSettingsCopyWith<$Res> {
  __$PurchaseSettingsCopyWithImpl(
      _PurchaseSettings _value, $Res Function(_PurchaseSettings) _then)
      : super(_value, (v) => _then(v as _PurchaseSettings));

  @override
  _PurchaseSettings get _value => super._value as _PurchaseSettings;

  @override
  $Res call({
    Object formKey = freezed,
    Object purchasePrice = freezed,
    Object sellPrice = freezed,
    Object useFba = freezed,
    Object amount = freezed,
    Object condition = freezed,
    Object sku = freezed,
    Object memo = freezed,
  }) {
    return _then(_PurchaseSettings(
      formKey:
          formKey == freezed ? _value.formKey : formKey as GlobalKey<FormState>,
      purchasePrice: purchasePrice == freezed
          ? _value.purchasePrice
          : purchasePrice as int,
      sellPrice: sellPrice == freezed ? _value.sellPrice : sellPrice as int,
      useFba: useFba == freezed ? _value.useFba : useFba as bool,
      amount: amount == freezed ? _value.amount : amount as int,
      condition: condition == freezed
          ? _value.condition
          : condition as PurchaseItemCondition,
      sku: sku == freezed ? _value.sku : sku as String,
      memo: memo == freezed ? _value.memo : memo as String,
    ));
  }
}

/// @nodoc
class _$_PurchaseSettings implements _PurchaseSettings {
  const _$_PurchaseSettings(
      {@required this.formKey,
      this.purchasePrice = 0,
      this.sellPrice = 0,
      this.useFba = true,
      this.amount = 1,
      this.condition = PurchaseItemCondition.newItem,
      this.sku = "",
      this.memo = ""})
      : assert(formKey != null),
        assert(purchasePrice != null),
        assert(sellPrice != null),
        assert(useFba != null),
        assert(amount != null),
        assert(condition != null),
        assert(sku != null),
        assert(memo != null);

  @override
  final GlobalKey<FormState> formKey;
  @JsonKey(defaultValue: 0)
  @override
  final int purchasePrice;
  @JsonKey(defaultValue: 0)
  @override
  final int sellPrice;
  @JsonKey(defaultValue: true)
  @override
  final bool useFba;
  @JsonKey(defaultValue: 1)
  @override
  final int amount;
  @JsonKey(defaultValue: PurchaseItemCondition.newItem)
  @override
  final PurchaseItemCondition condition;
  @JsonKey(defaultValue: "")
  @override
  final String sku;
  @JsonKey(defaultValue: "")
  @override
  final String memo;

  @override
  String toString() {
    return 'PurchaseSettings(formKey: $formKey, purchasePrice: $purchasePrice, sellPrice: $sellPrice, useFba: $useFba, amount: $amount, condition: $condition, sku: $sku, memo: $memo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PurchaseSettings &&
            (identical(other.formKey, formKey) ||
                const DeepCollectionEquality()
                    .equals(other.formKey, formKey)) &&
            (identical(other.purchasePrice, purchasePrice) ||
                const DeepCollectionEquality()
                    .equals(other.purchasePrice, purchasePrice)) &&
            (identical(other.sellPrice, sellPrice) ||
                const DeepCollectionEquality()
                    .equals(other.sellPrice, sellPrice)) &&
            (identical(other.useFba, useFba) ||
                const DeepCollectionEquality().equals(other.useFba, useFba)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.condition, condition) ||
                const DeepCollectionEquality()
                    .equals(other.condition, condition)) &&
            (identical(other.sku, sku) ||
                const DeepCollectionEquality().equals(other.sku, sku)) &&
            (identical(other.memo, memo) ||
                const DeepCollectionEquality().equals(other.memo, memo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(formKey) ^
      const DeepCollectionEquality().hash(purchasePrice) ^
      const DeepCollectionEquality().hash(sellPrice) ^
      const DeepCollectionEquality().hash(useFba) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(condition) ^
      const DeepCollectionEquality().hash(sku) ^
      const DeepCollectionEquality().hash(memo);

  @override
  _$PurchaseSettingsCopyWith<_PurchaseSettings> get copyWith =>
      __$PurchaseSettingsCopyWithImpl<_PurchaseSettings>(this, _$identity);
}

abstract class _PurchaseSettings implements PurchaseSettings {
  const factory _PurchaseSettings(
      {@required GlobalKey<FormState> formKey,
      int purchasePrice,
      int sellPrice,
      bool useFba,
      int amount,
      PurchaseItemCondition condition,
      String sku,
      String memo}) = _$_PurchaseSettings;

  @override
  GlobalKey<FormState> get formKey;
  @override
  int get purchasePrice;
  @override
  int get sellPrice;
  @override
  bool get useFba;
  @override
  int get amount;
  @override
  PurchaseItemCondition get condition;
  @override
  String get sku;
  @override
  String get memo;
  @override
  _$PurchaseSettingsCopyWith<_PurchaseSettings> get copyWith;
}
