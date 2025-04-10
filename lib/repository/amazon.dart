import 'dart:convert';
import 'dart:io' as http show Cookie;
import 'dart:io';

import 'package:amasearch/controllers/webview_controller.dart';
import 'package:amasearch/models/offer_listings.dart';
import 'package:amasearch/util/dio.dart';
import 'package:amasearch/util/util.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:worker_manager/worker_manager.dart';

part 'amazon.g.dart';

final amazonRepositoryProvider = Provider(AmazonRepository.new);

class _ParseOfferListingsParam {
  _ParseOfferListingsParam({
    required this.asin,
    required this.page,
    required this.body,
  });

  final String asin;
  final int page;
  final String body;
}

String _defaultUserAgent =
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:129.0) Gecko/20100101 Firefox/129.0";

final _uaProvider = FutureProvider((ref) async {
  final webview = ref.read(webviewControllerProvider);
  final ua = await webview.getUserAgent();
  return ua ?? _defaultUserAgent;
});

// カートを含まない場合
// isonlyrenderofferlist=true
class AmazonRepository {
  AmazonRepository(this._ref);

  static const sellByAmazonName = "Amazon.co.jp";

  static const _amazonSellerId = "AN1VRQENFRJN5";
  static const _marketPlaceJp = "A1VC38T7YXB528";

  static const _offerUrlBase = "https://www.amazon.co.jp/gp/product/ajax/";
  static const _shopSelector = "#aod-offer-soldBy div.a-col-right";
  static const _priceSelector = "span.a-price span.a-price-whole";
  static const _shipFromSelector = "#aod-offer-shipsFrom .a-color-base";
  static const _conditionSelector = "#aod-offer-heading";
  static const _imageSelector = "div#aod-condition-image";

  static const cartSelector = "#aod-pinned-offer";
  static const totalOfferCountSelector = "#aod-filter-offer-count-string";
  static const firstPageOffersSelector = "#aod-offer-list > div[id^=aod-offer]";
  static const secondPageOffersSelector = "body > div[id^=aod-offer]";

  static const _stockUrlBase = "https://www.amazon.co.jp/dp/[asin]/ref=sr_1_1";

  static final _totalRegex = RegExp(r"(\d+)個のオプション");
  static final _totalRegex2 = RegExp(r"(\d+)件の出品");
  static final _stockRegex = RegExp(r"残り(\d+)点");
  static final _jpNumberRegex = RegExp("[０-９]");

  static const _productUrl = "https://www.amazon.co.jp/gp/product/";

  final Ref _ref;

  void _customHandler(int code) {
    if (500 <= code && code < 600) {
      _ref
          .read(persistCookieJarProvider)
          .whenData((value) => value.deleteAll());
      throw Exception("Amazon サーバーの障害($code)");
    }
  }

  Map<String, String> _commonHeader() {
    return <String, String>{
      "User-Agent": _defaultUserAgent,
      "Accept-Encoding": "gzip, deflate, br, zstd",
      "Accept": "text/html,*/*",
      "Accept-Language": "ja",
      "Connection": "keep-alive",
      "Cache-Control": "no-cache",
      "Pragma": "no-cache",
      "DNT": "1",
      "Sec-GPC": "1",
      "TE": "trailers",
    };
  }

  //ignore: unused_element
  Future<void> _ensureCookie(String asin) async {
    final d = await _ref.read(dioCookieProvider.future);
    final jar = await _ref.read(persistCookieJarProvider.future);
    final cookie = await jar.loadForRequest(Uri(host: "amazon.co.jp"));
    final now = DateTime.now();
    if (cookie.isNotEmpty &&
        cookie.every((e) => e.expires?.isAfter(now) ?? false)) {
      return;
    }
    final url = "$_productUrl$asin";

    final opt = dio.Options(
      headers: _commonHeader(),
    );
    await d.get(url, opt: opt, customHandler: _customHandler);
  }

