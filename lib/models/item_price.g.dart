// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'item_price.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemPricesImplAdapter extends TypeAdapter<_$ItemPricesImpl> {
  @override
  final int typeId = 3;

  @override
  _$ItemPricesImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$ItemPricesImpl(
      newPrices:
          fields[0] == null ? [] : (fields[0] as List).cast<PriceDetail>(),
      usedPrices:
          fields[1] == null ? [] : (fields[1] as List).cast<PriceDetail>(),
      feeInfo: fields[2] as FeeInfo,
    );
  }

  @override
  void write(BinaryWriter writer, _$ItemPricesImpl obj) {
    writer
      ..writeByte(3)
      ..writeByte(2)
      ..write(obj.feeInfo)
      ..writeByte(0)
      ..write(obj.newPrices)
      ..writeByte(1)
      ..write(obj.usedPrices);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemPricesImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PriceDetailImplAdapter extends TypeAdapter<_$PriceDetailImpl> {
  @override
  final int typeId = 4;

  @override
  _$PriceDetailImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$PriceDetailImpl(
      itemCondition: fields[0] as ItemCondition,
      subCondition: fields[1] as ItemSubCondition,
      channel: fields[2] as FulfillmentChannel,
      price: fields[3] as int,
      shipping: fields[4] as int,
      point: fields[5] as int,
      isCart: fields[6] == null ? false : fields[6] as bool,
      isSelf: fields[7] == null ? false : fields[7] as bool,
      sellerType:
          fields[8] == null ? SellerType.seller : fields[8] as SellerType,
    );
  }

  @override
  void write(BinaryWriter writer, _$PriceDetailImpl obj) {
    writer
      ..writeByte(9)
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
      ..write(obj.point)
      ..writeByte(6)
      ..write(obj.isCart)
      ..writeByte(7)
      ..write(obj.isSelf)
      ..writeByte(8)
      ..write(obj.sellerType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PriceDetailImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemPricesImpl _$$ItemPricesImplFromJson(Map<String, dynamic> json) =>
    _$ItemPricesImpl(
      newPrices: (json['new_offers'] as List<dynamic>?)
              ?.map((e) => PriceDetail.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PriceDetail>[],
      usedPrices: (json['used_offers'] as List<dynamic>?)
              ?.map((e) => PriceDetail.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PriceDetail>[],
      feeInfo: json['fee_info'] == null
          ? const FeeInfo()
          : FeeInfo.fromJson(json['fee_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ItemPricesImplToJson(_$ItemPricesImpl instance) =>
    <String, dynamic>{
      'new_offers': instance.newPrices,
      'used_offers': instance.usedPrices,
      'fee_info': instance.feeInfo,
    };

_$PriceDetailImpl _$$PriceDetailImplFromJson(Map<String, dynamic> json) =>
    _$PriceDetailImpl(
      itemCondition: json['condition'] == null
          ? ItemCondition.newItem
          : const ItemConditionConverter()
              .fromJson(json['condition'] as String),
      subCondition: json['sub_condition'] == null
          ? ItemSubCondition.newItem
          : const ItemSubConditionConverter()
              .fromJson(json['sub_condition'] as String),
      channel: json['channel'] == null
          ? FulfillmentChannel.merchant
          : const FulfillmentChannelConverter()
              .fromJson(json['channel'] as String),
      price: (json['price'] as num?)?.toInt() ?? 0,
      shipping: (json['shipping'] as num?)?.toInt() ?? 0,
      point: (json['point'] as num?)?.toInt() ?? 0,
      isCart: json['is_cart'] as bool? ?? false,
      isSelf: json['is_self'] as bool? ?? false,
      sellerType: json['type'] == null
          ? SellerType.seller
          : const SellerTypeConverter().fromJson(json['type'] as String),
    );

Map<String, dynamic> _$$PriceDetailImplToJson(_$PriceDetailImpl instance) =>
    <String, dynamic>{
      'condition':
          const ItemConditionConverter().toJson(instance.itemCondition),
      'sub_condition':
          const ItemSubConditionConverter().toJson(instance.subCondition),
      'channel': const FulfillmentChannelConverter().toJson(instance.channel),
      'price': instance.price,
      'shipping': instance.shipping,
      'point': instance.point,
      'is_cart': instance.isCart,
      'is_self': instance.isSelf,
      'type': const SellerTypeConverter().toJson(instance.sellerType),
    };
