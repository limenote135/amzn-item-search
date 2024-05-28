// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'keepa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KeepaTokenStatusResponseImpl _$$KeepaTokenStatusResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$KeepaTokenStatusResponseImpl(
      timestamp: (json['timestamp'] as num).toInt(),
      tokensLeft: (json['tokensLeft'] as num).toInt(),
      refillIn: (json['refillIn'] as num).toInt(),
      refillRate: (json['refillRate'] as num).toInt(),
      tokenFlowReduction: (json['tokenFlowReduction'] as num).toInt(),
      tokensConsumed: (json['tokensConsumed'] as num).toInt(),
      processingTimeInMs: (json['processingTimeInMs'] as num).toInt(),
      error: json['error'] == null
          ? null
          : KeepaError.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$KeepaTokenStatusResponseImplToJson(
        _$KeepaTokenStatusResponseImpl instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'tokensLeft': instance.tokensLeft,
      'refillIn': instance.refillIn,
      'refillRate': instance.refillRate,
      'tokenFlowReduction': instance.tokenFlowReduction,
      'tokensConsumed': instance.tokensConsumed,
      'processingTimeInMs': instance.processingTimeInMs,
      'error': instance.error,
    };

_$KeepaErrorImpl _$$KeepaErrorImplFromJson(Map<String, dynamic> json) =>
    _$KeepaErrorImpl(
      type: json['type'] as String?,
      message: json['message'] as String?,
      details: json['details'] as String?,
    );

Map<String, dynamic> _$$KeepaErrorImplToJson(_$KeepaErrorImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'message': instance.message,
      'details': instance.details,
    };
