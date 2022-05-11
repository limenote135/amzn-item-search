import 'package:amasearch/models/constants.dart';
import 'package:hive/hive.dart';

part 'csv_columns.g.dart';

@HiveType(typeId: csvColumnTypeId)
enum CsvColumn {
  @HiveField(0)
  asin,
  @HiveField(1)
  jan,
  @HiveField(2)
  title,
  @HiveField(3)
  sellPrice,
  @HiveField(4)
  purchasePrice,
  @HiveField(5)
  profit,
  @HiveField(6)
  listingPrice,
  @HiveField(7)
  quantity,
  @HiveField(8)
  condition,
  @HiveField(9)
  shipment,
  @HiveField(10)
  sku,
  @HiveField(11)
  retailer,
  @HiveField(12)
  comment,
  @HiveField(13)
  purchaseDate,
  @HiveField(14)
  breakEven,
  @HiveField(15)
  conditionText,
  @HiveField(16)
  otherCost,
}

extension CsvColumnExtention on CsvColumn {
  String toDisplayString() {
    switch (this) {
      case CsvColumn.asin:
        return "ASIN";
      case CsvColumn.jan:
        return "JAN";
      case CsvColumn.title:
        return "商品名";
      case CsvColumn.sellPrice:
        return "販売予定価格";
      case CsvColumn.purchasePrice:
        return "仕入れ価格";
      case CsvColumn.profit:
        return "見込み利益";
      case CsvColumn.listingPrice:
        return "参考価格";
      case CsvColumn.quantity:
        return "仕入れ個数";
      case CsvColumn.condition:
        return "コンディション";
      case CsvColumn.shipment:
        return "発送方法";
      case CsvColumn.sku:
        return "SKU";
      case CsvColumn.retailer:
        return "仕入れ先";
      case CsvColumn.comment:
        return "コメント";
      case CsvColumn.purchaseDate:
        return "仕入れ日";
      case CsvColumn.breakEven:
        return "損益分岐点";
      case CsvColumn.conditionText:
        return "コンディション説明";
      case CsvColumn.otherCost:
        return "その他費用";
    }
  }
}
