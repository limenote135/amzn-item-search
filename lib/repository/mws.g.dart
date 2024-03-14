// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'mws.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetProductByIdResponseImpl _$$GetProductByIdResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetProductByIdResponseImpl(
      code: json['code'] as String,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => AsinData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <AsinData>[],
    );

Map<String, dynamic> _$$GetProductByIdResponseImplToJson(
        _$GetProductByIdResponseImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'items': instance.items,
    };

_$QueryItemsResponseImpl _$$QueryItemsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$QueryItemsResponseImpl(
      asins: (json['asins'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$QueryItemsResponseImplToJson(
        _$QueryItemsResponseImpl instance) =>
    <String, dynamic>{
      'asins': instance.asins,
    };

_$BatchGetAsinDataResponseImpl _$$BatchGetAsinDataResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$BatchGetAsinDataResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => AsinData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BatchGetAsinDataResponseImplToJson(
        _$BatchGetAsinDataResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$GetItemVariationsResponseImpl _$$GetItemVariationsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetItemVariationsResponseImpl(
      asins:
          (json['asins'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const <String>[],
    );

Map<String, dynamic> _$$GetItemVariationsResponseImplToJson(
        _$GetItemVariationsResponseImpl instance) =>
    <String, dynamic>{
      'asins': instance.asins,
    };
