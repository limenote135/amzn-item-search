// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'bookoff.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookoffResponseImpl _$$BookoffResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$BookoffResponseImpl(
      instoreCode: json['INSTORECODE'] as String,
      title: json['GOODS_NAME1'] as String,
      subtitle: json['GOODS_NAME2'] as String?,
      jan: json['JAN'] as String? ?? "",
    );

Map<String, dynamic> _$$BookoffResponseImplToJson(
        _$BookoffResponseImpl instance) =>
    <String, dynamic>{
      'INSTORECODE': instance.instoreCode,
      'GOODS_NAME1': instance.title,
      'GOODS_NAME2': instance.subtitle,
      'JAN': instance.jan,
    };
