// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricetar_settings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PricetarSettingsAdapter extends TypeAdapter<_$_PricetarSettings> {
  @override
  final int typeId = 58;

  @override
  _$_PricetarSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_PricetarSettings(
      newRule: fields[0] as PricetarRule,
      usedRule: fields[1] as PricetarRule,
      lowestStopperType: fields[2] as PricetarStopperType,
      lowestStopperValue: fields[3] as int,
      highestStopperType: fields[4] as PricetarStopperType,
      highestStopperValue: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$_PricetarSettings obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.newRule)
      ..writeByte(1)
      ..write(obj.usedRule)
      ..writeByte(2)
      ..write(obj.lowestStopperType)
      ..writeByte(3)
      ..write(obj.lowestStopperValue)
      ..writeByte(4)
      ..write(obj.highestStopperType)
      ..writeByte(5)
      ..write(obj.highestStopperValue);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PricetarSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
