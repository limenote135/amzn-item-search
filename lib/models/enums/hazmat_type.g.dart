// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'hazmat_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HazmatTypeAdapter extends TypeAdapter<HazmatType> {
  @override
  final int typeId = 115;

  @override
  HazmatType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return HazmatType.nonHazmat;
      case 1:
        return HazmatType.sds;
      case 2:
        return HazmatType.battery;
      case 3:
        return HazmatType.warn;
      case 4:
        return HazmatType.hazmat;
      case 5:
        return HazmatType.unknown;
      case 6:
        return HazmatType.qualification;
      default:
        return HazmatType.nonHazmat;
    }
  }

  @override
  void write(BinaryWriter writer, HazmatType obj) {
    switch (obj) {
      case HazmatType.nonHazmat:
        writer.writeByte(0);
        break;
      case HazmatType.sds:
        writer.writeByte(1);
        break;
      case HazmatType.battery:
        writer.writeByte(2);
        break;
      case HazmatType.warn:
        writer.writeByte(3);
        break;
      case HazmatType.hazmat:
        writer.writeByte(4);
        break;
      case HazmatType.unknown:
        writer.writeByte(5);
        break;
      case HazmatType.qualification:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HazmatTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
