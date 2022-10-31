// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'keep_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class KeepItemAdapter extends TypeAdapter<_$_KeepItem> {
  @override
  final int typeId = 90;

  @override
  _$_KeepItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_KeepItem(
      id: fields[0] as String,
      item: fields[1] as AsinData,
      keepDate: fields[2] as String,
      memo: fields[3] == null ? '' : fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_KeepItem obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.item)
      ..writeByte(2)
      ..write(obj.keepDate)
      ..writeByte(3)
      ..write(obj.memo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KeepItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
