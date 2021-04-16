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
