// GENERATED CODE - DO NOT MODIFY BY HAND

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
    );
  }

  @override
  void write(BinaryWriter writer, _$_StockItem obj) {
    writer
      ..writeByte(15)
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
      ..write(obj.listingDate);
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
