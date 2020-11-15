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
      enableReadAloud: fields[5] as bool,
      patternIndex: fields[6] as int,
      readAloudPatterns: (fields[7] as List)?.cast<ReadAloudPattern>(),
      readAloudVolume: fields[8] as double,
      readAloudSpeed: fields[9] as double,
    );
  }

  @override
  void write(BinaryWriter writer, _$_GeneralSettings obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.isDarkMode)
      ..writeByte(1)
      ..write(obj.enableTargetProfit)
      ..writeByte(2)
      ..write(obj.targetProfitValue)
      ..writeByte(3)
      ..write(obj.skuFormat)
      ..writeByte(4)
      ..write(obj.retailers)
      ..writeByte(5)
      ..write(obj.enableReadAloud)
      ..writeByte(6)
      ..write(obj.patternIndex)
      ..writeByte(7)
      ..write(obj.readAloudPatterns)
      ..writeByte(8)
      ..write(obj.readAloudVolume)
      ..writeByte(9)
      ..write(obj.readAloudSpeed);
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

class ReadAloudPatternAdapter extends TypeAdapter<_$_ReadAloudPattern> {
  @override
  final int typeId = 51;

  @override
  _$_ReadAloudPattern read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_ReadAloudPattern(
      title: fields[0] as String,
      pattern: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_ReadAloudPattern obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.pattern);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReadAloudPatternAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
