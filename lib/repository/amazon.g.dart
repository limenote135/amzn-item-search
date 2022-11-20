// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'amazon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestionResponse _$SuggestionResponseFromJson(Map<String, dynamic> json) =>
    SuggestionResponse(
      json['prefix'] as String,
      (json['suggestions'] as List<dynamic>)
          .map((e) => Suggestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SuggestionResponseToJson(SuggestionResponse instance) =>
    <String, dynamic>{
      'prefix': instance.prefix,
      'suggestions': instance.suggestions,
    };

Suggestion _$SuggestionFromJson(Map<String, dynamic> json) => Suggestion(
      json['value'] as String,
    );

Map<String, dynamic> _$SuggestionToJson(Suggestion instance) =>
    <String, dynamic>{
      'value': instance.value,
    };
