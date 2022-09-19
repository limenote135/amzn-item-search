// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sellersket_revise_rule.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SellerSketReviseRuleAdapter extends TypeAdapter<SellerSketReviseRule> {
  @override
  final int typeId = 113;

  @override
  SellerSketReviseRule read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SellerSketReviseRule.nothing;
      case 1:
        return SellerSketReviseRule.fbaSameCondition;
      case 2:
        return SellerSketReviseRule.sameCondition;
      case 3:
        return SellerSketReviseRule.fbaLowest;
      case 4:
        return SellerSketReviseRule.lowest;
      case 5:
        return SellerSketReviseRule.cart;
      default:
        return SellerSketReviseRule.nothing;
    }
  }

  @override
  void write(BinaryWriter writer, SellerSketReviseRule obj) {
    switch (obj) {
      case SellerSketReviseRule.nothing:
        writer.writeByte(0);
        break;
      case SellerSketReviseRule.fbaSameCondition:
        writer.writeByte(1);
        break;
      case SellerSketReviseRule.sameCondition:
        writer.writeByte(2);
        break;
      case SellerSketReviseRule.fbaLowest:
        writer.writeByte(3);
        break;
      case SellerSketReviseRule.lowest:
        writer.writeByte(4);
        break;
      case SellerSketReviseRule.cart:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SellerSketReviseRuleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
