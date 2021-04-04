import 'dart:io';

import 'package:amasearch/models/enums/csv_columns.dart';
import 'package:amasearch/models/enums/item_condition.dart';
import 'package:amasearch/models/enums/item_sub_condition.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';

import 'euc/jis.dart';

class StockItemCsv {
  static Future<File> create(
      String filename, List<StockItem> items, List<CsvColumn> order) async {
    final tempDir = await getTemporaryDirectory();
    final csvDirPath = tempDir.absolute.path;
    final file = File("$csvDirPath/$filename.csv");
    final data = <List<Object>>[
      _createHeader(order),
      for (final item in items) _createData(item, order)
    ];
    final csvData = const ListToCsvConverter().convert(data);
    final converted = ShiftJIS().encode(csvData);
    file.writeAsBytesSync(converted);
    return file;
  }

  static List<String> _createHeader(List<CsvColumn> order) {
    return <String>[for (final o in order) o.toDisplayString()];
  }

  static List<Object> _createData(StockItem item, List<CsvColumn> order) {
    final ret = <Object>[];
    for (final o in order) {
      switch (o) {
        case CsvColumn.asin:
          ret.add(item.item.asin);
          break;
        case CsvColumn.jan:
          ret.add(item.item.jan);
          break;
        case CsvColumn.title:
          ret.add(item.item.title);
          break;
        case CsvColumn.sellPrice:
          ret.add(item.sellPrice);
          break;
        case CsvColumn.purchasePrice:
          ret.add(item.purchasePrice);
          break;
        case CsvColumn.profit:
          ret.add(item.profitPerItem);
          break;
        case CsvColumn.listingPrice:
          ret.add(item.item.listPrice);
          break;
        case CsvColumn.quantity:
          ret.add(item.amount);
          break;
        case CsvColumn.condition:
          ret.add(_createConditionText(item));
          break;
        case CsvColumn.shipment:
          ret.add(item.useFba ? "FBA" : "自己発送");
          break;
        case CsvColumn.sku:
          ret.add(item.sku);
          break;
        case CsvColumn.retailer:
          ret.add(item.retailer);
          break;
        case CsvColumn.comment:
          ret.add(item.memo);
          break;
        case CsvColumn.purchaseDate:
          ret.add(_createPurchaseDateText(item));
          break;
        case CsvColumn.breakEven:
          ret.add(item.breakEven);
          break;
      }
    }
    return ret;
  }

  static String _createConditionText(StockItem item) {
    final cond = item.condition.toDisplayString();
    final subCond = item.subCondition.toDisplayString();

    return "$cond($subCond)";
  }

  static String _createPurchaseDateText(StockItem item) {
    final date = DateTime.parse(item.purchaseDate).toLocal();
    return dateFormatter.format(date);
  }
}
