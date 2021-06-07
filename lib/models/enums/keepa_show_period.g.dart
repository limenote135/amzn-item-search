// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keepa_show_period.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class KeepaShowPeriodAdapter extends TypeAdapter<KeepaShowPeriod> {
  @override
  final int typeId = 107;

  @override
  KeepaShowPeriod read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return KeepaShowPeriod.day;
      case 1:
        return KeepaShowPeriod.week;
      case 2:
        return KeepaShowPeriod.month;
      case 3:
        return KeepaShowPeriod.threeMonth;
      case 4:
        return KeepaShowPeriod.year;
      default:
        return KeepaShowPeriod.day;
    }
  }

  @override
  void write(BinaryWriter writer, KeepaShowPeriod obj) {
    switch (obj) {
      case KeepaShowPeriod.day:
        writer.writeByte(0);
        break;
      case KeepaShowPeriod.week:
        writer.writeByte(1);
        break;
      case KeepaShowPeriod.month:
        writer.writeByte(2);
        break;
      case KeepaShowPeriod.threeMonth:
        writer.writeByte(3);
        break;
      case KeepaShowPeriod.year:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KeepaShowPeriodAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
