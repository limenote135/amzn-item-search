// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'makad_revise_rule.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MakadReviseRuleAdapter extends TypeAdapter<MakadReviseRule> {
  @override
  final int typeId = 111;

  @override
  MakadReviseRule read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MakadReviseRule.defaultRule;
      case 1:
        return MakadReviseRule.nothing;
      case 2:
        return MakadReviseRule.usedFbaSameCondition;
      case 3:
        return MakadReviseRule.usedSameCondition;
      case 4:
        return MakadReviseRule.usedBetterLowest;
      case 5:
        return MakadReviseRule.newFbaLowest;
      case 6:
        return MakadReviseRule.newLowest;
      case 7:
        return MakadReviseRule.newSelfLowest;
      case 8:
        return MakadReviseRule.cart;
      case 9:
        return MakadReviseRule.lowest;
      default:
        return MakadReviseRule.defaultRule;
    }
  }

  @override
  void write(BinaryWriter writer, MakadReviseRule obj) {
    switch (obj) {
      case MakadReviseRule.defaultRule:
        writer.writeByte(0);
        break;
      case MakadReviseRule.nothing:
        writer.writeByte(1);
        break;
      case MakadReviseRule.usedFbaSameCondition:
        writer.writeByte(2);
        break;
      case MakadReviseRule.usedSameCondition:
        writer.writeByte(3);
        break;
      case MakadReviseRule.usedBetterLowest:
        writer.writeByte(4);
        break;
      case MakadReviseRule.newFbaLowest:
        writer.writeByte(5);
        break;
      case MakadReviseRule.newLowest:
        writer.writeByte(6);
        break;
      case MakadReviseRule.newSelfLowest:
        writer.writeByte(7);
        break;
      case MakadReviseRule.cart:
        writer.writeByte(8);
        break;
      case MakadReviseRule.lowest:
        writer.writeByte(9);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MakadReviseRuleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
