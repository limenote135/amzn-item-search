// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert_condition.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlertConditionAdapter extends TypeAdapter<_$_AlertCondition> {
  @override
  final int typeId = 54;

  @override
  _$_AlertCondition read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_AlertCondition(
      type: fields[0] as AlertType,
      value: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$_AlertCondition obj) {
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
      other is AlertConditionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AlertCondition _$$_AlertConditionFromJson(Map<String, dynamic> json) =>
    _$_AlertCondition(
      type: _$enumDecode(_$AlertTypeEnumMap, json['t']),
      value: json['v'] as int? ?? 0,
    );

Map<String, dynamic> _$$_AlertConditionToJson(_$_AlertCondition instance) =>
    <String, dynamic>{
      't': _$AlertTypeEnumMap[instance.type],
      'v': instance.value,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$AlertTypeEnumMap = {
  AlertType.profit: 'profit',
  AlertType.rank: 'rank',
  AlertType.category: 'category',
  AlertType.condition: 'condition',
  AlertType.premium: 'premium',
  AlertType.noAmazon: 'noAmazon',
  AlertType.noNewOffer: 'noNewOffer',
};
