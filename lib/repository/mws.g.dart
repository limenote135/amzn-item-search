// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'mws.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetProductByIdResponse _$$_GetProductByIdResponseFromJson(
        Map<String, dynamic> json) =>
    _$_GetProductByIdResponse(
      code: json['code'] as String,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => AsinData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <AsinData>[],
    );

Map<String, dynamic> _$$_GetProductByIdResponseToJson(
        _$_GetProductByIdResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'items': instance.items,
    };

_$_QueryItemsResponse _$$_QueryItemsResponseFromJson(
        Map<String, dynamic> json) =>
    _$_QueryItemsResponse(
      asins: (json['asins'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_QueryItemsResponseToJson(
        _$_QueryItemsResponse instance) =>
    <String, dynamic>{
      'asins': instance.asins,
    };

_$_BatchGetAsinDataResponse _$$_BatchGetAsinDataResponseFromJson(
        Map<String, dynamic> json) =>
    _$_BatchGetAsinDataResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => AsinData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BatchGetAsinDataResponseToJson(
        _$_BatchGetAsinDataResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
