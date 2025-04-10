// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'shortcut_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShortcutTypeAdapter extends TypeAdapter<ShortcutType> {
  @override
  final int typeId = 108;

  @override
  ShortcutType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ShortcutType.none;
      case 1:
        return ShortcutType.purchase;
      case 2:
        return ShortcutType.delete;
      case 3:
        return ShortcutType.web;
      case 4:
        return ShortcutType.navigation;
      case 5:
        return ShortcutType.keep;
      default:
        return ShortcutType.none;
    }
  }

  @override
  void write(BinaryWriter writer, ShortcutType obj) {
    switch (obj) {
      case ShortcutType.none:
        writer.writeByte(0);
        break;
      case ShortcutType.purchase:
        writer.writeByte(1);
        break;
      case ShortcutType.delete:
        writer.writeByte(2);
        break;
      case ShortcutType.web:
        writer.writeByte(3);
        break;
      case ShortcutType.navigation:
        writer.writeByte(4);
        break;
      case ShortcutType.keep:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShortcutTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
