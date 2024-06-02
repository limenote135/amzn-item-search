// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'fee_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FeeInfoImplAdapter extends TypeAdapter<_$FeeInfoImpl> {
  @override
  final int typeId = 5;

  @override
  _$FeeInfoImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$FeeInfoImpl(
      referralFeeRate: fields[0] as double,
      variableClosingFee: fields[1] as int,
      fbaFee: fields[2] as int,
      feeExp: fields[3] as FeeExpression?,
      fbaLowPriceFee: fields[4] == null ? 0 : fields[4] as int,
      referralFeeLowPriceRate: fields[5] == null ? 0 : fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, _$FeeInfoImpl obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.referralFeeRate)
      ..writeByte(1)
      ..write(obj.variableClosingFee)
      ..writeByte(2)
      ..write(obj.fbaFee)
      ..writeByte(3)
      ..write(obj.feeExp)
      ..writeByte(4)
      ..write(obj.fbaLowPriceFee)
      ..writeByte(5)
      ..write(obj.referralFeeLowPriceRate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeeInfoImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeeInfoImpl _$$FeeInfoImplFromJson(Map<String, dynamic> json) =>
    _$FeeInfoImpl(
      referralFeeRate: (json['fee_rate'] as num?)?.toDouble() ?? 0,
      variableClosingFee: (json['closing_fee'] as num?)?.toInt() ?? 0,
      fbaFee: (json['fba_fee'] as num?)?.toInt() ?? -1,
      feeExp: json['fee_exp'] == null
          ? null
          : FeeExpression.fromJson(json['fee_exp'] as Map<String, dynamic>),
      fbaLowPriceFee: (json['fba_low_price_fee'] as num?)?.toInt() ?? 0,
      referralFeeLowPriceRate:
          (json['referral_fee_low_price_rate'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$FeeInfoImplToJson(_$FeeInfoImpl instance) =>
    <String, dynamic>{
      'fee_rate': instance.referralFeeRate,
      'closing_fee': instance.variableClosingFee,
      'fba_fee': instance.fbaFee,
      'fee_exp': instance.feeExp,
      'fba_low_price_fee': instance.fbaLowPriceFee,
      'referral_fee_low_price_rate': instance.referralFeeLowPriceRate,
    };
