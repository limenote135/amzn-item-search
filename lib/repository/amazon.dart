import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:amasearch/models/offer_listings.dart';
import 'package:amasearch/repository/common.dart';
import 'package:amasearch/util/util.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';

final amazonRepositoryProvider = Provider((ref) => AmazonRepository(ref.read));

class _ParseOfferListingsParam {
  _ParseOfferListingsParam(
      {@required this.asin, @required this.page, @required this.body});

  final String asin;
  final int page;
  final String body;
}

// カートを含まない場合
// isonlyrenderofferlist=true
class AmazonRepository {
  AmazonRepository(this._read);

  static const sellByAmazonName = "Amazon.co.jp";

  static const _amazonSellerId = "AN1VRQENFRJN5";
  static const _marketPlaceJp = "A1VC38T7YXB528";

  static final _random = Random();
  static String get _userAgent {
    final rand = _random.nextInt(9) + 80;
    return "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.$rand Safari/537.36";
  }

  static const _offerUrlBase =
      "https://www.amazon.co.jp/gp/aod/ajax/ref=dp_aod_ALL_mbc";
  static const _shopSelector = "#aod-offer-soldBy div.a-col-right";
  static const _priceSelector = "span.a-price span.a-price-whole";
  static const _shipCostSelector = "div[id^=aod-bottlingDepositFee] + span";
  static const _shipFromSelector = "#aod-offer-shipsFrom .a-color-base";
  static const _conditionSelector = "#aod-offer-heading > h5";
  static const _imageSelector = "div#aod-condition-image";

  static const _stockUrlBase = "https://www.amazon.co.jp/dp/[asin]/ref=sr_1_1";

  static final _totalRegex = RegExp(r"その他(.+?)個のオプション");
  static final _stockRegex = RegExp(r"残り(\d+)点");
  static final _jpNumberRegex = RegExp("[０-９]");

  final Reader _read;

  Future<OfferListings> getOffers(
      OfferListingsParams params, CancelToken cancelToken) async {
    final reqParam = <String, dynamic>{
      "all": true,
      "primeEligible": params.prime,
      "new": params.newItem,
      "usedLikeNew": params.usedLikeNew,
      "usedVeryGood": params.usedVeryGood,
      "usedGood": params.usedGood,
      "usedAcceptable": params.usedAcceptable,
    };
    final reqParamStr = urlEncode(json.encode(reqParam));
    final query = <String, dynamic>{
      "asin": params.asin,
      "filters": reqParamStr,
      "pageno": params.page + 1,
    };
    final dio = _read(dioProvider);
    final resp = await dio.get<String>(
      _offerUrlBase,
      queryParameters: query,
      options: Options(headers: <String, String>{
        HttpHeaders.userAgentHeader: _userAgent,
      }),
      cancelToken: cancelToken,
    );
    if (resp.statusCode != 200) {
      throw Exception("エラー${resp.statusCode}");
    }
    if (resp.data == "") {
      throw Exception("エラー");
    }
    final parseParam = _ParseOfferListingsParam(
      asin: params.asin,
      page: params.page,
      body: resp.data,
    );
    final offers = await compute(_parseOfferListings, parseParam);

    return offers;
  }

  static OfferListings _parseOfferListings(_ParseOfferListingsParam param) {
    final doc = HtmlParser(param.body).parse();

    final cartElement = doc.querySelector("#aod-pinned-offer");
    final cart = param.page == 0 ? _parseCartItem(cartElement) : null;

    final totalElement = doc.querySelector("#aod-filter-offer-count-string");
    final total = _parseTotal(totalElement);

    final offerElement = doc.querySelector("#aod-offer-list");
    final offers = _parseOfferItems(offerElement);

    return OfferListings(
      asin: param.asin,
      total: total,
      cart: cart,
      offers: offers,
    );
  }

