// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'stock_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StockItemAdapter extends TypeAdapter<_$_StockItem> {
  @override
  final int typeId = 20;

  @override
  _$_StockItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_StockItem(
      purchaseDate: fields[0] as String,
      purchasePrice: fields[1] as int,
      sellPrice: fields[2] as int,
      useFba: fields[3] as bool,
      profitPerItem: fields[4] as int,
      amount: fields[5] as int,
      condition: fields[6] as ItemCondition,
      subCondition: fields[7] as ItemSubCondition,
      sku: fields[8] as String,
      memo: fields[9] as String,
      item: fields[10] as AsinData,
      retailer: fields[11] == null ? '' : fields[11] as String,
      id: fields[12] == null ? '' : fields[12] as String,
      breakEven: fields[13] == null ? -1 : fields[13] as int,
      listingDate: fields[14] as String?,
      conditionText: fields[15] == null ? '' : fields[15] as String,
      otherCost: fields[16] == null ? 0 : fields[16] as int,
      images: fields[17] == null ? [] : (fields[17] as List).cast<String>(),
      isSmallProgram: fields[18] == null ? false : fields[18] as bool,
      smallFee: fields[19] == null ? 0 : fields[19] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$_StockItem obj) {
    writer
      ..writeByte(20)
      ..writeByte(0)
      ..write(obj.purchaseDate)
      ..writeByte(1)
      ..write(obj.purchasePrice)
      ..writeByte(2)
      ..write(obj.sellPrice)
      ..writeByte(3)
      ..write(obj.useFba)
      ..writeByte(4)
      ..write(obj.profitPerItem)
      ..writeByte(5)
      ..write(obj.amount)
      ..writeByte(6)
      ..write(obj.condition)
      ..writeByte(7)
      ..write(obj.subCondition)
      ..writeByte(8)
      ..write(obj.sku)
      ..writeByte(9)
      ..write(obj.memo)
      ..writeByte(10)
      ..write(obj.item)
      ..writeByte(11)
      ..write(obj.retailer)
      ..writeByte(12)
      ..write(obj.id)
      ..writeByte(13)
      ..write(obj.breakEven)
      ..writeByte(14)
      ..write(obj.listingDate)
      ..writeByte(15)
      ..write(obj.conditionText)
      ..writeByte(16)
      ..write(obj.otherCost)
      ..writeByte(18)
      ..write(obj.isSmallProgram)
      ..writeByte(19)
      ..write(obj.smallFee)
      ..writeByte(17)
      ..write(obj.images);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StockItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
