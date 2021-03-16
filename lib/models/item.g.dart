// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemAdapter extends TypeAdapter<_$_Item> {
  @override
  final int typeId = 1;

  @override
  _$_Item read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Item(
      searchDate: fields[0] as String,
      jan: fields[1] as String,
      asins: (fields[2] as List).cast<AsinData>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_Item obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.searchDate)
      ..writeByte(1)
      ..write(obj.jan)
      ..writeByte(2)
      ..write(obj.asins);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AsinDataAdapter extends TypeAdapter<_$_AsinData> {
  @override
  final int typeId = 2;

  @override
  _$_AsinData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_AsinData(
      jan: fields[0] as String,
      asin: fields[1] as String,
      listPrice: fields[2] as int,
      imageUrl: fields[3] as String,
      title: fields[4] as String,
      rank: fields[5] as int,
      quantity: fields[6] as String,
      prices: fields[7] as ItemPrices?,
      imageData: fields[8] as Uint8List?,
      category: fields[9] as String? ?? "",
    );
  }

  @override
  void write(BinaryWriter writer, _$_AsinData obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.jan)
      ..writeByte(1)
      ..write(obj.asin)
      ..writeByte(2)
      ..write(obj.listPrice)
      ..writeByte(3)
      ..write(obj.imageUrl)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.rank)
      ..writeByte(6)
      ..write(obj.quantity)
      ..writeByte(7)
      ..write(obj.prices)
      ..writeByte(8)
      ..write(obj.imageData)
      ..writeByte(9)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AsinDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AsinData _$_$_AsinDataFromJson(Map<String, dynamic> json) {
  return _$_AsinData(
    jan: json['jan'] as String? ?? '',
    asin: json['asin'] as String,
    listPrice: json['list_price'] as int? ?? 0,
    imageUrl: json['image_url'] as String,
    title: json['title'] as String,
    rank: json['rank'] as int? ?? 0,
    quantity: json['quantity'] as String? ?? ' - ',
    prices: json['prices'] == null
        ? null
        : ItemPrices.fromJson(json['prices'] as Map<String, dynamic>),
    category:
        const ItemCategoryConverter().fromJson(json['category'] as String?),
  );
}

Map<String, dynamic> _$_$_AsinDataToJson(_$_AsinData instance) =>
    <String, dynamic>{
      'jan': instance.jan,
      'asin': instance.asin,
      'list_price': instance.listPrice,
      'image_url': instance.imageUrl,
      'title': instance.title,
      'rank': instance.rank,
      'quantity': instance.quantity,
      'prices': instance.prices,
      'category': const ItemCategoryConverter().toJson(instance.category),
    };
