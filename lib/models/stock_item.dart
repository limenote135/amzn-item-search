import 'package:amasearch/models/item.dart';
import 'package:amasearch/models/item_condition.dart';
import 'package:amasearch/models/item_sub_condition.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_item.freezed.dart';

@freezed
abstract class StockItem with _$StockItem {
  const factory StockItem({
    @required int purchasePrice,
    @required int sellPrice,
    @required bool useFba,
    @required int profitPerItem,
    @required int amount,
    @required ItemCondition condition,
    @required ItemSubCondition subCondition,
    @required String sku,
    @required String memo,
    @required String purchaseDate,
    @required AsinData item,
  }) = _StockItem;
}
