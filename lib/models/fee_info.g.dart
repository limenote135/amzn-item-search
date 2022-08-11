// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fee_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FeeInfoAdapter extends TypeAdapter<_$_FeeInfo> {
  @override
  final int typeId = 5;

  @override
  _$_FeeInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_FeeInfo(
      referralFeeRate: fields[0] as double,
      variableClosingFee: fields[1] as int,
      fbaFee: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$_FeeInfo obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.referralFeeRate)
      ..writeByte(1)
      ..write(obj.variableClosingFee)
      ..writeByte(2)
      ..write(obj.fbaFee);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeeInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FeeInfo _$$_FeeInfoFromJson(Map<String, dynamic> json) => _$_FeeInfo(
      referralFeeRate: (json['fee_rate'] as num?)?.toDouble() ?? 0,
      variableClosingFee: json['closing_fee'] as int? ?? 0,
      fbaFee: json['fba_fee'] as int? ?? -1,
    );

Map<String, dynamic> _$$_FeeInfoToJson(_$_FeeInfo instance) =>
    <String, dynamic>{
      'fee_rate': instance.referralFeeRate,
      'closing_fee': instance.variableClosingFee,
      'fba_fee': instance.fbaFee,
    };
