// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'makad_payment_method.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MakadPaymentMethodAdapter extends TypeAdapter<MakadPaymentMethod> {
  @override
  final int typeId = 112;

  @override
  MakadPaymentMethod read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MakadPaymentMethod.all;
      case 1:
        return MakadPaymentMethod.excludeCashOnDelivery;
      case 2:
        return MakadPaymentMethod.excludeConvenience;
      case 3:
        return MakadPaymentMethod.excludeBoth;
      default:
        return MakadPaymentMethod.all;
    }
  }

  @override
  void write(BinaryWriter writer, MakadPaymentMethod obj) {
    switch (obj) {
      case MakadPaymentMethod.all:
        writer.writeByte(0);
        break;
      case MakadPaymentMethod.excludeCashOnDelivery:
        writer.writeByte(1);
        break;
      case MakadPaymentMethod.excludeConvenience:
        writer.writeByte(2);
        break;
      case MakadPaymentMethod.excludeBoth:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MakadPaymentMethodAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
