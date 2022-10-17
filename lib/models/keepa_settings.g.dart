// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'keepa_settings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class KeepaSettingsAdapter extends TypeAdapter<_$_KeepaSettings> {
  @override
  final int typeId = 56;

  @override
  _$_KeepaSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_KeepaSettings(
      showNew: fields[0] == null ? true : fields[0] as bool,
      showUsed: fields[1] == null ? true : fields[1] as bool,
      showAmazon: fields[2] == null ? true : fields[2] as bool,
      period: fields[3] == null
          ? KeepaShowPeriod.month
          : fields[3] as KeepaShowPeriod,
      extraParam: fields[4] == null ? '' : fields[4] as String,
      showBuyBox: fields[5] == null ? true : fields[5] as bool,
      showFba: fields[6] == null ? false : fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$_KeepaSettings obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.showNew)
      ..writeByte(1)
      ..write(obj.showUsed)
      ..writeByte(2)
      ..write(obj.showAmazon)
      ..writeByte(3)
      ..write(obj.period)
      ..writeByte(4)
      ..write(obj.extraParam)
      ..writeByte(5)
      ..write(obj.showBuyBox)
      ..writeByte(6)
      ..write(obj.showFba);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KeepaSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
