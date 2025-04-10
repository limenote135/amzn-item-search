// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'search_settings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchSettingsImplAdapter extends TypeAdapter<_$SearchSettingsImpl> {
  @override
  final int typeId = 40;

  @override
  _$SearchSettingsImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$SearchSettingsImpl(
      type: fields[0] as SearchType,
      usedSubCondition: fields[1] as UsedSubCondition,
      useFba: fields[2] as bool,
      priorFba: fields[3] as bool,
      continuousCameraRead: fields[4] == null ? true : fields[4] as bool,
      continuousInput: fields[5] == null ? false : fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$SearchSettingsImpl obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.usedSubCondition)
      ..writeByte(2)
      ..write(obj.useFba)
      ..writeByte(3)
      ..write(obj.priorFba)
      ..writeByte(4)
      ..write(obj.continuousCameraRead)
      ..writeByte(5)
      ..write(obj.continuousInput);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchSettingsImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
