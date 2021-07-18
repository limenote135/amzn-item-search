import 'dart:io';

import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/util/dio.dart';
import 'package:amasearch/util/util.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'geo.freezed.dart';

const _noItemText = "NG";

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
  static const _baseURL = "https://bo.sedolist.info/sedoroid/geo/?CODE=";

  Future<GeoResponse> get(String value) async {
    final code = value.length > _geoCodeLength
        ? value.substring(1, 1 + _geoCodeLength)
        : value;

    final url = "$_baseURL$code";
    try {
      final dio = await _read(dioProvider.future);
      final result = await dio.get<String>(url);

      final body = result.data.toString();
      if (body == _noItemText) {
        return GeoResponse(code: code);
      }
      return GeoResponse(code: code, jan: body);
    } on DioError catch (e, stack) {
      if (e.error is SocketException) {
        throw Exception("通信環境の良いところで再度お試しください");
      }
      final code = e.response!.statusCode!;
      if (code >= 500) {
        // サーバーサイドエラー
        await FirebaseCrashlytics.instance.recordError(e, stack);
        throw Exception("サーバーエラー($code)");
      }
      rethrow;
    } on SocketException catch (e, stack) {
      await FirebaseCrashlytics.instance.recordError(e, stack);
      throw Exception("通信環境の良いところで再度お試しください");
    }
  }
}

@freezed
class GeoResponse with _$GeoResponse {
  const factory GeoResponse({
    required String code,
    @Default("") String jan,
  }) = _GeoResponse;
}
