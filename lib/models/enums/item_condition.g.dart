// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_condition.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemConditionAdapter extends TypeAdapter<ItemCondition> {
  @override
  final int typeId = 101;

  @override
  ItemCondition read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ItemCondition.newItem;
      case 1:
        return ItemCondition.usedItem;
      default:
        return ItemCondition.newItem;
    }
  }

  @override
  void write(BinaryWriter writer, ItemCondition obj) {
    switch (obj) {
      case ItemCondition.newItem:
        writer.writeByte(0);
        break;
      case ItemCondition.usedItem:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemConditionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
