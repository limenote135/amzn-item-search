// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'size_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SizeTypeAdapter extends TypeAdapter<SizeType> {
  @override
  final int typeId = 114;

  @override
  SizeType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SizeType.normal;
      case 1:
        return SizeType.small;
      case 2:
        return SizeType.big;
      case 3:
        return SizeType.moreBig;
      default:
        return SizeType.normal;
    }
  }

  @override
  void write(BinaryWriter writer, SizeType obj) {
    switch (obj) {
      case SizeType.normal:
        writer.writeByte(0);
        break;
      case SizeType.small:
        writer.writeByte(1);
        break;
      case SizeType.big:
        writer.writeByte(2);
        break;
      case SizeType.moreBig:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SizeTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
