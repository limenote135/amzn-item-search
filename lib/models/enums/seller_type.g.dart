// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'seller_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SellerTypeAdapter extends TypeAdapter<SellerType> {
  @override
  final int typeId = 116;

  @override
  SellerType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SellerType.seller;
      case 1:
        return SellerType.amazon;
      case 2:
        return SellerType.me;
      default:
        return SellerType.seller;
    }
  }

  @override
  void write(BinaryWriter writer, SellerType obj) {
    switch (obj) {
      case SellerType.seller:
        writer.writeByte(0);
        break;
      case SellerType.amazon:
        writer.writeByte(1);
        break;
      case SellerType.me:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SellerTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
