// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_sub_condition.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemSubConditionAdapter extends TypeAdapter<ItemSubCondition> {
  @override
  final int typeId = 102;

  @override
  ItemSubCondition read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ItemSubCondition.newItem;
      case 1:
        return ItemSubCondition.mint;
      case 2:
        return ItemSubCondition.veryGood;
      case 3:
        return ItemSubCondition.good;
      case 4:
        return ItemSubCondition.acceptable;
      default:
        return ItemSubCondition.newItem;
    }
  }

  @override
  void write(BinaryWriter writer, ItemSubCondition obj) {
    switch (obj) {
      case ItemSubCondition.newItem:
        writer.writeByte(0);
        break;
      case ItemSubCondition.mint:
        writer.writeByte(1);
        break;
      case ItemSubCondition.veryGood:
        writer.writeByte(2);
        break;
      case ItemSubCondition.good:
        writer.writeByte(3);
        break;
      case ItemSubCondition.acceptable:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemSubConditionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
