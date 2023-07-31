import 'dart:convert';

import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/controllers/search_settings_controller.dart';
import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/util/alert.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/dio.dart';
import 'package:amasearch/util/exceptions.dart';
import 'package:amasearch/util/hive_provider.dart';
import 'package:amasearch/util/read_aloud_util.dart';
import 'package:amasearch/util/text_to_speech.dart';
import 'package:amasearch/widgets/updater_widget.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vibration/vibration.dart';

import 'common.dart';

part 'mws.freezed.dart';
part 'mws.g.dart';

final mwsRepositoryProvider = Provider(MwsRepository.new);

final searchItemFutureProvider = FutureProvider.autoDispose
    .family<SearchItem, Future<SearchItem>>((ref, paramFuture) async {
  final param = await paramFuture;
  final box = ref.read(searchItemBoxProvider);
  final item = box.get(param.searchDate);
  if (item != null && item.jan == param.jan) {
    ref.keepAlive();
    return item;
  }

  final mws = ref.read(mwsRepositoryProvider);
  final resp = await mws.getProductById(param.jan);

  ref.keepAlive();

  final settings = ref.read(generalSettingsControllerProvider);
  final searchSetting = ref.read(searchSettingsControllerProvider);
  final tts = ref.read(ttsProvider);
  final isPaidUser = ref.read(isPaidUserProvider);
  var alerts = settings.alerts;

  if (!isPaidUser) {
    alerts = alerts.take(2).toList();
  }

  if (settings.enableReadAloud && isPaidUser) {
    if (resp.items.isEmpty) {
      tts.speak("見つかりませんでした。");
    } else {
      final template = settings.readAloudPatterns[settings.patternIndex];
      tts.speak(
        createSpeakText(
          template: template.pattern,
          item: resp.items.first,
          priorFba: searchSetting.priorFba,
          useFba: searchSetting.useFba,
          usedSubCondition: searchSetting.usedSubCondition,
        ),
      );
    }
  }

  // final sellByAmazon =
  //     await ref.watch(sellByAmazonProvider(resp.items.first.asin).future);
  // print("jan: ${param.jan}, $sellByAmazon");

  var asins = resp.items;
  if (param.defaultPurchasePrice != 0) {
    asins = asins
        .map(
          (e) => e.copyWith(defaultPurchasePrice: param.defaultPurchasePrice),
        )
        .toList();
  }
  final searchItem = SearchItem(
    searchDate: param.searchDate,
    jan: param.jan,
    asins: asins,
  );
  if (resp.items.isNotEmpty) {
    // 空じゃない場合のみ保存
    // ignore: unawaited_futures
    box.put(param.searchDate, searchItem);

    if (settings.enableAlert && settings.enableAlertVibration) {
      final item = resp.items.first;
      final searchSettings = ref.read(searchSettingsControllerProvider);
      if (alerts.any(
        (element) => element.match(
          item,
          searchSettings,
        ),
      )) {
        await Vibration.vibrate(pattern: [200, 600], intensities: [0, 255]);
      }
    }
  }
  return searchItem;
});

final queryItemResultProvider = FutureProvider.autoDispose
    .family<List<String>, QueryItemsRequest>((ref, req) async {
  if (req.query == "") {
    return const [];
  }
  final mws = ref.read(mwsRepositoryProvider);
  final resp = await mws.queryItems(req.query, req.category);
  ref.keepAlive();
  return resp.asins;
});

final listingsRestrictionFutureProvider = FutureProvider.autoDispose
    .family<ListingRestrictions, String>((ref, asin) async {
  final cancelToken = CancelToken();
  ref.onDispose(cancelToken.cancel);
  final mws = ref.read(mwsRepositoryProvider);
  final resp = await mws.getRestrictionInfo(asin, cancelToken: cancelToken);

  ref.keepAlive();
  return resp;
});

final variationsFutureProvider =
    FutureProvider.autoDispose.family<List<String>, String>((ref, asin) async {
  final cancelToken = CancelToken();
  ref.onDispose(cancelToken.cancel);
  final mws = ref.read(mwsRepositoryProvider);
  final resp = await mws.getItemVariations(asin, cancelToken: cancelToken);

  ref.keepAlive();
  return resp.asins;
});

class MwsRepository {
  MwsRepository(this._ref);

  static const _mwsMarketPlaceId = "A1VC38T7YXB528";

  final Ref _ref;

  Future<GetProductByIdResponse> getProductById(
    String code, {
    String idType = "JAN",
  }) async {
    if (int.tryParse(code) == null) {
      // 数値以外が含まれる場合は JAN コードではない
      return Future.value(GetProductByIdResponse(code: code, items: []));
    }
    final params = <String, String>{
      "code": code,
      "type": idType,
      "marketplace": _mwsMarketPlaceId,
    };

    final serverUrl = await _ref.read(serverUrlProvider.future);
    final resp = await _doRequest(
      "$serverUrl/v1beta2/spapi/product",
      data: json.encode(params),
    );
    return GetProductByIdResponse.fromJson(resp);
  }

