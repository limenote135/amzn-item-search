// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'pricetar_stopper.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RevisePriceStopperAdapter extends TypeAdapter<RevisePriceStopper> {
  @override
  final int typeId = 110;

  @override
  RevisePriceStopper read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return RevisePriceStopper.nothing;
      case 1:
        return RevisePriceStopper.listingPrice;
      case 2:
        return RevisePriceStopper.profitValue;
      case 3:
        return RevisePriceStopper.profitRate;
      default:
        return RevisePriceStopper.nothing;
    }
  }

  @override
  void write(BinaryWriter writer, RevisePriceStopper obj) {
    switch (obj) {
      case RevisePriceStopper.nothing:
        writer.writeByte(0);
        break;
      case RevisePriceStopper.listingPrice:
        writer.writeByte(1);
        break;
      case RevisePriceStopper.profitValue:
        writer.writeByte(2);
        break;
      case RevisePriceStopper.profitRate:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RevisePriceStopperAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