  static OfferItem _parseCartItem(Element offer) {
    final shopElement = offer.querySelector(_shopSelector);
    if (shopElement == null) {
      return null;
    }
    final shopLink = shopElement.querySelector("a");
    final shopName =
        shopLink == null ? shopElement.text.trim() : shopLink.text.trim();
    final sellerId = _parseSellerId(shopLink);
    final priceStr =
        offer.querySelector(_priceSelector).text.replaceAll(",", "").trim();
    final price = int.tryParse(priceStr) ?? 0;
    final cond = offer
        .querySelector(_conditionSelector)
        .text
        .replaceAll("\n", "")
        .replaceAll("中古商品- ", "")
        .trim();
    final shipFrom = offer.querySelector(_shipFromSelector).text.trim();
    final hasImage = offer.querySelector(_imageSelector) != null;
    return OfferItem(
      shopName: shopName,
      sellerId: sellerId,
      price: price,
      condition: cond,
      hasImage: hasImage,
      isFba: shipFrom == "Amazon",
    );
  }

  static int _parseTotal(Element el) {
    final totalStr = _totalRegex.firstMatch(el.text)?.group(1);
    if (totalStr == null) {
      return 0;
    }
    final normalizeStr = totalStr.replaceAllMapped(_jpNumberRegex,
        (Match m) => String.fromCharCode(m.group(0).codeUnitAt(0) - 0xFEE0));
    final total = int.tryParse(normalizeStr);
    return total ?? 0;
  }

  static List<OfferItem> _parseOfferItems(Element root) {
    final offers = root.querySelectorAll("#aod-offer");
    final items = <OfferItem>[];
    for (final offer in offers) {
      final shopElement = offer.querySelector(_shopSelector);
      final shopLink = shopElement.querySelector("a");
      final shop =
          shopLink == null ? shopElement.text.trim() : shopLink.text.trim();
      final sellerId = _parseSellerId(shopLink);
      final priceStr =
          offer.querySelector(_priceSelector).text.replaceAll(",", "").trim();
      final price = int.tryParse(priceStr) ?? 0;
      // TODO: + ￥500\n 配送料 から抽出
      // 全国送料無料
      //　通常配送無料\n詳細
      // & 配送料無料
      // final ship = offer.querySelector(_shipCostSelector);
      // final shipText = ship?.text?.trim();
      // TODO: 送料が取れない
      // print("$shop: ${shipText ?? "null"}");
      final shipFrom = offer.querySelector(_shipFromSelector).text.trim();
      final cond = offer
          .querySelector(_conditionSelector)
          .text
          .replaceAll("\n", "")
          .replaceAll("中古商品- ", "")
          .trim();
      final hasImage = offer.querySelector(_imageSelector) != null;
      items.add(
        OfferItem(
          shopName: shop,
          sellerId: sellerId,
          price: price,
          condition: cond,
          hasImage: hasImage,
          isFba: shipFrom == "Amazon",
        ),
      );
    }

    return items;
  }

  static String _parseSellerId(Element shopLink) {
    if (shopLink == null) {
      return "";
    }
    final sellerIdBase = shopLink.attributes["href"];
    if (sellerIdBase == null) {
      return "";
    }
    final sellerUrl = Uri.parse(sellerIdBase);
    return sellerUrl.queryParameters["seller"] ?? "";
  }

  Future<int> getStockCount(
      String asin, String sellerId, CancelToken cancelToken) async {
    final dio = _read(dioProvider);

    final url = _stockUrlBase.replaceAll("[asin]", asin);
    final query = <String, dynamic>{
      "m": sellerId != "" ? sellerId : _amazonSellerId,
      "marketplaceID": _marketPlaceJp,
    };

    final resp = await dio.get<String>(
      url,
      queryParameters: query,
      options: Options(headers: <String, String>{
        HttpHeaders.userAgentHeader: _userAgent,
      }),
      cancelToken: cancelToken,
    );
    if (resp.statusCode != 200) {
      throw Exception("エラー${resp.statusCode}");
    }
    if (resp.data == "") {
      throw Exception("エラー");
    }
    final stocks = await compute(_parseStock, resp.data);
    // final stocks = _parseStock(resp.data);

    return stocks;
  }

  static int _parseStock(String body) {
    final doc = HtmlParser(body).parse();

    final availability = doc.querySelector("#availability > span");
    if (availability == null) {
      return 0;
    }
    final text = availability.text;
    // final hasNext = text.contains("入荷予定あり");
    final stocksStr = _stockRegex.firstMatch(text)?.group(1);
    if (stocksStr != null) {
      final stocks = int.tryParse(stocksStr);
      if (stocks != null) {
        return stocks;
      }
    }
    return doc.querySelectorAll("#quantity > option")?.length;
  }
}
