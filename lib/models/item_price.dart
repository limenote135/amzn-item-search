import 'package:amasearch/models/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'enums/fulfillment_channel.dart';
import 'enums/item_condition.dart';
import 'enums/item_sub_condition.dart';
import 'fee_info.dart';

part 'item_price.freezed.dart';
part 'item_price.g.dart';

@freezed
class ItemPrices with _$ItemPrices {
  @JsonSerializable(fieldRename: FieldRename.snake)
  @HiveType(typeId: itemPricesTypeId)
  const factory ItemPrices({
    // 初期のころのデータで null で保存されている場合がある？ため、デフォルト値設定
    @HiveField(0, defaultValue: <PriceDetail>[])
    @JsonKey(name: "new_offers")
    @Default(<PriceDetail>[])
        List<PriceDetail> newPrices,
    @HiveField(1, defaultValue: <PriceDetail>[])
    @JsonKey(name: "used_offers")
    @Default(<PriceDetail>[])
        List<PriceDetail> usedPrices,
    @HiveField(2) @Default(FeeInfo()) FeeInfo feeInfo,
  }) = _ItemPrices;

  factory ItemPrices.fromJson(Map<String, dynamic> json) =>
      _$ItemPricesFromJson(json);
}

@freezed
class PriceDetail with _$PriceDetail {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    converters: [
      ItemConditionConverter(),
      ItemSubConditionConverter(),
      FulfillmentChannelConverter(),
    ],
  )
  @HiveType(typeId: priceDetailTypeId)
  const factory PriceDetail({
    @HiveField(0)
    @JsonKey(name: "condition")
    @Default(ItemCondition.newItem)
        ItemCondition itemCondition,
    @HiveField(1)
    @Default(ItemSubCondition.newItem)
        ItemSubCondition subCondition,
    @HiveField(2)
    @Default(FulfillmentChannel.merchant)
        FulfillmentChannel channel,
    @HiveField(3) @Default(0) int price,
    @HiveField(4) @Default(0) int shipping,
    @HiveField(5) @Default(0) int point,
    @HiveField(6, defaultValue: false) @Default(false) bool isCart,
  }) = _PriceDetail;

  factory PriceDetail.fromJson(Map<String, dynamic> json) =>
      _$PriceDetailFromJson(json);
}

class ItemConditionConverter implements JsonConverter<ItemCondition, String> {
  const ItemConditionConverter();

  @override
  String toJson(ItemCondition object) {
    return object.name;
  }

  @override
  ItemCondition fromJson(String json) {
    return toItemCondition(json);
  }
}

class ItemSubConditionConverter
    implements JsonConverter<ItemSubCondition, String> {
  const ItemSubConditionConverter();

  @override
  String toJson(ItemSubCondition object) {
    return object.name;
  }

  @override
  ItemSubCondition fromJson(String json) {
    return toItemSubCondition(json);
  }
}

class FulfillmentChannelConverter
    implements JsonConverter<FulfillmentChannel, String> {
  const FulfillmentChannelConverter();

  @override
  String toJson(FulfillmentChannel object) {
    return object.name;
  }

  @override
  FulfillmentChannel fromJson(String json) {
    return toFulfillmentChannel(json);
  }
}
