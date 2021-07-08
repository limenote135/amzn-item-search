import 'dart:typed_data';

import 'package:amasearch/models/constants.dart';
import 'package:amasearch/models/item_price.dart';
import 'package:amasearch/repository/mws_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'search_item.freezed.dart';
part 'search_item.g.dart';

final currentSearchItemProvider =
    Provider<SearchItem>((_) => throw UnimplementedError());

final currentAsinDataProvider =
    Provider<AsinData>((_) => throw UnimplementedError());

final currentAsinListProvider =
    Provider<List<AsinData>>((_) => throw UnimplementedError());

final currentAsinCountProvider = Provider<int>((_) => 1);

final currentFutureSearchItemProvider =
    Provider<Future<SearchItem>>((_) => throw UnimplementedError());

@freezed
class SearchItem with _$SearchItem {
  @HiveType(typeId: itemTypeId)
  const factory SearchItem({
    @HiveField(0) required String searchDate,
    @HiveField(1) required String jan,
    @HiveField(2) @Default(<AsinData>[]) List<AsinData> asins,
  }) = _SearchItem;
}

@freezed
class AsinData with _$AsinData {
  @JsonSerializable(fieldRename: FieldRename.snake)
  @HiveType(typeId: asinDataTypeId)
  const factory AsinData({
    @HiveField(0) @Default("") String jan,
    @HiveField(1) required String asin,
    @HiveField(2) @Default(0) int listPrice, // 参考価格
    @HiveField(3) required String imageUrl,
    @HiveField(4) required String title,
    @HiveField(5) @Default(0) int rank,
    @HiveField(6) @Default(" - ") String quantity, // セット数
    @HiveField(7) ItemPrices? prices,
    @HiveField(8) @JsonKey(ignore: true) Uint8List? imageData,
    @HiveField(9, defaultValue: "")
    @ItemCategoryConverter()
        required String category,
    @HiveField(10) bool? sellByAmazon,
  }) = _AsinData;

  factory AsinData.fromJson(Map<String, dynamic> json) =>
      _$AsinDataFromJson(json);
}

class ItemCategoryConverter implements JsonConverter<String, String?> {
  const ItemCategoryConverter();

  @override
  String? toJson(String object) {
    return object; // JSON にするときは日本語のカテゴリを使う
  }

  @override
  String fromJson(String? json) {
    if (json == null) {
      return "不明";
    }
    if (mwsCategoryMap.containsKey(json)) {
      return mwsCategoryMap[json]!;
    }
    return json;
  }
}
