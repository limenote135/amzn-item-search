// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mws.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetProductByIdResponse _$$_GetProductByIdResponseFromJson(
        Map<String, dynamic> json) =>
    _$_GetProductByIdResponse(
      jan: json['jan'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => AsinData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_GetProductByIdResponseToJson(
        _$_GetProductByIdResponse instance) =>
    <String, dynamic>{
      'jan': instance.jan,
      'items': instance.items,
    };

_$_GetProductPricesResponse _$$_GetProductPricesResponseFromJson(
        Map<String, dynamic> json) =>
    _$_GetProductPricesResponse(
      prices: json['prices'] == null
          ? null
          : ItemPrices.fromJson(json['prices'] as Map<String, dynamic>),
      sellByAmazon: json['sell_by_amazon'] as bool?,
    );

Map<String, dynamic> _$$_GetProductPricesResponseToJson(
        _$_GetProductPricesResponse instance) =>
    <String, dynamic>{
      'prices': instance.prices,
      'sell_by_amazon': instance.sellByAmazon,
    };

_$_ListMatchingProductResponse _$$_ListMatchingProductResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ListMatchingProductResponse(
      items: (json['items'] as List<dynamic>)
          .map((e) => AsinData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ListMatchingProductResponseToJson(
        _$_ListMatchingProductResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
