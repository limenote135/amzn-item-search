// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_settings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchSettingsAdapter extends TypeAdapter<_$_SearchSettings> {
  @override
  final int typeId = 40;

  @override
  _$_SearchSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_SearchSettings(
      type: fields[0] as SearchType,
      usedSubCondition: fields[1] as UsedSubCondition,
      useFba: fields[2] as bool,
      priorFba: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$_SearchSettings obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.usedSubCondition)
      ..writeByte(2)
      ..write(obj.useFba)
      ..writeByte(3)
      ..write(obj.priorFba);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
