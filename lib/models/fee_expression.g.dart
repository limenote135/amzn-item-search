// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'fee_expression.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FeeExpressionAdapter extends TypeAdapter<_$_FeeExpression> {
  @override
  final int typeId = 7;

  @override
  _$_FeeExpression read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_FeeExpression(
      moreThan: fields[0] as int,
      exp: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_FeeExpression obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.moreThan)
      ..writeByte(1)
      ..write(obj.exp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeeExpressionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FeeExpression _$$_FeeExpressionFromJson(Map<String, dynamic> json) =>
    _$_FeeExpression(
      moreThan: json['more_than'] as int? ?? 0,
      exp: json['exp'] as String? ?? "",
    );

Map<String, dynamic> _$$_FeeExpressionToJson(_$_FeeExpression instance) =>
    <String, dynamic>{
      'more_than': instance.moreThan,
      'exp': instance.exp,
    };
