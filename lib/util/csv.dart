import 'dart:io';

import 'package:amasearch/models/enums/item_condition.dart';
import 'package:amasearch/models/enums/item_sub_condition.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:csv/csv.dart';
import 'package:euc/jis.dart';
import 'package:path_provider/path_provider.dart';

class StockItemCsv {
  static Future<File> create(String filename, List<StockItem> items) async {
    final tempDir = await getTemporaryDirectory();
    final csvDirPath = tempDir.absolute.path;
    final file = File("$csvDirPath/$filename.csv");
    final data = <List<Object>>[
      [
        "ASIN",
        "JAN",
        "商品名",
        "販売予定価格",
        "仕入れ価格",
        "参考価格",
        "仕入れ個数",
        "コンディション",
        "発送方法",
        "SKU",
        "コメント",
        "仕入れ日",
      ],
      for (final item in items)
        [
          item.item.asin,
          item.item.jan,
          item.item.title,
          item.sellPrice,
          item.purchasePrice,
          item.item.listPrice,
          item.amount,
          _createConditionText(item),
          item.useFba ? "FBA" : "自己発送",
          item.sku,
          item.memo,
          _createPurchaseDateText(item),
        ]
    ];
    final csvData = const ListToCsvConverter().convert(data);
    final converted = ShiftJIS().encode(csvData);
    file.writeAsBytesSync(converted);
    return file;
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