  Future<OfferListings> getOffers(
    OfferListingsParams params,
    dio.CancelToken cancelToken,
  ) async {
    final d = await _ref.read(dioCookieProvider.future);

    final userAgent = await _ref.read(_uaProvider.future);

    if (params.useWebview) {
      final cookieManager = CookieManager.instance();
      final cookies = await cookieManager.getCookies(
        url: WebUri("https://www.amazon.co.jp"),
      );
      final savedCookie = <http.Cookie>[];
      for (final e in cookies) {
        final c = http.Cookie(e.name, e.value as String);
        if (e.expiresDate == null) {
          c.expires = DateTime.fromMillisecondsSinceEpoch(e.expiresDate!);
        }
        c
          ..httpOnly = e.isHttpOnly ?? false
          ..secure = e.isSecure ?? false
          ..sameSite = switch (e.sameSite) {
            HTTPCookieSameSitePolicy.LAX => SameSite.lax,
            HTTPCookieSameSitePolicy.STRICT => SameSite.strict,
            HTTPCookieSameSitePolicy.NONE => SameSite.none,
            HTTPCookieSameSitePolicy() => SameSite.none,
            null => null,
          };
        savedCookie.add(c);
      }

      final jar = await _ref.read(persistCookieJarProvider.future);
      // final httpCookie =
      //     await jar.loadForRequest(Uri.parse("https://www.amazon.co.jp"));
      await jar.saveFromResponse(
        Uri.parse("https://www.amazon.co.jp"),
        savedCookie,
      );
      // final httpCookie2 =
      //     await jar.loadForRequest(Uri.parse("https://www.amazon.co.jp"));
    } else {
      // await _ensureCookie(params.asin);
      if (params.page == 0) {
        final opt = dio.Options(
          preserveHeaderCase: true,
          headers: <String, dynamic>{
            ..._commonHeader(),
            "Sec-Fetch-Site": "none",
            "Sec-Fetch-Mode": "navigate",
            "Sec-Fetch-Dest": "document",
            "Sec-Fetch-User": "?1",
            "Upgrade-Insecure-Requests": "1",
            "Priority": "u=0, i",
          },
        );
        await d.get("https://www.amazon.co.jp/dp/${params.asin}/", opt: opt);
      }
    }

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
    final pageno = params.page + 1;
    final query = <String, dynamic>{
      "asin": params.asin,
      "m": "",
      "qid": "",
      "smid": "",
      "sourcecustomerorglistid": "",
      "sourcecustomerorglistitemid": "",
      "sr": "",
      "pc": "dp",
      "filters": reqParamStr,
      "experienceId": "aodAjaxMain",
    };
    if (params.page > 0) {
      query["pageno"] = pageno;
      // 1ページ目はカートも含めるが2ページ目以降は不要
      query["isonlyrenderofferlist"] = true;
    }

    final opt = dio.Options(
      preserveHeaderCase: true,
      headers: <String, dynamic>{
        ..._commonHeader(),
        HttpHeaders.refererHeader: "https://www.amazon.co.jp/dp/${params.asin}",
        "X-Requested-With": "XMLHttpRequest",
        "Sec-Fetch-Site": "same-origin",
        "Sec-Fetch-Mode": "cors",
        "Sec-Fetch-Dest": "empty",
        "User-Agent": userAgent,
      },
    );
    final url = params.page == 0
        ? "${_offerUrlBase}ref=auto_load_aod"
        : "${_offerUrlBase}ref=aod_page_$pageno";
    final resp = await d.get(
      url,
      query: query,
      opt: opt,
      customHandler: _customHandler,
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
      body: resp.data!,
    );
    final offers =
        await workerManager.execute(() => _parseOfferListings(parseParam));
    return offers;
  }

  static OfferListings _parseOfferListings(
    _ParseOfferListingsParam param,
  ) {
    final doc = HtmlParser(param.body).parse();

    final cartElement = doc.querySelector(cartSelector);
    final cart = param.page == 0 && cartElement != null
        ? parseCartItem(cartElement)
        : null;

    final totalElement = doc.querySelector(totalOfferCountSelector);
    final total = parseTotal(totalElement);

    // final offerElement = doc.querySelector("#aod-offer-list");
    final offers = param.page == 0
        ? parseOfferItems(doc.body!, firstPageOffersSelector)
        : parseOfferItems(doc.body!, secondPageOffersSelector);

    return OfferListings(
      asin: param.asin,
      total: total,
      cart: cart,
      offers: offers,
    );
  }

