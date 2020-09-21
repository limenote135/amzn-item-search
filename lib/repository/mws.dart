import 'dart:collection';
import 'dart:convert';

import 'package:ama_search/models/search_condition.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import 'common.dart';
import 'mws_response.dart';

final mwsRepositoryProvider = Provider((ref) => MwsRepository(ref.read));

class MwsRepository {
  MwsRepository(this._read);

  static const _mwsHost = "mws.amazonservices.jp";
  static const _mwsAccessKey = "AKIAIS47UKN65MUBMVCA";
  static const _mwsAuthToken = "amzn.mws.e8a73282-02b0-00e7-8046-cbcab7309987";
  static const _mwsMarketPlaceId = "A1VC38T7YXB528";
  static const _mwsSecretKey = "c2BAmSt6OMNQUpoI+Ua39IaDoBFB5p5P4kOdrQj4";
  static const _mwsSellerId = "A34OSITVW4HVEN";
  static final Uuid _uuid = Uuid();

  final Reader _read;

  // JAN コードから商品の情報や ASIN を得られる。価格情報等は取れない
  Future<GetMatchingProductForIdResponse> getMatchingProductForID(String code,
      {String idType = "JAN"}) async {
    final params = SplayTreeMap<String, String>();

    params["IdList.Id.1"] = code;
    params["IdType"] = idType;
    params["MarketplaceId"] = _mwsMarketPlaceId;
    const path = "/Products/2011-10-01";
    final resp = await _doRequest(path, "GetMatchingProductForId", params);
    return GetMatchingProductForIdResponse(code, resp);
  }

  // 新品、中古の最安値、カート情報が取れる
  // 1時間あたり200リクエスト
  // 中古はコンディションごとには取れない
  Future<String> getLowestPricedOffersForASIN(List<String> asin) {
    return Future.value("");
  }

  // コンディションや FBA か否か、配送までの期間、評価などによってグルーピングされた出品の、各最安値を取得
  Future<GetLowestOfferListingsForASINResponse> getLowestOfferListingsForASIN(
      List<String> asin, SearchCondition cond) async {
    final params = SplayTreeMap<String, String>();

    for (var i = 0; i < asin.length; i++) {
      final key = "ASINList.ASIN.${i + 1}";
      params[key] = asin[i];
    }
    params["ItemCondition"] = cond.toMwsParam();
    params["MarketplaceId"] = _mwsMarketPlaceId;
    params["ExcludeMe"] = "false";
    const path = "/Products/2011-10-01";
    final resp =
        await _doRequest(path, "GetLowestOfferListingsForASIN", params);
    return GetLowestOfferListingsForASINResponse(resp);
  }

  Future<GetMyFeesEstimateResponse> getMyFeesEstimate(String asin, int price,
      {bool useFba = true}) async {
    final params = SplayTreeMap<String, String>();

    const base = "FeesEstimateRequestList.FeesEstimateRequest.1";

    params["$base.MarketplaceId"] = _mwsMarketPlaceId;
    params["$base.IdType"] = "ASIN";
    params["$base.IdValue"] = asin;
    params["$base.IsAmazonFulfilled"] = "$useFba";
    params["$base.Identifier"] = _uuid.v4();
    params["$base.PriceToEstimateFees.ListingPrice.Amount"] = "$price";
    params["$base.PriceToEstimateFees.ListingPrice.CurrencyCode"] = "JPY";

    const path = "/Products/2011-10-01";
    final resp = await _doRequest(path, "GetMyFeesEstimate", params);
    return GetMyFeesEstimateResponse(resp, price);
  }

  Future<String> _doRequest(
      String path, String action, SplayTreeMap<String, String> params) async {
    params["Action"] = action;
    params["SellerId"] = _mwsSellerId;
    params["MWSAuthToken"] = _mwsAuthToken;
    params["AWSAccessKeyId"] = _mwsAccessKey;
    params["SignatureMethod"] = "HmacSHA256";
    params["SignatureVersion"] = "2";
    params["Version"] = "2011-10-01";
    params["Timestamp"] =
        "${DateTime.now().toUtc().toIso8601String().split(".")[0]}Z";

    final query = _generateQueryString(path, params);
    final signature = _signatureString(query, _mwsSecretKey);

    var body = "";
    params.forEach((key, value) {
      body += "$key=${Uri.encodeQueryComponent(value)}&";
    });
    body += "Signature=${Uri.encodeQueryComponent(signature)}";

    final dio = _read(dioProvider);
    final url = Uri(scheme: "https", host: _mwsHost, path: path);
    final resp = await dio.post<String>(url.toString(),
        options: Options(
            contentType: "application/x-www-form-urlencoded; charset=utf-8"),
        data: body);
    return resp.data;
  }

  static String _generateQueryString(
      String path, SplayTreeMap<String, String> params) {
    var query = "";
    params.forEach((key, value) {
      query += "$key=${Uri.encodeQueryComponent(value)}&";
    });
    query = query.substring(0, query.isEmpty ? 0 : query.length - 1);
    return "POST\n$_mwsHost\n$path\n$query";
  }

  static String _signatureString(String query, String secretKey) {
    final key = utf8.encode(secretKey);
    final data = utf8.encode(query);

    final hmacSha256 = Hmac(sha256, key);
    final digest = hmacSha256.convert(data);
    final base64Str = base64.encode(digest.bytes);
    return base64Str;
  }
}
