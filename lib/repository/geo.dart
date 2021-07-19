import 'dart:convert';
import 'dart:io';

import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/dio.dart';
import 'package:amasearch/util/util.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
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
    final code = value.length > _geoCodeLength
        ? value.substring(1, 1 + _geoCodeLength)
        : value;

    const url = "$serverUrl/v1beta1/geo/code";
    final dio = await _read(dioProvider.future);

    final user = await _read(authStateChangesProvider.last);

    final header = await commonHeader(user!);

    final param = <String, String>{
      "code": code,
    };
    try {
      final resp = await dio.post<String>(
        url,
        data: param,
        options: Options(headers: header),
      );

      final data = json.decode(resp.data!) as Map<String, dynamic>;

      return GeoResponse.fromJson(data);
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

  factory GeoResponse.fromJson(Map<String, dynamic> json) =>
      _$GeoResponseFromJson(json);
}
