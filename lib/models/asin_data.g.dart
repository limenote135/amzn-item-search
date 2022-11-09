// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'asin_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

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
      category: fields[9] == null ? '' : fields[9] as String,
      sellByAmazon: fields[10] as bool?,
      restrictions: fields[11] == null
          ? const ListingRestrictions(newItem: false, used: false)
          : fields[11] as ListingRestrictions,
      model: fields[12] == null ? '' : fields[12] as String,
      variationRoot: fields[13] == null ? '' : fields[13] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_AsinData obj) {
    writer
      ..writeByte(14)
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
      ..write(obj.category)
      ..writeByte(10)
      ..write(obj.sellByAmazon)
      ..writeByte(11)
      ..write(obj.restrictions)
      ..writeByte(12)
      ..write(obj.model)
      ..writeByte(13)
      ..write(obj.variationRoot);
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

class ListingRestrictionsAdapter extends TypeAdapter<_$_ListingRestrictions> {
  @override
  final int typeId = 6;

  @override
  _$_ListingRestrictions read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_ListingRestrictions(
      newItem: fields[0] as bool,
      used: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$_ListingRestrictions obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.newItem)
      ..writeByte(1)
      ..write(obj.used);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListingRestrictionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AsinData _$$_AsinDataFromJson(Map<String, dynamic> json) => _$_AsinData(
      jan: json['jan'] as String? ?? "",
      asin: json['asin'] as String,
      listPrice: json['list_price'] as int? ?? 0,
      imageUrl: json['image_url'] as String,
      title: json['title'] as String,
      rank: json['rank'] as int? ?? 0,
      quantity: json['quantity'] as String? ?? " - ",
      prices: json['prices'] == null
          ? null
          : ItemPrices.fromJson(json['prices'] as Map<String, dynamic>),
      category:
          const ItemCategoryConverter().fromJson(json['category'] as String),
      sellByAmazon: json['sell_by_amazon'] as bool?,
      restrictions: json['restrictions'] == null
          ? defaultListingRestrictions
          : ListingRestrictions.fromJson(
              json['restrictions'] as Map<String, dynamic>),
      model: json['model'] as String? ?? "",
      variationRoot: json['variation_root'] as String? ?? "",
    );

Map<String, dynamic> _$$_AsinDataToJson(_$_AsinData instance) =>
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
      'sell_by_amazon': instance.sellByAmazon,
      'restrictions': instance.restrictions,
      'model': instance.model,
      'variation_root': instance.variationRoot,
    };

_$_ListingRestrictions _$$_ListingRestrictionsFromJson(
        Map<String, dynamic> json) =>
    _$_ListingRestrictions(
      newItem: json['new'] as bool? ?? false,
      used: json['used'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ListingRestrictionsToJson(
        _$_ListingRestrictions instance) =>
    <String, dynamic>{
      'new': instance.newItem,
      'used': instance.used,
    };
