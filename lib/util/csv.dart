import 'dart:io';

import 'package:amasearch/models/enums/csv_columns.dart';
import 'package:amasearch/models/enums/item_condition.dart';
import 'package:amasearch/models/enums/item_sub_condition.dart';
import 'package:amasearch/models/enums/pricetar_rule.dart';
import 'package:amasearch/models/enums/pricetar_stopper.dart';
import 'package:amasearch/models/general_settings.dart';
import 'package:amasearch/models/makad_settings.dart';
import 'package:amasearch/models/pricetar_settings.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:amasearch/util/price_util.dart';
import 'package:csv/csv.dart';
import 'package:euc/jis.dart';
import 'package:path_provider/path_provider.dart';

enum CsvFormat {
  standard,
  pricetar,
  makad;

  const CsvFormat();
  String get displayName {
    switch (this) {
      case CsvFormat.standard:
        return "標準";
      case CsvFormat.pricetar:
        return "プライスター一括登録形式";
      case CsvFormat.makad:
        return "マカド一括登録形式";
    }
  }
}

Future<File> createStockItemCsv(
  String filename,
  List<StockItem> items,
  GeneralSettings settings,
  CsvFormat type,
) async {
  final tempDir = await getTemporaryDirectory();
  final csvDirPath = "${tempDir.absolute.path}/stockList";
  final csvDir = Directory(csvDirPath);
  if (csvDir.existsSync()) {
    csvDir.deleteSync(recursive: true);
  }
  csvDir.createSync();

  final file = File("$csvDirPath/$filename.csv");
  final data = _createCsv(type, items, settings);
  final csvData = const ListToCsvConverter().convert(data);
  final converted = ShiftJIS().encode(csvData);
  file.writeAsBytesSync(converted);
  return file;
}

List<List<Object>> _createCsv(
  CsvFormat type,
  List<StockItem> items,
  GeneralSettings settings,
) {
  switch (type) {
    case CsvFormat.standard:
      return _createDefaultCsv(items, settings.csvOrder);
    case CsvFormat.pricetar:
      return _createPricetarCsv(items, settings.pricetarSettings);
    case CsvFormat.makad:
      return _createMakadCsv(items, settings.makadSettings);
  }
}

List<List<Object>> _createPricetarCsv(
  List<StockItem> items,
  PricetarSettings settings,
) {
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
        _calcStopperPrice(
          item,
          settings.lowestStopperType,
          settings.lowestStopperValue,
        ),
        _calcStopperPrice(
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

List<List<Object>> _createMakadCsv(
  List<StockItem> items,
  MakadSettings settings,
) {
  return <List<Object>>[
    // header
    [
      "ASIN(必須)※JANコードを入力するとエラーとなります。",
      "SKU(空の場合は自動挿入されます)",
      "コンディション(必須)(0新品 1ほぼ新品 2非常に良い 3良い 4可 5コレクターほぼ新品 6コレクター非常に良い 7コレクター良い 8コレクター可)",
      "出品価格(必須)",
      "下限価格",
      "仕入れ価格",
      "出品個数",
      "配送ルート(必須)(0→自己発送 1→FBA)",
      "価格改定モード(0→なし 1→FBA状態合わせ 2→状態合わせ 3→FBA最安値 4→最安値 5→カート価格 6→自己最安値 7→上位最安値 8→全最安値)",
      "商品説明文",
      "配送設定名",
      "リードタイム",
      "支払い方法の制限(0[空]→全て許可する 1→代金引換を制限する 2→コンビニ決済を制限する 3→代金引換とコンビニ決済を制限する)",
    ],
    for (final item in items)
      [
        item.item.asin,
        item.sku,
        item.subCondition.toMakadCsvValue(),
        item.sellPrice,
        _calcStopperPrice(
          item,
          settings.lowestStopperType,
          settings.lowestStopperValue,
        ),
        item.purchasePrice,
        item.amount,
        item.useFba ? 1 : 0,
        item.condition == ItemCondition.newItem
            ? settings.newRule.makadCsvValue
            : settings.usedRule.makadCsvValue,
        item.conditionText,
        "",
        "",
        settings.paymentMethod.makadCsvValue,
      ]
  ];
}

int _calcStopperPrice(
  StockItem item,
  RevisePriceStopper type,
  int value,
) {
  switch (type) {
    case RevisePriceStopper.nothing:
      return 0;
    case RevisePriceStopper.listingPrice:
      return (item.sellPrice * value / 100).round();
    case RevisePriceStopper.profitValue:
      {
        final feeInfo = item.item.prices?.feeInfo;
        final fbaFee = feeInfo != null && item.useFba ? feeInfo.fbaFee : 0;
        final closingFee = feeInfo != null
            ? (feeInfo.variableClosingFee * taxRate).round()
            : 0;
        /*
        SellPrice = Profit + Purchase + Fee
        Fee = ReferralFee + FbaFee + ClosingFee + OtherCost
        ReferralFee = SellPrice * feeRate * taxRate
        ClosingFee = closingFee * taxRate

        SellPrice = Profit + Purchase
                    + (SellPrice * feeRate * taxRate)
                    + FbaFee
                    + (closingFee * taxRate)
                    + OtherCost
        SellPrice(1 - feeRate * taxRate) = Profit + Purchase
                                          + FbaFee
                                          + (closingFee * taxRate)
                                          + OtherCost
         */

        // 分子
        final child =
            value + item.purchasePrice + fbaFee + closingFee + item.otherCost;
        // 分母
        final mother =
            feeInfo != null ? (1 - feeInfo.referralFeeRate * taxRate) : 1.0;
        if (mother == 0) {
          return child;
        }
        return (child / mother).round();
      }
    case RevisePriceStopper.profitRate:
      {
        // ↑の式において、Profit = SellPrice * ProfitRate になる
        final feeInfo = item.item.prices?.feeInfo;
        final fbaFee = feeInfo != null && item.useFba ? feeInfo.fbaFee : 0;
        final closingFee = feeInfo != null
            ? (feeInfo.variableClosingFee * taxRate).round()
            : 0;

        // 分子
        final child = item.purchasePrice + fbaFee + closingFee + item.otherCost;
        // 分母
        final mother = feeInfo != null
            ? (1 - value / 100 - feeInfo.referralFeeRate * taxRate)
            : 1.0;

        if (mother == 0) {
          return child;
        }
        return (child / mother).round();
      }
  }
}

List<List<Object>> _createDefaultCsv(
  List<StockItem> items,
  List<CsvColumn> order,
) {
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
