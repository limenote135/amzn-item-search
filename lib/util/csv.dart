// ignore_for_file: prefer_adjacent_string_concatenation
import 'dart:io';

import 'package:amasearch/models/enums/csv_columns.dart';
import 'package:amasearch/models/enums/item_condition.dart';
import 'package:amasearch/models/enums/item_sub_condition.dart';
import 'package:amasearch/models/enums/pricetar_rule.dart';
import 'package:amasearch/models/enums/pricetar_stopper.dart';
import 'package:amasearch/models/enums/sellersket_revise_rule.dart';
import 'package:amasearch/models/general_settings.dart';
import 'package:amasearch/models/makad_settings.dart';
import 'package:amasearch/models/pricetar_settings.dart';
import 'package:amasearch/models/sellersket_settings.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/util/exceptions.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:amasearch/util/price_util.dart';
import 'package:csv/csv.dart';
import 'package:euc/jis.dart';
import 'package:path_provider/path_provider.dart';

enum CsvFormat {
  standard,
  pricetar,
  makad,
  sellerSket;

  const CsvFormat();
  String get displayName {
    switch (this) {
      case CsvFormat.standard:
        return "標準";
      case CsvFormat.pricetar:
        return "プライスター一括登録形式";
      case CsvFormat.makad:
        return "マカド一括登録形式";
      case CsvFormat.sellerSket:
        return "セラースケット一括登録形式";
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
  final data = createCsv(type, items, settings);
  final csvData = const ListToCsvConverter().convert(data);
  final converted = ShiftJIS().encode(csvData);
  file.writeAsBytesSync(converted);
  return file;
}

List<List<Object>> createCsv(
  CsvFormat type,
  List<StockItem> items,
  GeneralSettings settings,
) {
  switch (type) {
    case CsvFormat.standard:
      return _createDefaultCsv(items, settings.csvOrder);
    case CsvFormat.pricetar:
      return createPricetarCsv(items, settings.pricetarSettings);
    case CsvFormat.makad:
      return _createMakadCsv(items, settings.makadSettings);
    case CsvFormat.sellerSket:
      return _createSellerSketCsv(items, settings.sellerSketSettings);
  }
}

// プライスター用のCSVを作成します。この並びを返す場合、バリデーションコードの変更も必要です。
List<List<Object>> createPricetarCsv(
  List<StockItem> items,
  PricetarSettings settings,
) {
  return <List<Object>>[
    // header
    ["ASIN、JANはどちらか一方のみ記載してください。"],
    [
      "SKU",
      "ASIN",
      "JAN",
      "title",
      "add_number",
      "price",
      "cost",
      "akaji",
      "takane",
      "condition",
      "conditionNote",
      "priceTrace",
      "leadtime",
      "merchant_shipping_group_name",
    ],
    for (final item in items)
      [
        item.sku,
        item.item.asin,
        "", // JAN
        "", // title
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
        // プライスターは一度に100件までしか登録できないが、行数でカウントしているので
        // コンディション説明に改行が含まれると件数以上にカウントされてしまうため改行を削除
        item.conditionText.replaceAll("\n", ""),
        item.condition == ItemCondition.newItem
            ? settings.newRule.toPricetarCsvValue()
            : settings.usedRule.toPricetarCsvValue(),
        "", // leadtime
        "", // merchant_shipping_group_name
      ],
  ];
}

void validatePricetarCsv(List<List<Object>> items) {
  if (items.length > 102) {
    throw const PricetarInvalidCsvException("プライスターへの出品登録は一度に100件までです。");
  }
  // 1, 2行目はヘッダなのでスキップする
  for (final item in items.skip(2)) {
    if (item.length != 14) {
      throw Exception("CSV の列数が不正です");
    }
    final sku = item[0] as String;
    final sellPrice = item[5] as int;
    if (sellPrice <= 0) {
      throw PricetarInvalidCsvException(
        "価格設定が正しくないため出品できません。\n出品価格が0以下です: $sku",
      );
    }
    // 出品価格が仕入れ値もしくは赤字ストッパーを下回っています
    // 価格追従モードがonに設定されていれば自動調整されます
    final akaji = item[7] as int;
    final takane = item[8] as int;
    if (akaji != 0 && takane != 0 && akaji > takane) {
      throw PricetarInvalidCsvException(
        "価格設定が正しくないため出品できません。\n赤字ストッパー金額が高値ストッパー金額を上回っています: $sku",
      );
    }
    if (akaji != 0 && sellPrice < akaji) {
      throw PricetarInvalidCsvException(
        "価格設定が正しくないため出品できません。\n出品価格が赤字ストッパーを下回っています: $sku",
      );
    }
    final purchasePrice = item[6] as int;
    if (purchasePrice > sellPrice) {
      throw PricetarInvalidCsvException(
        "価格設定が正しくないため出品できません。\n出品価格が仕入れ値を下回っています: $sku",
      );
    }
  }
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
      "コンディション(必須)(0新品 1ほぼ新品 2非常に良い 3良い 4可 " +
          "5コレクターほぼ新品 6コレクター非常に良い 7コレクター良い 8コレクター可)",
      "出品価格(必須)",
      "下限価格",
      "仕入れ価格",
      "出品個数",
      "配送ルート(必須)(0→自己発送 1→FBA)",
      "価格改定モード(0→なし 1→FBA状態合わせ 2→状態合わせ 3→FBA最安値 " +
          "4→最安値 5→カート価格 6→自己最安値 7→上位最安値 8→全最安値)",
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
      ],
  ];
}

