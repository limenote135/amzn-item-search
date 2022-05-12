// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'csv_columns.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CsvColumnAdapter extends TypeAdapter<CsvColumn> {
  @override
  final int typeId = 53;

  @override
  CsvColumn read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return CsvColumn.asin;
      case 1:
        return CsvColumn.jan;
      case 2:
        return CsvColumn.title;
      case 3:
        return CsvColumn.sellPrice;
      case 4:
        return CsvColumn.purchasePrice;
      case 5:
        return CsvColumn.profit;
      case 6:
        return CsvColumn.listingPrice;
      case 7:
        return CsvColumn.quantity;
      case 8:
        return CsvColumn.condition;
      case 9:
        return CsvColumn.shipment;
      case 10:
        return CsvColumn.sku;
      case 11:
        return CsvColumn.retailer;
      case 12:
        return CsvColumn.comment;
      case 13:
        return CsvColumn.purchaseDate;
      case 14:
        return CsvColumn.breakEven;
      case 15:
        return CsvColumn.conditionText;
      case 16:
        return CsvColumn.otherCost;
      default:
        return CsvColumn.asin;
    }
  }

  @override
  void write(BinaryWriter writer, CsvColumn obj) {
    switch (obj) {
      case CsvColumn.asin:
        writer.writeByte(0);
        break;
      case CsvColumn.jan:
        writer.writeByte(1);
        break;
      case CsvColumn.title:
        writer.writeByte(2);
        break;
      case CsvColumn.sellPrice:
        writer.writeByte(3);
        break;
      case CsvColumn.purchasePrice:
        writer.writeByte(4);
        break;
      case CsvColumn.profit:
        writer.writeByte(5);
        break;
      case CsvColumn.listingPrice:
        writer.writeByte(6);
        break;
      case CsvColumn.quantity:
        writer.writeByte(7);
        break;
      case CsvColumn.condition:
        writer.writeByte(8);
        break;
      case CsvColumn.shipment:
        writer.writeByte(9);
        break;
      case CsvColumn.sku:
        writer.writeByte(10);
        break;
      case CsvColumn.retailer:
        writer.writeByte(11);
        break;
      case CsvColumn.comment:
        writer.writeByte(12);
        break;
      case CsvColumn.purchaseDate:
        writer.writeByte(13);
        break;
      case CsvColumn.breakEven:
        writer.writeByte(14);
        break;
      case CsvColumn.conditionText:
        writer.writeByte(15);
        break;
      case CsvColumn.otherCost:
        writer.writeByte(16);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CsvColumnAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
