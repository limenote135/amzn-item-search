// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'keepa_settings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class KeepaSettingsImplAdapter extends TypeAdapter<_$KeepaSettingsImpl> {
  @override
  final int typeId = 56;

  @override
  _$KeepaSettingsImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$KeepaSettingsImpl(
      showNew: fields[0] == null ? true : fields[0] as bool,
      showUsed: fields[1] == null ? true : fields[1] as bool,
      showAmazon: fields[2] == null ? true : fields[2] as bool,
      period: fields[3] == null
          ? KeepaShowPeriod.month
          : fields[3] as KeepaShowPeriod,
      extraParam: fields[4] == null ? '' : fields[4] as String,
      showBuyBox: fields[5] == null ? true : fields[5] as bool,
      showFba: fields[6] == null ? false : fields[6] as bool,
      useApiKey: fields[7] == null ? false : fields[7] as bool,
      apiKey: fields[8] == null ? '' : fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$KeepaSettingsImpl obj) {
    writer
      ..writeByte(9)
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
      ..write(obj.showFba)
      ..writeByte(7)
      ..write(obj.useApiKey)
      ..writeByte(8)
      ..write(obj.apiKey);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KeepaSettingsImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
