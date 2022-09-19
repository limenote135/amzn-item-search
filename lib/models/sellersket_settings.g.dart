// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sellersket_settings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SellerSketSettingsAdapter extends TypeAdapter<_$_SellerSketSettings> {
  @override
  final int typeId = 60;

  @override
  _$_SellerSketSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_SellerSketSettings(
      newRule: fields[0] as SellerSketReviseRule,
      usedRule: fields[1] as SellerSketReviseRule,
      lowestStopperType: fields[2] as RevisePriceStopper,
      lowestStopperValue: fields[3] as int,
      highestStopperType: fields[4] as RevisePriceStopper,
      highestStopperValue: fields[5] as int,
      shippingPattern: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_SellerSketSettings obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.newRule)
      ..writeByte(1)
      ..write(obj.usedRule)
      ..writeByte(2)
      ..write(obj.lowestStopperType)
      ..writeByte(3)
      ..write(obj.lowestStopperValue)
      ..writeByte(4)
      ..write(obj.highestStopperType)
      ..writeByte(5)
      ..write(obj.highestStopperValue)
      ..writeByte(6)
      ..write(obj.shippingPattern);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SellerSketSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
