import 'dart:convert';

import 'package:amasearch/models/mws.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'common.dart';

final mwsRepositoryProvider = Provider((ref) => MwsRepository(ref.read));

class MwsRepository {
  MwsRepository(this._read);

  static const _mwsMarketPlaceId = "A1VC38T7YXB528";

  static const _url = kReleaseMode
      ? "https://amasearch-stg.an.r.appspot.com"
      : "http://192.168.2.201:8080";

  final Reader _read;

  Future<GetProductByIdResponse> getProductById(String code,
      {String idType = "JAN"}) async {
    final params = <String, String>{
      "code": code,
      "type": idType,
      "marketplace": _mwsMarketPlaceId,
    };

    final resp = await _doRequest("$_url/v1beta1/mws/product",
        data: json.encode(params));
    return GetProductByIdResponse.fromJson(resp);
  }

  Future<GetProductPricesResponse> getProductPrices(String code) async {
    final params = <String, String>{
      "code": code,
    };
    final resp =
        await _doRequest("$_url/v1beta1/mws/prices", data: json.encode(params));
    return GetProductPricesResponse.fromJson(resp);
  }

  Future<ListMatchingProductResponse> listMatchingProducts(
    String query,
  ) async {
    final params = <String, String>{
      "query": query,
      "category": "All",
      "marketplace": _mwsMarketPlaceId,
    };

    final resp =
        await _doRequest("$_url/v1beta1/mws/search", data: json.encode(params));

    return ListMatchingProductResponse.fromJson(resp);
  }

  Future<Map<String, dynamic>> _doRequest(String url, {String data}) async {
    final dio = _read(dioProvider);

    final resp = await dio.post<String>(url, data: data);
    return json.decode(resp.data) as Map<String, dynamic>;
  }
}