  static OfferItem? parseCartItem(Element offer) {
    final shopElement = offer.querySelector(_shopSelector);
    if (shopElement == null) {
      return null;
    }
    final shopLink = shopElement.querySelector("a");
    final shopName =
        shopLink == null ? shopElement.text.trim() : shopLink.text.trim();
    final sellerId = _parseSellerId(shopLink);
    final priceStr =
        offer.querySelector(_priceSelector)?.text.replaceAll(",", "").trim();
    final price = int.tryParse(priceStr ?? "0") ?? 0;
    final condRaw = offer.querySelector(_conditionSelector)?.text ?? "";
    var cond = "不明";
    if (condRaw.contains("新品") && !condRaw.contains("ほぼ")) {
      cond = "新品";
    } else {
      final temp = condRaw.split("-");
      if (temp.length == 2) {
        cond = temp[1].trim();
      }
    }
    final shipFrom = offer.querySelector(_shipFromSelector)!.text.trim();
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

  static int parseTotal(Element? el) {
    if (el == null) {
      return 0;
    }
    var totalStr = _totalRegex.firstMatch(el.text)?.group(1);
    if (totalStr == null) {
      final totalStr2 = _totalRegex2.firstMatch(el.text)?.group(1);
      if (totalStr2 == null) {
        return 0;
      }
      totalStr = totalStr2;
    }
    // 全角から半角に変換
    final normalizeStr = totalStr.replaceAllMapped(
      _jpNumberRegex,
      (Match m) => String.fromCharCode(m.group(0)!.codeUnitAt(0) - 0xFEE0),
    );
    final total = int.tryParse(normalizeStr);
    return total ?? 0;
  }

  static List<OfferItem> parseOfferItems(Element root, String rootSelector) {
    final offers = root.querySelectorAll(rootSelector);
    final items = <OfferItem>[];
    for (final offer in offers) {
      final shopElement = offer.querySelector(_shopSelector)!;
      final shopLink = shopElement.querySelector("a");
      final shop =
          shopLink == null ? shopElement.text.trim() : shopLink.text.trim();
      final sellerId = _parseSellerId(shopLink);
      final priceStr =
          offer.querySelector(_priceSelector)!.text.replaceAll(",", "").trim();
      final price = int.tryParse(priceStr) ?? 0;
      // TODO: + ￥500\n 配送料 から抽出
      // 全国送料無料
      //　通常配送無料\n詳細
      // & 配送料無料
      // final ship = offer.querySelector(_shipCostSelector);
      // final shipText = ship?.text?.trim();
      // TODO: 送料が取れない
      // print("$shop: ${shipText ?? "null"}");
      final shipFrom = offer.querySelector(_shipFromSelector)!.text.trim();
      final condRaw = offer.querySelector(_conditionSelector)!.text;
      var cond = "不明";
      if (condRaw.contains("新品") && !condRaw.contains("ほぼ")) {
        cond = "新品";
      } else {
        final temp = condRaw.split("-");
        if (temp.length == 2) {
          cond = temp[1].trim();
        }
      }
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

  static String _parseSellerId(Element? shopLink) {
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
    String asin,
    String sellerId,
    dio.CancelToken cancelToken,
  ) async {
    final d = await _ref.read(dioCookieProvider.future);

    final url = _stockUrlBase.replaceAll("[asin]", asin);
    final query = <String, dynamic>{
      "m": sellerId != "" ? sellerId : _amazonSellerId,
      "marketplaceID": _marketPlaceJp,
    };

    final opt = dio.Options(
      headers: <String, String>{
        HttpHeaders.userAgentHeader: _defaultUserAgent,
      },
    );
    final resp =
        await d.get(url, query: query, opt: opt, cancelToken: cancelToken);

    if (resp.statusCode != 200) {
      throw Exception("エラー${resp.statusCode}");
    }
    if (resp.data == "") {
      throw Exception("エラー");
    }
    // _parseStock(resp.data) とすると resp が isolate に渡されることになり(?)、
    // object is unsensible でエラーになるため、プリミティブ型のみを渡すようにする
    final data = resp.data;
    final stocks = await workerManager.execute(() => _parseStock(data));
    // final stocks = await compute(_parseStock, resp.data);
    // final stocks = _parseStock(resp.data);

    return stocks;
  }

  static int _parseStock(String? body) {
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
    return doc.querySelectorAll("#quantity > option").length;
  }

  Future<List<String>> getSuggestion(String word) async {
    final dio = await _ref.read(dioCookieProvider.future);
    final url = "https://completion.amazon.co.jp/api/2017/suggestions?"
        "limit=10&prefix=$word&suggestion-type=WIDGET&suggestion-type=KEYWORD&"
        "page-type=Gateway&alias=aps&site-variant=desktop&version=3&wc=&"
        "lop=ja_JP&mid=A1VC38T7YXB528";
    final resp = await dio.get(url);
    final js = json.decode(resp.data!) as Map<String, dynamic>;
    final data = SuggestionResponse.fromJson(js);
    return data.suggestions.map((e) => e.value).toList();
  }
}

@JsonSerializable()
class SuggestionResponse {
  SuggestionResponse(this.prefix, this.suggestions);

  factory SuggestionResponse.fromJson(Map<String, dynamic> json) =>
      _$SuggestionResponseFromJson(json);

  String prefix;
  List<Suggestion> suggestions;

  Map<String, dynamic> toJson() => _$SuggestionResponseToJson(this);
}

@JsonSerializable()
class Suggestion {
  Suggestion(this.value);

  factory Suggestion.fromJson(Map<String, dynamic> json) =>
      _$SuggestionFromJson(json);

  String value;

  Map<String, dynamic> toJson() => _$SuggestionToJson(this);
}
