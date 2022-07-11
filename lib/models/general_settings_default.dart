import 'package:amasearch/models/general_settings.dart';
import 'package:amasearch/util/variable_format.dart';

import 'alert_condition.dart';
import 'enums/alert_type.dart';
import 'enums/csv_columns.dart';
import 'enums/shortcut_type.dart';
import 'keepa_settings.dart';

const defaultSkuFormat =
    "{yyyy}{mm}{dd}-{asin}-{cond}-{purchasePrice}-{quantity}";

const _readAloudPattern1 = "$titleVariable、新品利益$newProfitVariable、"
    "中古利益$usedProfitVariable、順位$rankVariableです。";
const _readAloudPattern2 =
    "$titleVariable、新品利益$newProfitVariable、順位$rankVariableです。";
const _readAloudPattern3 =
    "$titleVariable、中古利益$usedProfitVariable、順位$rankVariableです。";

const defaultReadAloudPatterns = [
  ReadAloudPattern(title: "パターン1", pattern: _readAloudPattern1),
  ReadAloudPattern(title: "パターン2", pattern: _readAloudPattern2),
  ReadAloudPattern(title: "パターン3", pattern: _readAloudPattern3),
];

const customButtonAmazonUrl =
    "https://www.amazon.co.jp/gp/product/$asinVariable/";
const customButtonKeepaUrl = "https://keepa.com/#!product/5-$asinVariable/";
const customButtonDeltaUrl =
    "https://delta-tracer.com/item/detail/jp/$asinVariable/";
const customButtonMonoSearchUrl = "https://mnsearch.com/item?kwd=$asinVariable";
const customButtonKeezonUrl =
    "https://keezon.net/item/index?ASIN=$asinVariable";
const customButtonMercariUrl =
    "https://www.mercari.com/jp/search/?keyword=$titleVariable";
const customButtonAmazonStockUrl =
    "https://sellercentral.amazon.co.jp/inventory/ref=xx_invmgr_dnav_home?tbla_myitable=search:$asinVariable;";
const customButtonAmazonListableUrl =
    "https://sellercentral.amazon.co.jp/abis/listing/syh?asin=$asinVariable";
const customButtonAmazonListingsUrl =
    "https://www.amazon.co.jp/gp/offer-listing/$asinVariable/";
const customButtonRakutenUrl =
    "https://search.rakuten.co.jp/search/mall/$janVariable/";
const customButtonKakakuComModelUrl =
    "https://kakaku.com/search_results/$modelVariable";
const customButtonYahooAuctionUrl =
    "https://auctions.yahoo.co.jp/search/search?ei=utf-8&p=$titleVariable";
const customButtonBookOffUrl =
    "https://www.bookoffonline.co.jp/display/L001,st=a,q=$janVariable";
const customButtonSurugayaUrl =
    "https://www.suruga-ya.jp/search?category=&search_word=$janVariable";
const customButtonOrderHistoryUrl =
    "https://sellercentral.amazon.co.jp/orders-v3/search?page=1&qt=asin&q=$asinVariable";

