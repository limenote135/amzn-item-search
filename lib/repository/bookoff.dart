import 'dart:convert';

import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/repository/common.dart';
import 'package:amasearch/util/dio.dart';
import 'package:amasearch/util/error_report.dart';
import 'package:amasearch/util/util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'bookoff.freezed.dart';
part 'bookoff.g.dart';

final bookoffProvider = Provider((ref) => BookoffRepository(ref.read));

final bookoffItemFutureProvider =
    FutureProvider.family<SearchItem, String>((ref, code) async {
  final now = currentTimeString();
  final bookoff = ref.read(bookoffProvider);
  final resp = await bookoff.get(code);
  // ref.maintainState = true;
  if (resp.isEmpty) {
    return SearchItem(searchDate: now, jan: code);
  }

  return SearchItem(searchDate: now, jan: resp.first.jan);
});

class _NotFoundException implements Exception {
  _NotFoundException(this.message);
  String message;

  @override
  String toString() {
    return message;
  }
}

const _bookoffCodeLength = 10;

class BookoffRepository {
  BookoffRepository(this._read);

  final Reader _read;
  static const _baseURL = "http://www.bookoffonline.co.jp/bolapi/api/goods/";

  Future<List<BookoffResponse>> get(String value) async {
    if (value.length == janCodeLength &&
        (value.startsWith("45") || value.startsWith("49"))) {
      // JAN コードと思われる場合は API コールしない
      return Future.value([]);
    }
    if (int.tryParse(value) == null) {
      // 数字以外が含まれる場合はブックオフのコードではない
      return Future.value([]);
    }
    // コードが短い場合はリクエストしない
    if (value.length < _bookoffCodeLength) {
      return Future.value([]);
    }
    final code = value.length > _bookoffCodeLength
        ? value.substring(0, _bookoffCodeLength)
        : value;
    final url = "$_baseURL$code";
    final dio = await _read(dioProvider.future);
    try {
      final result = await dio.get(
        url,
        customHandler: (code) {
          if (400 <= code && code < 500) {
            throw _NotFoundException("Not found: $url");
          }
        },
      );

      final body = result.data.toString();
      if (!body.startsWith("callback(")) {
        await recordError(
          Exception("Invalid Response"),
          null,
          information: [
            "Unexpected bookoff response",
            "URL: $url",
          ],
        );
        return Future.value([]);
      }
      final normalized = body.substring("callback(".length, body.length - 1);
      final js = jsonDecode(normalized) as List<dynamic>;
      return js
          .map(
            (dynamic e) => BookoffResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    } on _NotFoundException catch (_) {
      return Future.value([]);
      // ignore: avoid_catches_without_on_clauses
    } catch (e, stack) {
      await recordError(e, stack, information: ["code: $value"]);
      return Future.value([]);
    }
  }
}

/* http://www.bookoffonline.co.jp/bolapi/api/goods/0012630480
[
	{
		"AGE_LIMIT": "00",
		"AUTHORNAME": "[{ジャックワース}](著者),[{ニコラス・Ｅ．ルーベン}](著者),
		[{坂本希久子}](訳者),[{神田昌典}](その他)",
		"BUY_PRICE": -1,
		"DISCLOSE_DT": "200001010000",
		"GENRE3CODE": "12090222",
		"GOODS_NAME1": "売り込まなくても売れる！",
		"GOODS_NAME2": "説得いらずの高確率セールス",
		"IMG_USE_YN": "1",
		"IMG_YN_L": "https://content.bookoffonline.co.jp/goodsimages/L/001263/0012630480L.jpg",
		"IMG_YN_LL": "https://content.bookoffonline.co.jp/goodsimages/LL/001263/0012630480LL.jpg",
		"IMG_YN_M": "https://content.bookoffonline.co.jp/goodsimages/M/001263/0012630480M.jpg",
		"IMG_YN_S": "https://content.bookoffonline.co.jp/goodsimages/S/001263/0012630480S.jpg",
		"INSTORECODE": "0012630480",
		"IS_GROUP": "0",
		"JAN": "9784894511378",
		"MKT_PRICE": 1650,
		"MUSIC_TRACK": [],
		"RSV_SHIP_MSG": "1～5日以内に発送",
		"SALEDATE": "20021118",
		"SALE_PR_NEW": 1650,
		"SALE_PR_NEW_DIFF": 0,
		"SALE_PR_USED": 750,
		"SALE_PR_USED_DIFF": 900,
		"SALE_STAT": "3",
		"SECTION": "書籍",
		"SELLER": "フォレスト出版/ ",
		"STOCK_ALL": "0",
		"STOCK_NEW": 0,
		"STOCK_RSV": 0,
		"STOCK_RSV_ENABLE_FLG": "1",
		"STOCK_USED": 0,
		"USEDNEW_SHIP_MSG": "1～5日以内に発送"
	}
]
 */
@freezed
class BookoffResponse with _$BookoffResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BookoffResponse({
    @JsonKey(name: "INSTORECODE") required String instoreCode,
    @JsonKey(name: "GOODS_NAME1") required String title,
    @JsonKey(name: "GOODS_NAME2") String? subtitle,
    @JsonKey(name: "JAN") required String jan,
  }) = _BookoffResponse;

  factory BookoffResponse.fromJson(Map<String, dynamic> json) =>
      _$BookoffResponseFromJson(json);
}
