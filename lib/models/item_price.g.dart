// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_price.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemPricesAdapter extends TypeAdapter<_$_ItemPrices> {
  @override
  final int typeId = 3;

  @override
  _$_ItemPrices read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_ItemPrices(
      newPrices:
          fields[0] == null ? [] : (fields[0] as List).cast<PriceDetail>(),
      usedPrices:
          fields[1] == null ? [] : (fields[1] as List).cast<PriceDetail>(),
      feeInfo: fields[2] as FeeInfo,
    );
  }

  @override
  void write(BinaryWriter writer, _$_ItemPrices obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.newPrices)
      ..writeByte(1)
      ..write(obj.usedPrices)
      ..writeByte(2)
      ..write(obj.feeInfo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemPricesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PriceDetailAdapter extends TypeAdapter<_$_PriceDetail> {
  @override
  final int typeId = 4;

  @override
  _$_PriceDetail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_PriceDetail(
      itemCondition: fields[0] as ItemCondition,
      subCondition: fields[1] as ItemSubCondition,
      channel: fields[2] as FulfillmentChannel,
      price: fields[3] as int,
      shipping: fields[4] as int,
      point: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$_PriceDetail obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.itemCondition)
      ..writeByte(1)
      ..write(obj.subCondition)
      ..writeByte(2)
      ..write(obj.channel)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.shipping)
      ..writeByte(5)
      ..write(obj.point);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PriceDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ItemPrices _$_$_ItemPricesFromJson(Map<String, dynamic> json) {
  return _$_ItemPrices(
    newPrices: (json['new_offers'] as List<dynamic>)
        .map((e) => PriceDetail.fromJson(e as Map<String, dynamic>))
        .toList(),
    usedPrices: (json['used_offers'] as List<dynamic>)
        .map((e) => PriceDetail.fromJson(e as Map<String, dynamic>))
        .toList(),
    feeInfo: FeeInfo.fromJson(json['fee_info'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_ItemPricesToJson(_$_ItemPrices instance) =>
    <String, dynamic>{
      'new_offers': instance.newPrices,
      'used_offers': instance.usedPrices,
      'fee_info': instance.feeInfo,
    };

_$_PriceDetail _$_$_PriceDetailFromJson(Map<String, dynamic> json) {
  return _$_PriceDetail(
    itemCondition:
        const ItemConditionConverter().fromJson(json['condition'] as String?),
    subCondition: const ItemSubConditionConverter()
        .fromJson(json['sub_condition'] as String?),
    channel: const FulfillmentChannelConverter()
        .fromJson(json['channel'] as String?),
    price: json['price'] as int? ?? 0,
    shipping: json['shipping'] as int? ?? 0,
    point: json['point'] as int? ?? 0,
  );
}

Map<String, dynamic> _$_$_PriceDetailToJson(_$_PriceDetail instance) =>
    <String, dynamic>{
      'condition':
          const ItemConditionConverter().toJson(instance.itemCondition),
      'sub_condition':
          const ItemSubConditionConverter().toJson(instance.subCondition),
      'channel': const FulfillmentChannelConverter().toJson(instance.channel),
      'price': instance.price,
      'shipping': instance.shipping,
      'point': instance.point,
    };
