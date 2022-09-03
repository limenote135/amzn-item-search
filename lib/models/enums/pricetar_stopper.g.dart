// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricetar_stopper.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PricetarStopperTypeAdapter extends TypeAdapter<PricetarStopperType> {
  @override
  final int typeId = 110;

  @override
  PricetarStopperType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return PricetarStopperType.nothing;
      case 1:
        return PricetarStopperType.listingPrice;
      case 2:
        return PricetarStopperType.profitValue;
      case 3:
        return PricetarStopperType.profitRate;
      default:
        return PricetarStopperType.nothing;
    }
  }

  @override
  void write(BinaryWriter writer, PricetarStopperType obj) {
    switch (obj) {
      case PricetarStopperType.nothing:
        writer.writeByte(0);
        break;
      case PricetarStopperType.listingPrice:
        writer.writeByte(1);
        break;
      case PricetarStopperType.profitValue:
        writer.writeByte(2);
        break;
      case PricetarStopperType.profitRate:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PricetarStopperTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