List<List<Object>> _createSellerSketCsv(
  List<StockItem> items,
  SellerSketSettings settings,
) {
  return [
    // header
    [
      "SKU",
      "ASIN",
      "title",
      "quantity",
      "price",
      "point",
      "cost",
      "low_limit",
      "high_limit",
      "condition",
      "condition_note",
      "price_control",
      "handling_time",
      "shipping_pattern_name",
      "tax_code",
    ],
    for (final item in items)
      [
        item.sku,
        item.item.asin,
        "", // title
        item.amount,
        item.sellPrice,
        "", // point
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
        item.subCondition.toSellerSketCsvValue(),
        item.conditionText,
        item.condition == ItemCondition.newItem
            ? settings.newRule.toSellerSketCsvValue()
            : settings.usedRule.toSellerSketCsvValue(),
        "", // 1~30日まで
        settings.shippingPattern,
        1,
      ],
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
        if (feeInfo == null) {
          // 手数料情報が無い場合、購入価格+利益をストッパー価格にする
          return item.purchasePrice + value;
        }
        final sellPrice = calcBreakEven(
          purchase: item.purchasePrice,
          useFba: item.useFba,
          feeInfo: feeInfo,
          otherCost: item.otherCost,
          category: item.item.category,
          profit: value,
        );
        return sellPrice;
      }
    case RevisePriceStopper.profitRate:
      {
        final feeInfo = item.item.prices?.feeInfo;
        final rate = value / 100;
        if (feeInfo == null) {
          // 手数料情報が無い場合、購入価格*利益率をストッパー価格にする
          return (item.purchasePrice * (1 + rate)).round();
        }

        final sellPrice = calcTargetPriceFromPurchasePrice(
          purchasePrice: item.purchasePrice,
          feeInfo: feeInfo,
          rate: value,
          minProfit: 0,
          useFba: item.useFba,
        );
        return sellPrice;
      }
  }
}

List<List<Object>> _createDefaultCsv(
  List<StockItem> items,
  List<CsvColumn> order,
) {
  final data = <List<Object>>[
    <String>[for (final o in order) o.toDisplayString()],
    for (final item in items) _createData(item, order),
  ];
  return data;
}

List<Object> _createData(StockItem item, List<CsvColumn> order) {
  final ret = <Object>[];
  for (final o in order) {
    switch (o) {
      case CsvColumn.asin:
        ret.add(item.item.asin);
      case CsvColumn.jan:
        ret.add(item.item.jan);
      case CsvColumn.title:
        ret.add(item.item.title);
      case CsvColumn.sellPrice:
        ret.add(item.sellPrice);
      case CsvColumn.purchasePrice:
        ret.add(item.purchasePrice);
      case CsvColumn.profit:
        ret.add(item.profitPerItem);
      case CsvColumn.listingPrice:
        ret.add(item.item.listPrice);
      case CsvColumn.quantity:
        ret.add(item.amount);
      case CsvColumn.condition:
        ret.add(_createConditionText(item));
      case CsvColumn.shipment:
        ret.add(item.useFba ? "FBA" : "自己発送");
      case CsvColumn.sku:
        ret.add(item.sku);
      case CsvColumn.retailer:
        ret.add(item.retailer);
      case CsvColumn.comment:
        ret.add(item.memo);
      case CsvColumn.purchaseDate:
        ret.add(_createPurchaseDateText(item));
      case CsvColumn.breakEven:
        ret.add(item.breakEven);
      case CsvColumn.conditionText:
        ret.add(item.conditionText);
      case CsvColumn.otherCost:
        ret.add(item.otherCost);
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
