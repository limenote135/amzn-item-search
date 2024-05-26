import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';

part 'keepa.freezed.dart';
part 'keepa.g.dart';

final keepaProvider = Provider<KeepaRepository>((ref) {
  return KeepaRepository();
});

class KeepaRepository {
  KeepaRepository();

  static const _baseURL = "https://api.keepa.com";

  Future<KeepaTokenStatusResponse> tokenStatus(String key) async {
    final dio = Dio();
    const url = "$_baseURL/token";
    final query = {
      "key": key,
    };

    try {
      final resp = await dio.get<String>(url, queryParameters: query);
      final data = json.decode(resp.data!) as Map<String, dynamic>;
      return KeepaTokenStatusResponse.fromJson(data);
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      if (e is DioException) {
        final error = e.response?.data;
        if (error != null && error is String && error.startsWith("{")) {
          final data = json.decode(error) as Map<String, dynamic>;
          return KeepaTokenStatusResponse.fromJson(data);
        }
        throw Exception("Keepa API トークンの取得に失敗しました\n"
            "code: ${e.response?.statusCode}, message: ${e.message}");
      }
      throw Exception("Keepa API トークンの取得に失敗しました}");
    }
  }
}

@freezed
class KeepaTokenStatusResponse with _$KeepaTokenStatusResponse {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory KeepaTokenStatusResponse({
    required int timestamp,
    required int tokensLeft,
    required int refillIn,
    required int refillRate,
    required int tokenFlowReduction,
    required int tokensConsumed,
    required int processingTimeInMs,
    KeepaError? error,
  }) = _KeepaTokenStatusResponse;

  factory KeepaTokenStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$KeepaTokenStatusResponseFromJson(json);
}

@freezed
class KeepaError with _$KeepaError {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory KeepaError({
    String? type,
    String? message,
    String? details,
  }) = _KeepaError;

  factory KeepaError.fromJson(Map<String, dynamic> json) =>
      _$KeepaErrorFromJson(json);
}
