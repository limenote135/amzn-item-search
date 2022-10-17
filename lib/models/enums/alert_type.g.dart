// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'alert_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlertTypeAdapter extends TypeAdapter<AlertType> {
  @override
  final int typeId = 105;

  @override
  AlertType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AlertType.profit;
      case 1:
        return AlertType.rank;
      case 2:
        return AlertType.category;
      case 3:
        return AlertType.condition;
      case 4:
        return AlertType.premium;
      case 5:
        return AlertType.noAmazon;
      case 6:
        return AlertType.noNewOffer;
      default:
        return AlertType.profit;
    }
  }

  @override
  void write(BinaryWriter writer, AlertType obj) {
    switch (obj) {
      case AlertType.profit:
        writer.writeByte(0);
        break;
      case AlertType.rank:
        writer.writeByte(1);
        break;
      case AlertType.category:
        writer.writeByte(2);
        break;
      case AlertType.condition:
        writer.writeByte(3);
        break;
      case AlertType.premium:
        writer.writeByte(4);
        break;
      case AlertType.noAmazon:
        writer.writeByte(5);
        break;
      case AlertType.noNewOffer:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlertTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AlertOfferConditionAdapter extends TypeAdapter<AlertOfferCondition> {
  @override
  final int typeId = 106;

  @override
  AlertOfferCondition read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AlertOfferCondition.newItem;
      case 1:
        return AlertOfferCondition.usedAll;
      case 2:
        return AlertOfferCondition.usedMint;
      case 3:
        return AlertOfferCondition.usedVeryGood;
      case 4:
        return AlertOfferCondition.usedGood;
      case 5:
        return AlertOfferCondition.usedAcceptable;
      default:
        return AlertOfferCondition.newItem;
    }
  }

  @override
  void write(BinaryWriter writer, AlertOfferCondition obj) {
    switch (obj) {
      case AlertOfferCondition.newItem:
        writer.writeByte(0);
        break;
      case AlertOfferCondition.usedAll:
        writer.writeByte(1);
        break;
      case AlertOfferCondition.usedMint:
        writer.writeByte(2);
        break;
      case AlertOfferCondition.usedVeryGood:
        writer.writeByte(3);
        break;
      case AlertOfferCondition.usedGood:
        writer.writeByte(4);
        break;
      case AlertOfferCondition.usedAcceptable:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlertOfferConditionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
