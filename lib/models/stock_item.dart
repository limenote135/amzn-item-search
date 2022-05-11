import 'package:amasearch/models/constants.dart';
import 'package:amasearch/models/listing_item.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'enums/item_condition.dart';
import 'enums/item_sub_condition.dart';

part 'stock_item.freezed.dart';
part 'stock_item.g.dart';

final currentStockItemProvider =
    Provider<StockItem>((_) => throw UnimplementedError());

@freezed
class StockItem with _$StockItem {
  @HiveType(typeId: stockItemTypeId)
  const factory StockItem({
    @HiveField(0) required String purchaseDate,
    @HiveField(1) @Default(0) int purchasePrice,
    @HiveField(2) @Default(0) int sellPrice,
    @HiveField(3) @Default(true) bool useFba,
    @HiveField(4) @Default(0) int profitPerItem,
    @HiveField(5) @Default(1) int amount,
    @HiveField(6) @Default(ItemCondition.newItem) ItemCondition condition,
    @HiveField(7)
    @Default(ItemSubCondition.newItem)
        ItemSubCondition subCondition,
    @HiveField(8) @Default("") String sku,
    @HiveField(9) @Default("") String memo,
    @HiveField(10) required AsinData item,
    @HiveField(11, defaultValue: "") @Default("") String retailer,
    // 主キー
    @HiveField(12, defaultValue: "") required String id,
    // マイグレーションのために -1 にする(-1 の場合は要マイグレーション)
    @HiveField(13, defaultValue: -1) @Default(0) int breakEven,
    @HiveField(14) String? listingDate,
    // 仕入れ確定した後はデフォルト false とするが、仕入れ時にはデフォルト true で、
    // 仕入れ画面で切り替えられるように、永続化はしないがメンバとして値を持っておく
    @Default(false) bool autogenSku,
    @HiveField(15, defaultValue: "") @Default("") String conditionText,
    @HiveField(16, defaultValue: 0) @Default(0) int otherCost,
  }) = _StockItem;
}

extension StockItemExtention on StockItem {
  ListingItem toListingItem() {
    return ListingItem(
      sku: sku,
      asin: item.asin,
      sellPrice: sellPrice,
      amount: amount,
      condition: condition,
      subCondition: subCondition,
      useFba: useFba,
      conditionText: conditionText,
    );
  }
}
