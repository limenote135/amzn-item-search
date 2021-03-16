// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'used_sub_condition.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UsedSubConditionAdapter extends TypeAdapter<UsedSubCondition> {
  @override
  final int typeId = 104;

  @override
  UsedSubCondition read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return UsedSubCondition.all;
      case 1:
        return UsedSubCondition.mint;
      case 2:
        return UsedSubCondition.veryGood;
      case 3:
        return UsedSubCondition.good;
      case 4:
        return UsedSubCondition.acceptable;
      default:
        return UsedSubCondition.all;
    }
  }

  @override
  void write(BinaryWriter writer, UsedSubCondition obj) {
    switch (obj) {
      case UsedSubCondition.all:
        writer.writeByte(0);
        break;
      case UsedSubCondition.mint:
        writer.writeByte(1);
        break;
      case UsedSubCondition.veryGood:
        writer.writeByte(2);
        break;
      case UsedSubCondition.good:
        writer.writeByte(3);
        break;
      case UsedSubCondition.acceptable:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsedSubConditionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
