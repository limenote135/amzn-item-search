// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fulfillment_channel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FulfillmentChannelAdapter extends TypeAdapter<FulfillmentChannel> {
  @override
  final int typeId = 100;

  @override
  FulfillmentChannel read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return FulfillmentChannel.merchant;
      case 1:
        return FulfillmentChannel.amazon;
      default:
        return FulfillmentChannel.merchant;
    }
  }

  @override
  void write(BinaryWriter writer, FulfillmentChannel obj) {
    switch (obj) {
      case FulfillmentChannel.merchant:
        writer.writeByte(0);
        break;
      case FulfillmentChannel.amazon:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FulfillmentChannelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