// カスタムボタンではないが、ショートカットで設定するために定義を用意しておく
const amazonListingsButton = CustomButtonDetail(
  id: "bt00",
  enable: true,
  title: "出品一覧",
  pattern: customButtonAmazonListingsUrl,
);
const defaultCustomButtons = [
  CustomButtonDetail(
    id: "bt01",
    enable: true,
    title: "Amazon",
    pattern: customButtonAmazonUrl,
  ),
  CustomButtonDetail(
    id: "bt02",
    enable: true,
    title: "出品確認",
    pattern: customButtonAmazonListableUrl,
  ),
  CustomButtonDetail(
    id: "bt03",
    enable: true,
    title: "Delta",
    pattern: customButtonDeltaUrl,
  ),
  CustomButtonDetail(
    id: "bt04",
    enable: true,
    title: "モノサーチ",
    pattern: customButtonMonoSearchUrl,
  ),
  CustomButtonDetail(
    id: "bt05",
    enable: false,
    title: "Keezon",
    pattern: customButtonKeezonUrl,
  ),
  CustomButtonDetail(
    id: "bt06",
    enable: false,
    title: "メルカリ",
    pattern: customButtonMercariUrl,
  ),
  CustomButtonDetail(
    id: "bt07",
    enable: false,
    title: "在庫",
    pattern: customButtonAmazonStockUrl,
  ),
  CustomButtonDetail(
    id: "bt08",
    enable: false,
    title: "Keepa(ブラウザ)",
    pattern: customButtonKeepaUrl,
  ),
  CustomButtonDetail(
    id: "bt09",
    enable: false,
    title: "楽天",
    pattern: customButtonRakutenUrl,
  ),
  CustomButtonDetail(
    id: "bt10",
    enable: false,
    title: "価格.com(型番)",
    pattern: customButtonKakakuComModelUrl,
  ),
  CustomButtonDetail(
    id: "bt11",
    enable: false,
    title: "ヤフオク!",
    pattern: customButtonYahooAuctionUrl,
  ),
  CustomButtonDetail(
    id: "bt12",
    enable: false,
    title: "BookOff",
    pattern: customButtonBookOffUrl,
  ),
  CustomButtonDetail(
    id: "bt13",
    enable: false,
    title: "駿河屋",
    pattern: customButtonSurugayaUrl,
  ),
  CustomButtonDetail(
    id: "bt14",
    enable: false,
    title: "販売履歴",
    pattern: customButtonOrderHistoryUrl,
  ),
  CustomButtonDetail(id: "bt15", enable: false, title: "ボタン1", pattern: ""),
  CustomButtonDetail(id: "bt16", enable: false, title: "ボタン2", pattern: ""),
  CustomButtonDetail(id: "bt17", enable: false, title: "ボタン3", pattern: ""),
  CustomButtonDetail(id: "bt17", enable: false, title: "ボタン4", pattern: ""),
  CustomButtonDetail(id: "bt19", enable: false, title: "ボタン5", pattern: ""),
  CustomButtonDetail(id: "bt20", enable: false, title: "ボタン6", pattern: ""),
];

// v1.2.0 でカスタムボタンを20個に増やした際に新しく追加したプリセット
// ID はマイグレーション時に新しく振るので適当な値
const migrationCustomButtons = [
  CustomButtonDetail(
    id: "bt13",
    enable: false,
    title: "Keepa(ブラウザ)",
    pattern: customButtonKeepaUrl,
  ),
  CustomButtonDetail(
    id: "bt14",
    enable: false,
    title: "楽天",
    pattern: customButtonRakutenUrl,
  ),
  CustomButtonDetail(
    id: "bt15",
    enable: false,
    title: "価格.com(型番)",
    pattern: customButtonKakakuComModelUrl,
  ),
  CustomButtonDetail(
    id: "bt16",
    enable: false,
    title: "ヤフオク!",
    pattern: customButtonYahooAuctionUrl,
  ),
  CustomButtonDetail(
    id: "bt17",
    enable: false,
    title: "BookOff",
    pattern: customButtonBookOffUrl,
  ),
  CustomButtonDetail(
    id: "bt18",
    enable: false,
    title: "駿河屋",
    pattern: customButtonSurugayaUrl,
  ),
  CustomButtonDetail(
    id: "bt19",
    enable: false,
    title: "販売履歴",
    pattern: customButtonOrderHistoryUrl,
  ),
];

const defaultCsvOrder = [
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
  CsvColumn.purchaseDate,
];

const defaultAlert = [
  AlertConditionSet(
    id: "default",
    title: "プレ値",
    conditions: [
      AlertCondition(type: AlertType.premium),
    ],
  ),
];

const defaultKeepaSettings = KeepaSettings();

const defaultLeftShortcut = [
  ShortcutDetail(type: ShortcutType.purchase),
  ShortcutDetail(type: ShortcutType.none),
  ShortcutDetail(type: ShortcutType.none),
];

const defaultRightShortcut = [
  ShortcutDetail(type: ShortcutType.delete),
  ShortcutDetail(type: ShortcutType.none),
  ShortcutDetail(type: ShortcutType.none),
];

const defaultNewConditionTexts = [
  "新品未開封品ですが、パッケージや外箱等にスレがある場合もございますので、予めご了承ください。",
  "新品未開封品です。Amazon配送センターより送料無料、365日年中無休で迅速に発送致します。",
  "商品は当店のスタッフが丁寧に梱包して発送させていただきます。",
];
const defaultUsedConditionText = [
  "商品は当店のスタッフが丁寧に検品したものを発送させていただきます。",
  "中古品のため、ご使用に影響ない程度の使用感・経年劣化、キズ、汚れなどがある場合がございます。",
  "多少の使用感はありますが、目立った傷もなく非常に状態のよいものなります。",
];
