import 'dart:typed_data';

import 'package:amasearch/models/enums/hazmat_type.dart';
import 'package:amasearch/models/enums/size_type.dart';
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
    @HiveField(8)
    @JsonKey(includeFromJson: false, includeToJson: false)
    Uint8List? imageData,
    @HiveField(9, defaultValue: "")
    @ItemCategoryConverter()
    required String category,
    @HiveField(10) bool? sellByAmazon,
    @HiveField(11, defaultValue: defaultListingRestrictions)
    @Default(defaultListingRestrictions)
    @JsonKey()
    ListingRestrictions restrictions,
    @HiveField(12, defaultValue: "") @Default("") String model,
    @HiveField(13, defaultValue: "") @Default("") String variationRoot,
    @HiveField(14, defaultValue: false) @Default(false) bool isHazmat,
    @HiveField(15, defaultValue: SizeType.normal)
    @SizeTypeConverter()
    @Default(SizeType.normal)
    SizeType sizeType,
    @HiveField(16, defaultValue: 0) @Default(0) int smallFee,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(0)
    int defaultPurchasePrice,
    @HiveField(17, defaultValue: HazmatType.nonHazmat)
    @HazmatTypeConverter()
    @Default(HazmatType.nonHazmat)
    HazmatType hazmatType,
  }) = _AsinData;

  factory AsinData.fromJson(Map<String, dynamic> json) =>
      _$AsinDataFromJson(json);
}

const defaultListingRestrictions = ListingRestrictions();

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

class SizeTypeConverter implements JsonConverter<SizeType, String> {
  const SizeTypeConverter();

  @override
  String toJson(SizeType object) {
    return object.name;
  }

  @override
  SizeType fromJson(String typeName) {
    switch (typeName) {
      case "small":
        return SizeType.small;
      case "big":
        return SizeType.big;
      case "moreBig":
        return SizeType.moreBig;
    }
    return SizeType.normal;
  }
}

class HazmatTypeConverter implements JsonConverter<HazmatType, String> {
  const HazmatTypeConverter();

  @override
  String toJson(HazmatType object) {
    switch (object) {
      case HazmatType.nonHazmat:
        return "";
      case HazmatType.sds:
      case HazmatType.battery:
      case HazmatType.warn:
      case HazmatType.hazmat:
      case HazmatType.unknown:
        return object.name;
    }
  }

  @override
  HazmatType fromJson(String typeName) {
    switch (typeName) {
      case "":
        return HazmatType.nonHazmat;
      case "sds":
        return HazmatType.sds;
      case "battery":
        return HazmatType.battery;
      case "warn":
        return HazmatType.warn;
      case "hazmat":
        return HazmatType.hazmat;
      case "unknown":
        return HazmatType.unknown;
    }
    return HazmatType.nonHazmat;
  }
}
