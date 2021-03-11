// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchTypeAdapter extends TypeAdapter<SearchType> {
  @override
  final int typeId = 103;

  @override
  SearchType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SearchType.jan;
      case 1:
        return SearchType.bookoff;
      case 2:
        return SearchType.geo;
      case 3:
        return SearchType.tsutaya;
      case 4:
        return SearchType.freeWord;
      default:
        return SearchType.jan;
    }
  }

  @override
  void write(BinaryWriter writer, SearchType obj) {
    switch (obj) {
      case SearchType.jan:
        writer.writeByte(0);
        break;
      case SearchType.bookoff:
        writer.writeByte(1);
        break;
      case SearchType.geo:
        writer.writeByte(2);
        break;
      case SearchType.tsutaya:
        writer.writeByte(3);
        break;
      case SearchType.freeWord:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
