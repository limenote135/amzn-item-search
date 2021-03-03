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
      retailers: (fields[4] as List).cast<String>(),
      enableReadAloud: fields[5] as bool,
      patternIndex: fields[6] as int,
      readAloudPatterns: (fields[7] as List).cast<ReadAloudPattern>(),
      readAloudVolume: fields[8] as double,
      readAloudSpeed: fields[9] as double?,
      customButtons: (fields[10] as List?)?.cast<CustomButtonDetail>() ??
          defaultCustomButtons,
      csvOrder: (fields[11] as List?)?.cast<CsvColumn>() ?? _defaultCsvOrder,
      minProfit: fields[12] as int? ?? 0,
      getStocks: fields[13] as bool? ?? false,
      enableAlert: fields[14] as bool? ?? true,
      alerts: (fields[15] as List?)?.cast<AlertConditionSet>() ?? _defaultAlert,
    );
  }

  @override
  void write(BinaryWriter writer, _$_GeneralSettings obj) {
    writer
      ..writeByte(16)
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
      ..write(obj.readAloudSpeed)
      ..writeByte(10)
      ..write(obj.customButtons)
      ..writeByte(11)
      ..write(obj.csvOrder)
      ..writeByte(12)
      ..write(obj.minProfit)
      ..writeByte(13)
      ..write(obj.getStocks)
      ..writeByte(14)
      ..write(obj.enableAlert)
      ..writeByte(15)
      ..write(obj.alerts);
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

class CustomButtonDetailAdapter extends TypeAdapter<_$_CustomButtonDetail> {
  @override
  final int typeId = 52;

  @override
  _$_CustomButtonDetail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_CustomButtonDetail(
      enable: fields[0] as bool,
      title: fields[1] as String,
      pattern: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_CustomButtonDetail obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.enable)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.pattern);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomButtonDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AlertConditionSetAdapter extends TypeAdapter<_$_AlertConditionSet> {
  @override
  final int typeId = 55;

  @override
  _$_AlertConditionSet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_AlertConditionSet(
      id: fields[0] as String,
      title: fields[1] as String,
      conditions: (fields[2] as List).cast<AlertCondition>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_AlertConditionSet obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.conditions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlertConditionSetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
