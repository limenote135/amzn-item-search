import 'dart:convert';

import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/dio.dart';
import 'package:amasearch/util/util.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'common.dart';

part 'geo.freezed.dart';
part 'geo.g.dart';

final _geoProvider = Provider((ref) => GeoRepository(ref.read));

final geoItemFutureProvider =
    FutureProvider.family<SearchItem, String>((ref, code) async {
  final now = currentTimeString();
  final geo = ref.read(_geoProvider);
  final resp = await geo.get(code);
  // ref.maintainState = true;
  if (resp.jan == "") {
    return SearchItem(searchDate: now, jan: code);
  }
  return SearchItem(searchDate: now, jan: resp.jan);
});

const _geoCodeLength = 7;

class GeoRepository {
  GeoRepository(this._read);

  final Reader _read;

  Future<GeoResponse> get(String value) async {
    if (value.length == janCodeLength &&
        (value.startsWith("45") || value.startsWith("49"))) {
      // JAN コードと思われる場合には見つからなかった扱いにする
      return GeoResponse(code: value);
    }
    final code = value.length > _geoCodeLength
        ? value.substring(1, 1 + _geoCodeLength)
        : value;

    if (int.tryParse(code) == null) {
      // トリミング後にコードに数字以外が含まれる場合はゲオのコードではない
      return GeoResponse(code: value);
    }
    final serverUrl = await _read(serverUrlProvider.future);
    final url = "$serverUrl/v1beta1/geo/code";
    final dio = await _read(dioProvider.future);

    final user = await _read(authStateChangesProvider.future);
    final lwa = await _read(linkedWithAmazonProvider.future);
    if (lwa != true) {
      throw Exception("設定メニューからAmazonとの連携を行ってください");
    }

    final header = await commonHeader(user!);

    final param = <String, String>{
      "code": code,
    };
    final resp =
        await dio.post(url, data: param, opt: Options(headers: header));
    final data = json.decode(resp.data!) as Map<String, dynamic>;

    return GeoResponse.fromJson(data);
  }
}

@freezed
class GeoResponse with _$GeoResponse {
  const factory GeoResponse({
    required String code,
    @Default("") String jan,
  }) = _GeoResponse;

  factory GeoResponse.fromJson(Map<String, dynamic> json) =>
      _$GeoResponseFromJson(json);
}
