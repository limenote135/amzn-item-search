// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'makad_settings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MakadSettingsAdapter extends TypeAdapter<_$_MakadSettings> {
  @override
  final int typeId = 59;

  @override
  _$_MakadSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_MakadSettings(
      newRule: fields[0] as MakadReviseRule,
      usedRule: fields[1] as MakadReviseRule,
      lowestStopperType: fields[2] as RevisePriceStopper,
      lowestStopperValue: fields[3] as int,
      paymentMethod: fields[4] as MakadPaymentMethod,
    );
  }

  @override
  void write(BinaryWriter writer, _$_MakadSettings obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.newRule)
      ..writeByte(1)
      ..write(obj.usedRule)
      ..writeByte(2)
      ..write(obj.lowestStopperType)
      ..writeByte(3)
      ..write(obj.lowestStopperValue)
      ..writeByte(4)
      ..write(obj.paymentMethod);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MakadSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
