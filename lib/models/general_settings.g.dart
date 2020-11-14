// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_settings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GeneralSettingsAdapter extends TypeAdapter<_$_GeneralSettings> {
  @override
  final int typeId = 50;

  @override
  _$_GeneralSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_GeneralSettings(
      isDarkMode: fields[0] as bool,
      enableTargetProfit: fields[1] as bool,
      targetProfitValue: fields[2] as int,
      skuFormat: fields[3] as String,
      retailers: (fields[4] as List)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_GeneralSettings obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.isDarkMode)
      ..writeByte(1)
      ..write(obj.enableTargetProfit)
      ..writeByte(2)
      ..write(obj.targetProfitValue)
      ..writeByte(3)
      ..write(obj.skuFormat)
      ..writeByte(4)
      ..write(obj.retailers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeneralSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
