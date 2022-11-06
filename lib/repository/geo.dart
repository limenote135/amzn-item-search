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

final _geoProvider = Provider(GeoRepository.new);

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

class GeoRepository {
  GeoRepository(this._ref);

  final Ref _ref;

  Future<GeoResponse> get(String value) async {
    if (!value.startsWith("c")) {
      // ゲオのコードは 'c' から始まるので、それ以外は無視する
      return GeoResponse(code: value);
    }

    final serverUrl = await _ref.read(serverUrlProvider.future);
    final url = "$serverUrl/v1beta2/geo/code";
    final dio = await _ref.read(dioProvider.future);

    final user = await _ref.read(authStateChangesProvider.future);
    final lwa = await _ref.read(linkedWithAmazonProvider.future);
    if (lwa != true) {
      throw Exception("設定メニューからAmazonとの連携を行ってください");
    }

    final header = await commonHeader(user!);

    final param = <String, String>{
      "code": value,
    };
    final resp = await dio.post(
      url,
      data: param,
      opt: Options(headers: header),
      customHandler: _customHandler,
    );
    final data = json.decode(resp.data!) as Map<String, dynamic>;

    return GeoResponse.fromJson(data);
  }

  void _customHandler(int code) {
    switch (code) {
      case 408:
        throw Exception("少し時間をおいてから再度お試しください");
    }
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
