// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'alert_condition.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlertConditionImplAdapter extends TypeAdapter<_$AlertConditionImpl> {
  @override
  final int typeId = 54;

  @override
  _$AlertConditionImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$AlertConditionImpl(
      type: fields[0] as AlertType,
      value: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$AlertConditionImpl obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlertConditionImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlertConditionImpl _$$AlertConditionImplFromJson(Map<String, dynamic> json) =>
    _$AlertConditionImpl(
      type: $enumDecode(_$AlertTypeEnumMap, json['t']),
      value: json['v'] as int? ?? 0,
    );

Map<String, dynamic> _$$AlertConditionImplToJson(
        _$AlertConditionImpl instance) =>
    <String, dynamic>{
      't': _$AlertTypeEnumMap[instance.type]!,
      'v': instance.value,
    };

const _$AlertTypeEnumMap = {
  AlertType.profit: 'profit',
  AlertType.rank: 'rank',
  AlertType.category: 'category',
  AlertType.condition: 'condition',
  AlertType.premium: 'premium',
  AlertType.noAmazon: 'noAmazon',
  AlertType.noNewOffer: 'noNewOffer',
  AlertType.newOfferCount: 'newOfferCount',
  AlertType.usedOfferCount: 'usedOfferCount',
};
