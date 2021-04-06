// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_settings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GeneralSettingsAdapter extends TypeAdapter<_$_GeneralSettings> {
  @override
  final int typeId = 50;

  @override
  _$_GeneralSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_GeneralSettings(
      isDarkMode: fields[0] as bool,
      enableTargetProfit: fields[1] as bool,
      targetProfitValue: fields[2] as int,
      skuFormat: fields[3] as String,
      retailers: (fields[4] as List).cast<String>(),
      enableReadAloud: fields[5] as bool,
      patternIndex: fields[6] as int,
      readAloudPatterns: (fields[7] as List).cast<ReadAloudPattern>(),
      readAloudVolume: fields[8] as double,
      readAloudSpeed: fields[9] as double?,
      customButtons: fields[10] == null
          ? [
              const CustomButtonDetail(
                  pattern: 'https://www.amazon.co.jp/gp/product/{asin}/',
                  enable: true,
                  title: 'Amazon',
                  id: 'bt00'),
              const CustomButtonDetail(
                  pattern:
                      'https://sellercentral.amazon.co.jp/abis/listing/syh?asin={asin}',
                  enable: true,
                  title: '出品確認',
                  id: 'bt01'),
              const CustomButtonDetail(
                  pattern: 'https://delta-tracer.com/item/detail/jp/{asin}/',
                  enable: true,
                  title: 'Delta',
                  id: 'bt02'),
              const CustomButtonDetail(
                  pattern: 'https://mnsearch.com/item?kwd={asin}',
                  enable: true,
                  title: 'モノサーチ',
                  id: 'bt03'),
              const CustomButtonDetail(
                  pattern: 'https://keezon.net/item/index?ASIN={asin}',
                  enable: false,
                  title: 'Keezon',
                  id: 'bt04'),
              const CustomButtonDetail(
                  pattern: 'https://www.mercari.com/jp/search/?keyword={title}',
                  enable: false,
                  title: 'メルカリ',
                  id: 'bt05'),
              const CustomButtonDetail(
                  pattern:
                      'https://sellercentral.amazon.co.jp/inventory/ref=xx_invmgr_dnav_home?tbla_myitable=search:{asin};',
                  enable: false,
                  title: '在庫',
                  id: 'bt06'),
              const CustomButtonDetail(
                  pattern: '', enable: false, title: 'ボタン1', id: 'bt07'),
              const CustomButtonDetail(
                  pattern: '', enable: false, title: 'ボタン2', id: 'bt08'),
              const CustomButtonDetail(
                  pattern: '', enable: false, title: 'ボタン3', id: 'bt09'),
              const CustomButtonDetail(
                  pattern: '', enable: false, title: 'ボタン4', id: 'bt10'),
              const CustomButtonDetail(
                  pattern: '', enable: false, title: 'ボタン5', id: 'bt11')
            ]
          : (fields[10] as List).cast<CustomButtonDetail>(),
      csvOrder: fields[11] == null
          ? [
              CsvColumn.asin,
              CsvColumn.jan,
              CsvColumn.title,
              CsvColumn.sellPrice,
              CsvColumn.purchasePrice,
              CsvColumn.profit,
              CsvColumn.listingPrice,
              CsvColumn.breakEven,
              CsvColumn.quantity,
              CsvColumn.condition,
              CsvColumn.shipment,
              CsvColumn.sku,
              CsvColumn.retailer,
              CsvColumn.comment,
              CsvColumn.purchaseDate
            ]
          : (fields[11] as List).cast<CsvColumn>(),
      minProfit: fields[12] == null ? 0 : fields[12] as int,
      getStocks: fields[13] == null ? false : fields[13] as bool,
      enableAlert: fields[14] == null ? true : fields[14] as bool,
      alerts: fields[15] == null
          ? [
              const AlertConditionSet(
                  title: 'プレ値',
                  id: 'default',
                  conditions: [const AlertCondition(type: AlertType.premium)])
            ]
          : (fields[15] as List).cast<AlertConditionSet>(),
      enableAlertVibration: fields[16] == null ? false : fields[16] as bool,
      isMajorCustomer: fields[17] == null ? true : fields[17] as bool,
      keepaSettings: fields[18] == null
          ? const KeepaSettings()
          : fields[18] as KeepaSettings,
    );
  }

  @override
  void write(BinaryWriter writer, _$_GeneralSettings obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.isDarkMode)
      ..writeByte(1)
      ..write(obj.enableTargetProfit)
      ..writeByte(2)
      ..write(obj.targetProfitValue)
      ..writeByte(3)
      ..write(obj.skuFormat)
      ..writeByte(4)
      ..write(obj.retailers)
      ..writeByte(5)
      ..write(obj.enableReadAloud)
      ..writeByte(6)
      ..write(obj.patternIndex)
      ..writeByte(7)
      ..write(obj.readAloudPatterns)
      ..writeByte(8)
      ..write(obj.readAloudVolume)
      ..writeByte(9)
      ..write(obj.readAloudSpeed)
      ..writeByte(10)
      ..write(obj.customButtons)
      ..writeByte(11)
      ..write(obj.csvOrder)
      ..writeByte(12)
      ..write(obj.minProfit)
      ..writeByte(13)
      ..write(obj.getStocks)
      ..writeByte(14)
      ..write(obj.enableAlert)
      ..writeByte(15)
      ..write(obj.alerts)
      ..writeByte(16)
      ..write(obj.enableAlertVibration)
      ..writeByte(17)
      ..write(obj.isMajorCustomer)
      ..writeByte(18)
      ..write(obj.keepaSettings);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeneralSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ReadAloudPatternAdapter extends TypeAdapter<_$_ReadAloudPattern> {
  @override
  final int typeId = 51;

  @override
  _$_ReadAloudPattern read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_ReadAloudPattern(
      title: fields[0] as String,
      pattern: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_ReadAloudPattern obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.pattern);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReadAloudPatternAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CustomButtonDetailAdapter extends TypeAdapter<_$_CustomButtonDetail> {
  @override
  final int typeId = 52;

  @override
  _$_CustomButtonDetail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_CustomButtonDetail(
      enable: fields[0] as bool,
      title: fields[1] as String,
      pattern: fields[2] as String,
      id: fields[3] == null ? '' : fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_CustomButtonDetail obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.enable)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.pattern)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomButtonDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AlertConditionSetAdapter extends TypeAdapter<_$_AlertConditionSet> {
  @override
  final int typeId = 55;

  @override
  _$_AlertConditionSet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_AlertConditionSet(
      id: fields[0] as String,
      title: fields[1] as String,
      conditions: (fields[2] as List).cast<AlertCondition>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_AlertConditionSet obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.conditions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlertConditionSetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AlertConditionSet _$_$_AlertConditionSetFromJson(Map<String, dynamic> json) {
  return _$_AlertConditionSet(
    id: json['id'] as String,
    title: json['t'] as String,
    conditions: (json['c'] as List<dynamic>)
        .map((e) => AlertCondition.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_AlertConditionSetToJson(
        _$_AlertConditionSet instance) =>
    <String, dynamic>{
      'id': instance.id,
      't': instance.title,
      'c': instance.conditions,
    };
