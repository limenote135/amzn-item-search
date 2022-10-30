// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'word_search_history.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WordSearchHistoryAdapter extends TypeAdapter<_$_WordSearchHistory> {
  @override
  final int typeId = 80;

  @override
  _$_WordSearchHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_WordSearchHistory(
      keyword: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_WordSearchHistory obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.keyword);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WordSearchHistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
