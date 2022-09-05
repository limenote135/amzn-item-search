import 'dart:typed_data';

import 'package:amasearch/repository/mws_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:riverpod/riverpod.dart';

import 'constants.dart';
import 'item_price.dart';

part 'asin_data.freezed.dart';
part 'asin_data.g.dart';

final currentAsinDataProvider =
    Provider<AsinData>((_) => throw UnimplementedError());

final currentAsinListProvider =
    Provider<List<AsinData>>((_) => throw UnimplementedError());

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
    @HiveField(11, defaultValue: defaultListingRestrictions)
    @Default(defaultListingRestrictions)
    @JsonKey()
        ListingRestrictions restrictions,
    @HiveField(12, defaultValue: "") @Default("") String model,
  }) = _AsinData;

  factory AsinData.fromJson(Map<String, dynamic> json) =>
      _$AsinDataFromJson(json);
}

const defaultListingRestrictions =
    ListingRestrictions(newItem: false, used: false);

@freezed
class ListingRestrictions with _$ListingRestrictions {
  @JsonSerializable(fieldRename: FieldRename.snake)
  @HiveType(typeId: listingRestrictionTypeId)
  const factory ListingRestrictions({
    @HiveField(0)
    @Default(false)
    @JsonKey(name: "new", defaultValue: false)
        bool newItem,
    @HiveField(1) @Default(false) @JsonKey(defaultValue: false) bool used,
  }) = _ListingRestrictions;

  factory ListingRestrictions.fromJson(Map<String, dynamic> json) =>
      _$ListingRestrictionsFromJson(json);
}

class ItemCategoryConverter implements JsonConverter<String, String> {
  const ItemCategoryConverter();

  @override
  String toJson(String object) {
    return object; // JSON にするときは日本語のカテゴリを使う
  }

  @override
  String fromJson(String json) {
    if (mwsCategoryMap.containsKey(json)) {
      return mwsCategoryMap[json]!;
    }
    return json;
  }
}
