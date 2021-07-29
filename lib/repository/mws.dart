import 'dart:convert';

import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/controllers/search_settings_controller.dart';
import 'package:amasearch/models/item_price.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/util/alert.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/dio.dart';
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

final mwsRepositoryProvider =
    Provider((ref) => MwsRepository(ref.read, ref.container));

final searchItemFutureProvider = FutureProvider.autoDispose
    .family<SearchItem, Future<SearchItem>>((ref, paramFuture) async {
  final param = await paramFuture;
  final box = ref.read(searchItemBoxProvider);
  final item = box.get(param.searchDate);
  if (item != null && item.jan == param.jan) {
    ref.maintainState = true;
    return item;
  }

  final mws = ref.read(mwsRepositoryProvider);
  final resp = await mws.getProductById(param.jan);

  ref.maintainState = true;

  final settings = ref.read(generalSettingsControllerProvider);
  final tts = ref.read(ttsProvider);

  if (settings.enableReadAloud) {
    if (resp.items.isEmpty) {
      tts.speak("見つかりませんでした。");
    } else {
      final template = settings.readAloudPatterns[settings.patternIndex];
      final search = ref.read(searchSettingsControllerProvider);
      tts.speak(createSpeakText(
        template: template.pattern,
        item: resp.items.first,
        priorFba: search.priorFba,
        usedSubCondition: search.usedSubCondition,
      ));
    }
  }

  // final sellByAmazon =
  //     await ref.watch(sellByAmazonProvider(resp.items.first.asin).future);
  // print("jan: ${param.jan}, $sellByAmazon");

  final searchItem = SearchItem(
    searchDate: param.searchDate,
    jan: param.jan,
    asins: resp.items,
  );
  if (resp.items.isNotEmpty) {
    // 空じゃない場合のみ保存
    // ignore: unawaited_futures
    box.put(param.searchDate, searchItem);

    if (settings.enableAlert && settings.enableAlertVibration) {
      final item = resp.items.first;
      final searchSettings = ref.read(searchSettingsControllerProvider);
      if (settings.alerts.any((element) => element.match(
            item,
            searchSettings,
            isMajorCustomer: settings.isMajorCustomer,
          ))) {
        await Vibration.vibrate(duration: 400, amplitude: 128);
      }
    }
  }
  return searchItem;
});

final queryItemResultProvider = FutureProvider.autoDispose
    .family<List<AsinData>, ListMatchingProductRequest>((ref, req) async {
  final mws = ref.read(mwsRepositoryProvider);
  final resp = await mws.listMatchingProducts(req.query, req.category);
  ref.maintainState = true;
  return resp.items;
});

class MwsRepository {
  MwsRepository(this._read, this._container);

  static const _mwsMarketPlaceId = "A1VC38T7YXB528";

  final Reader _read;
  final ProviderContainer _container;

  Future<GetProductByIdResponse> getProductById(String code,
      {String idType = "JAN"}) async {
    final params = <String, String>{
      "code": code,
      "type": idType,
      "marketplace": _mwsMarketPlaceId,
    };

    final serverUrl = await _read(serverUrlProvider.future);
    final resp = await _doRequest("$serverUrl/v1beta1/mws/product",
        data: json.encode(params));
    return GetProductByIdResponse.fromJson(resp);
  }

  Future<GetProductPricesResponse> getProductPrices(String code) async {
    final params = <String, String>{
      "code": code,
    };

    final serverUrl = await _read(serverUrlProvider.future);
    final resp = await _doRequest("$serverUrl/v1beta1/mws/prices",
        data: json.encode(params));
    return GetProductPricesResponse.fromJson(resp);
  }

  Future<ListMatchingProductResponse> listMatchingProducts(
    String query,
    String category,
  ) async {
    final params = <String, String>{
      "query": query,
      "category": category,
      "marketplace": _mwsMarketPlaceId,
    };

    final serverUrl = await _read(serverUrlProvider.future);
    final resp = await _doRequest("$serverUrl/v1beta1/mws/search",
        data: json.encode(params));

    return ListMatchingProductResponse.fromJson(resp);
  }

  Future<Map<String, dynamic>> _doRequest(String url, {String? data}) async {
    final dio = await _read(dioProvider.future);

    final user = await _read(authStateChangesProvider.last);
    final header = await commonHeader(user!);

    final resp = await dio.post(
      url,
      data: data,
      opt: Options(headers: header),
      customHandler: (code) {
        switch (code) {
          case 412:
            // TODO:  await を外したが、これで問題ないか要確認
            _container.refresh(updateProvider);
            throw Exception("アプリケーションを更新してください");
          case 401:
            throw Exception("ログインされていません");
        }
      },
    );
    return json.decode(resp.data!) as Map<String, dynamic>;
  }
}

@freezed
class GetProductByIdResponse with _$GetProductByIdResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory GetProductByIdResponse({
    required String jan,
    required List<AsinData> items,
  }) = _GetProductByIdResponse;

  factory GetProductByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProductByIdResponseFromJson(json);
}

@freezed
class GetProductPricesResponse with _$GetProductPricesResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory GetProductPricesResponse({
    ItemPrices? prices,
    bool? sellByAmazon,
  }) = _GetProductPricesResponse;

  factory GetProductPricesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProductPricesResponseFromJson(json);
}

@freezed
class ListMatchingProductRequest with _$ListMatchingProductRequest {
  const factory ListMatchingProductRequest({
    required String query,
    required String category,
  }) = _ListMatchingProductRequest;
}

@freezed
class ListMatchingProductResponse with _$ListMatchingProductResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ListMatchingProductResponse({
    required List<AsinData> items,
  }) = _ListMatchingProductResponse;

  factory ListMatchingProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ListMatchingProductResponseFromJson(json);
}
