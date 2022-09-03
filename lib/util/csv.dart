import 'dart:io';

import 'package:amasearch/models/enums/csv_columns.dart';
import 'package:amasearch/models/enums/item_condition.dart';
import 'package:amasearch/models/enums/item_sub_condition.dart';
import 'package:amasearch/models/enums/pricetar_rule.dart';
import 'package:amasearch/models/enums/pricetar_stopper.dart';
import 'package:amasearch/models/general_settings.dart';
import 'package:amasearch/models/pricetar_settings.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:csv/csv.dart';
import 'package:euc/jis.dart';
import 'package:path_provider/path_provider.dart';

Future<File> createStockItemCsv(
  String filename,
  List<StockItem> items,
  GeneralSettings settings,
) async {
  final tempDir = await getTemporaryDirectory();
  final csvDirPath = "${tempDir.absolute.path}/stockList";
  final csvDir = Directory(csvDirPath);
  if (csvDir.existsSync()) {
    csvDir.deleteSync(recursive: true);
  }
  csvDir.createSync();

  final file = File("$csvDirPath/$filename.csv");
  final data = _createDefaultCsv(items, settings.csvOrder);
  final csvData = const ListToCsvConverter().convert(data);
  final converted = ShiftJIS().encode(csvData);
  file.writeAsBytesSync(converted);
  return file;
}

List<List<Object>> _createPricetarCsv(
    List<StockItem> items, PricetarSettings settings) {
  return <List<Object>>[
    // header
    [
      "SKU",
      "ASIN",
      "title",
      "number",
      "price",
      "cost",
      "akaji",
      "takane",
      "condition",
      "conditionNote",
      "priceTrace",
      "leadtime",
      "merchant_shipping_group_name",
      "delete",
    ],
    for (final item in items)
      [
        item.sku,
        item.item.asin,
        "",
        item.amount,
        item.sellPrice,
        item.purchasePrice,
        _calcPricetarStopperPrice(
          item,
          settings.lowestStopperType,
          settings.lowestStopperValue,
        ),
        _calcPricetarStopperPrice(
          item,
          settings.highestStopperType,
          settings.highestStopperValue,
        ),
        item.subCondition.toPricetarCsvValue(),
        item.conditionText,
        item.condition == ItemCondition.newItem
            ? settings.newRule.toPricetarCsvValue()
            : settings.usedRule.toPricetarCsvValue(),
        "",
        "",
        "",
      ]
  ];
}

int _calcPricetarStopperPrice(
  StockItem item,
  PricetarStopperType type,
  int value,
) {
  switch (type) {
    case PricetarStopperType.nothing:
      return 0;
    case PricetarStopperType.listingPrice:
      return (item.sellPrice * value / 100).round();
    case PricetarStopperType.profitValue:
      return 0;
    case PricetarStopperType.profitRate:
      return 0;
  }
}

List<List<Object>> _createDefaultCsv(
    List<StockItem> items, List<CsvColumn> order) {
  final data = <List<Object>>[
    <String>[for (final o in order) o.toDisplayString()],
    for (final item in items) _createData(item, order)
  ];
  return data;
}

List<Object> _createData(StockItem item, List<CsvColumn> order) {
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
      case CsvColumn.conditionText:
        ret.add(item.conditionText);
        break;
      case CsvColumn.otherCost:
        ret.add(item.otherCost);
        break;
    }
  }
  return ret;
}

String _createConditionText(StockItem item) {
  final cond = item.condition.toDisplayString();
  final subCond = item.subCondition.toDisplayString();

  return "$cond($subCond)";
}

String _createPurchaseDateText(StockItem item) {
  final date = DateTime.parse(item.purchaseDate).toLocal();
  return dateFormatter.format(date);
}
