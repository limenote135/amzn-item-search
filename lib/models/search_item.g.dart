// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'search_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchItemImplAdapter extends TypeAdapter<_$SearchItemImpl> {
  @override
  final int typeId = 1;

  @override
  _$SearchItemImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$SearchItemImpl(
      searchDate: fields[0] as String,
      jan: fields[1] as String,
      asins: (fields[2] as List).cast<AsinData>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$SearchItemImpl obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.searchDate)
      ..writeByte(1)
      ..write(obj.jan)
      ..writeByte(2)
      ..write(obj.asins);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchItemImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
