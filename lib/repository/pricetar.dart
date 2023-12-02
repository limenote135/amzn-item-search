import 'dart:convert';

import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/dio.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';

import 'common.dart';

part 'pricetar.freezed.dart';
part 'pricetar.g.dart';

final pricetarProvider = Provider(PricetarRepository.new);

class PricetarRepository {
  PricetarRepository(this._ref);

  final Ref _ref;

  Future<LoginResponse> login(String id, String pass) async {
    if (id.isEmpty || pass.isEmpty) {
      throw Exception("メールアドレス/パスワードが入力されていません");
    }

    final serverUrl = await _ref.read(serverUrlProvider.future);
    final url = "$serverUrl/v1beta1/pricetar/auth";
    final dio = await _ref.read(dioProvider.future);

    final user = await _ref.read(authStateChangesProvider.future);
    final lwa = await _ref.read(linkedWithAmazonProvider.future);
    if (!lwa) {
      throw Exception("設定メニューからAmazonとの連携を行ってください");
    }

    final header = await commonHeader(user!);

    final params = <String, String>{
      "id": id,
      "pass": pass,
    };
    final resp = await dio.post(
      url,
      data: params,
      opt: Options(headers: header),
      // customHandler: _customHandler,
    );
    final data = json.decode(resp.data!) as Map<String, dynamic>;

    return LoginResponse.fromJson(data);
  }
}

@freezed
class LoginResponse with _$LoginResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory LoginResponse({
    required String message,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
