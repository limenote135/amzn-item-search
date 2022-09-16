// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricetar_rule.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PricetarRuleAdapter extends TypeAdapter<PricetarRule> {
  @override
  final int typeId = 109;

  @override
  PricetarRule read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return PricetarRule.nothing;
      case 1:
        return PricetarRule.fbaSameCondition;
      case 2:
        return PricetarRule.sameCondition;
      case 3:
        return PricetarRule.fbaLowest;
      case 4:
        return PricetarRule.lowest;
      case 5:
        return PricetarRule.cart;
      default:
        return PricetarRule.nothing;
    }
  }

  @override
  void write(BinaryWriter writer, PricetarRule obj) {
    switch (obj) {
      case PricetarRule.nothing:
        writer.writeByte(0);
        break;
      case PricetarRule.fbaSameCondition:
        writer.writeByte(1);
        break;
      case PricetarRule.sameCondition:
        writer.writeByte(2);
        break;
      case PricetarRule.fbaLowest:
        writer.writeByte(3);
        break;
      case PricetarRule.lowest:
        writer.writeByte(4);
        break;
      case PricetarRule.cart:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PricetarRuleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
