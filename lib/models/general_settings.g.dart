// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

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
                  id: 'bt01',
                  enable: true,
                  title: 'Amazon',
                  pattern: 'https://www.amazon.co.jp/gp/product/{asin}/'),
              const CustomButtonDetail(
                  id: 'bt02',
                  enable: true,
                  title: '出品確認',
                  pattern:
                      'https://sellercentral.amazon.co.jp/abis/listing/syh?asin={asin}'),
              const CustomButtonDetail(
                  id: 'bt03',
                  enable: true,
                  title: 'Delta',
                  pattern: 'https://delta-tracer.com/item/detail/jp/{asin}/'),
              const CustomButtonDetail(
                  id: 'bt04',
                  enable: true,
                  title: 'モノサーチ',
                  pattern: 'https://mnsearch.com/item?kwd={asin}'),
              const CustomButtonDetail(
                  id: 'bt05',
                  enable: false,
                  title: 'Keezon',
                  pattern: 'https://keezon.net/item/index?ASIN={asin}'),
              const CustomButtonDetail(
                  id: 'bt06',
                  enable: false,
                  title: 'メルカリ',
                  pattern:
                      'https://www.mercari.com/jp/search/?keyword={title}'),
              const CustomButtonDetail(
                  id: 'bt07',
                  enable: false,
                  title: '在庫',
                  pattern:
                      'https://sellercentral.amazon.co.jp/inventory/ref=xx_invmgr_dnav_home?tbla_myitable=search:{asin};'),
              const CustomButtonDetail(
                  id: 'bt08',
                  enable: false,
                  title: 'Keepa(ブラウザ)',
                  pattern: 'https://keepa.com/#!product/5-{asin}/'),
              const CustomButtonDetail(
                  id: 'bt09',
                  enable: false,
                  title: '楽天',
                  pattern: 'https://search.rakuten.co.jp/search/mall/{jan}/'),
              const CustomButtonDetail(
                  id: 'bt10',
                  enable: false,
                  title: '価格.com(型番)',
                  pattern: 'https://kakaku.com/search_results/{model}'),
              const CustomButtonDetail(
                  id: 'bt11',
                  enable: false,
                  title: 'ヤフオク!',
                  pattern:
                      'https://auctions.yahoo.co.jp/search/search?ei=utf-8&p={title}'),
              const CustomButtonDetail(
                  id: 'bt12',
                  enable: false,
                  title: 'BookOff',
                  pattern:
                      'https://www.bookoffonline.co.jp/display/L001,st=a,q={jan}'),
              const CustomButtonDetail(
                  id: 'bt13',
                  enable: false,
                  title: '駿河屋',
                  pattern:
                      'https://www.suruga-ya.jp/search?category=&search_word={jan}'),
              const CustomButtonDetail(
                  id: 'bt14',
                  enable: false,
                  title: '販売履歴',
                  pattern:
                      'https://sellercentral.amazon.co.jp/orders-v3/search?page=1&qt=asin&q={asin}'),
              const CustomButtonDetail(
                  id: 'bt15', enable: false, title: 'ボタン1', pattern: ''),
              const CustomButtonDetail(
                  id: 'bt16', enable: false, title: 'ボタン2', pattern: ''),
              const CustomButtonDetail(
                  id: 'bt17', enable: false, title: 'ボタン3', pattern: ''),
              const CustomButtonDetail(
                  id: 'bt17', enable: false, title: 'ボタン4', pattern: ''),
              const CustomButtonDetail(
                  id: 'bt19', enable: false, title: 'ボタン5', pattern: ''),
              const CustomButtonDetail(
                  id: 'bt20', enable: false, title: 'ボタン6', pattern: '')
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
              CsvColumn.otherCost,
              CsvColumn.shipment,
              CsvColumn.sku,
              CsvColumn.retailer,
              CsvColumn.conditionText,
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
                  id: 'default',
                  title: 'プレ値',
                  conditions: [const AlertCondition(type: AlertType.premium)])
            ]
          : (fields[15] as List).cast<AlertConditionSet>(),
      enableAlertVibration: fields[16] == null ? false : fields[16] as bool,
      isMajorCustomer: fields[17] == null ? true : fields[17] as bool,
      keepaSettings: fields[18] == null
          ? const KeepaSettings()
          : fields[18] as KeepaSettings,
      leftSlideShortcut: fields[19] == null
          ? [
              const ShortcutDetail(type: ShortcutType.purchase),
              const ShortcutDetail(type: ShortcutType.none),
              const ShortcutDetail(type: ShortcutType.none)
            ]
          : (fields[19] as List).cast<ShortcutDetail>(),
      rightSlideShortcut: fields[20] == null
          ? [
              const ShortcutDetail(type: ShortcutType.delete),
              const ShortcutDetail(type: ShortcutType.none),
              const ShortcutDetail(type: ShortcutType.none)
            ]
          : (fields[20] as List).cast<ShortcutDetail>(),
      newConditionTexts: fields[21] == null
          ? [
              '新品未開封品ですが、パッケージや外箱等にスレがある場合もございますので、予めご了承ください。',
              '新品未開封品です。Amazon配送センターより送料無料、365日年中無休で迅速に発送致します。',
              '商品は当店のスタッフが丁寧に梱包して発送させていただきます。'
            ]
          : (fields[21] as List).cast<String>(),
      newConditionTextIndex: fields[22] == null ? 0 : fields[22] as int,
      usedConditionTexts: fields[23] == null
          ? [
              '商品は当店のスタッフが丁寧に検品したものを発送させていただきます。',
              '中古品のため、ご使用に影響ない程度の使用感・経年劣化、キズ、汚れなどがある場合がございます。',
              '多少の使用感はありますが、目立った傷もなく非常に状態のよいものなります。'
            ]
          : (fields[23] as List).cast<String>(),
      usedConditionTextIndex: fields[24] == null ? 0 : fields[24] as int,
      pricetarSettings: fields[25] == null
          ? const PricetarSettings()
          : fields[25] as PricetarSettings,
      makadSettings: fields[26] == null
          ? const MakadSettings()
          : fields[26] as MakadSettings,
      sellerSketSettings: fields[27] == null
          ? const SellerSketSettings()
          : fields[27] as SellerSketSettings,
    );
  }

  @override
  void write(BinaryWriter writer, _$_GeneralSettings obj) {
    writer
      ..writeByte(28)
      ..writeByte(0)
      ..write(obj.isDarkMode)
      ..writeByte(1)
      ..write(obj.enableTargetProfit)
      ..writeByte(2)
      ..write(obj.targetProfitValue)
      ..writeByte(3)
      ..write(obj.skuFormat)
      ..writeByte(5)
      ..write(obj.enableReadAloud)
      ..writeByte(6)
      ..write(obj.patternIndex)
      ..writeByte(8)
      ..write(obj.readAloudVolume)
      ..writeByte(9)
      ..write(obj.readAloudSpeed)
      ..writeByte(12)
      ..write(obj.minProfit)
      ..writeByte(13)
      ..write(obj.getStocks)
      ..writeByte(14)
      ..write(obj.enableAlert)
      ..writeByte(16)
      ..write(obj.enableAlertVibration)
      ..writeByte(17)
      ..write(obj.isMajorCustomer)
      ..writeByte(18)
      ..write(obj.keepaSettings)
      ..writeByte(22)
      ..write(obj.newConditionTextIndex)
      ..writeByte(24)
      ..write(obj.usedConditionTextIndex)
      ..writeByte(25)
      ..write(obj.pricetarSettings)
      ..writeByte(26)
      ..write(obj.makadSettings)
      ..writeByte(27)
      ..write(obj.sellerSketSettings)
      ..writeByte(4)
      ..write(obj.retailers)
      ..writeByte(7)
      ..write(obj.readAloudPatterns)
      ..writeByte(10)
      ..write(obj.customButtons)
      ..writeByte(11)
      ..write(obj.csvOrder)
      ..writeByte(15)
      ..write(obj.alerts)
      ..writeByte(19)
      ..write(obj.leftSlideShortcut)
      ..writeByte(20)
      ..write(obj.rightSlideShortcut)
      ..writeByte(21)
      ..write(obj.newConditionTexts)
      ..writeByte(23)
      ..write(obj.usedConditionTexts);
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

class ShortcutDetailAdapter extends TypeAdapter<_$_ShortcutDetail> {
  @override
  final int typeId = 57;

  @override
  _$_ShortcutDetail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_ShortcutDetail(
      type: fields[0] as ShortcutType,
      param: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_ShortcutDetail obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.param);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShortcutDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AlertConditionSet _$$_AlertConditionSetFromJson(Map<String, dynamic> json) =>
    _$_AlertConditionSet(
      id: json['id'] as String,
      title: json['t'] as String,
      conditions: (json['c'] as List<dynamic>?)
              ?.map((e) => AlertCondition.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <AlertCondition>[],
    );

Map<String, dynamic> _$$_AlertConditionSetToJson(
        _$_AlertConditionSet instance) =>
    <String, dynamic>{
      'id': instance.id,
      't': instance.title,
      'c': instance.conditions,
    };

_$_ShortcutDetail _$$_ShortcutDetailFromJson(Map<String, dynamic> json) =>
    _$_ShortcutDetail(
      type: $enumDecode(_$ShortcutTypeEnumMap, json['type']),
      param: json['param'] as String? ?? "",
    );

Map<String, dynamic> _$$_ShortcutDetailToJson(_$_ShortcutDetail instance) =>
    <String, dynamic>{
      'type': _$ShortcutTypeEnumMap[instance.type]!,
      'param': instance.param,
    };

const _$ShortcutTypeEnumMap = {
  ShortcutType.none: 'none',
  ShortcutType.purchase: 'purchase',
  ShortcutType.delete: 'delete',
  ShortcutType.web: 'web',
  ShortcutType.navigation: 'navigation',
};