  Future<QueryItemsResponse> queryItems(String query, String category) async {
    final params = <String, String>{
      "word": query,
      "category": category,
      "marketplace": _mwsMarketPlaceId,
    };

    final serverUrl = await _ref.read(serverUrlProvider.future);
    final resp = await _doRequest(
      "$serverUrl/v1beta2/spapi/query",
      data: json.encode(params),
    );
    return QueryItemsResponse.fromJson(resp);
  }

  Future<BatchGetAsinDataResponse> batchGetAsinData(
    List<String> asins, {
    bool skipRestrictions = false,
    CancelToken? cancelToken,
  }) async {
    final serverUrl = await _ref.read(serverUrlProvider.future);
    final url = "$serverUrl/v1beta2/spapi/asins";
    final params = <String, Object>{
      "asins": asins,
      "skip_restrictions": skipRestrictions,
    };

    final resp = await _doRequest(
      url,
      data: json.encode(params),
      cancelToken: cancelToken,
    );
    return BatchGetAsinDataResponse.fromJson(resp);
  }

  Future<ListingRestrictions> getRestrictionInfo(
    String asin, {
    CancelToken? cancelToken,
  }) async {
    final serverUrl = await _ref.read(serverUrlProvider.future);
    final url = "$serverUrl/v1beta2/spapi/restrictions/$asin";

    final resp = await _doGetRequest(url, cancelToken: cancelToken);
    return ListingRestrictions.fromJson(resp);
  }

  Future<GetItemVariationsResponse> getItemVariations(
    String asin, {
    CancelToken? cancelToken,
  }) async {
    final serverUrl = await _ref.read(serverUrlProvider.future);
    final url = "$serverUrl/v1beta2/spapi/variations/$asin";

    final resp = await _doGetRequest(url, cancelToken: cancelToken);
    return GetItemVariationsResponse.fromJson(resp);
  }

  void _customHandler(int code) {
    switch (code) {
      case 403:
        throw Exception("Amazonからのデータ取得ができませんでした\nしばらく待ってから設定より再連携してください");
      case 404:
        throw const AmazonItemNotFoundException("このマーケットでは販売できない商品です");
      case 408:
        throw Exception("少し時間をおいてから再度お試しください");
      case 412:
        // TODO:  await を外したが、これで問題ないか要確認
        final _ = _ref.refresh(updateProvider);
        throw Exception("アプリケーションを更新してください");
      case 401:
        throw Exception("設定メニューからAmazonとの連携を行ってください");
    }
  }

  Future<Map<String, dynamic>> _doGetRequest(
    String url, {
    CancelToken? cancelToken,
  }) async {
    final dio = await _ref.read(dioProvider.future);

    final user = await _ref.read(authStateChangesProvider.future);
    final lwa = await _ref.read(linkedWithAmazonProvider.future);
    if (lwa != true) {
      throw Exception("設定メニューからAmazonとの連携を行ってください");
    }
    final header = await commonHeader(user!);
    final resp = await dio.get(
      url,
      opt: Options(headers: header),
      customHandler: _customHandler,
      cancelToken: cancelToken,
    );
    return json.decode(resp.data!) as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> _doRequest(
    String url, {
    String? data,
    CancelToken? cancelToken,
  }) async {
    final dio = await _ref.read(dioProvider.future);

    final user = await _ref.read(authStateChangesProvider.future);
    final lwa = await _ref.read(linkedWithAmazonProvider.future);
    if (lwa != true) {
      throw Exception("設定メニューからAmazonとの連携を行ってください");
    }
    final header = await commonHeader(user!);

    final resp = await dio.post(
      url,
      data: data,
      opt: Options(headers: header),
      customHandler: _customHandler,
      cancelToken: cancelToken,
    );
    return json.decode(resp.data!) as Map<String, dynamic>;
  }
}

@freezed
class GetProductByIdResponse with _$GetProductByIdResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory GetProductByIdResponse({
    required String code,
    @Default(<AsinData>[]) List<AsinData> items,
  }) = _GetProductByIdResponse;

  factory GetProductByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProductByIdResponseFromJson(json);
}

@freezed
class QueryItemsRequest with _$QueryItemsRequest {
  const factory QueryItemsRequest({
    required String query,
    required String category,
  }) = _QueryItemsRequest;
}

@freezed
class QueryItemsResponse with _$QueryItemsResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory QueryItemsResponse({required List<String> asins}) =
      _QueryItemsResponse;

  factory QueryItemsResponse.fromJson(Map<String, dynamic> json) =>
      _$QueryItemsResponseFromJson(json);
}

@freezed
class BatchGetAsinDataResponse with _$BatchGetAsinDataResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BatchGetAsinDataResponse({
    required List<AsinData> data,
  }) = _BatchGetAsinDataResponse;

  factory BatchGetAsinDataResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchGetAsinDataResponseFromJson(json);
}

@freezed
class GetItemVariationsResponse with _$GetItemVariationsResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory GetItemVariationsResponse({
    @Default(<String>[]) List<String> asins,
  }) = _GetItemVariationsResponse;

  factory GetItemVariationsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetItemVariationsResponseFromJson(json);
}
