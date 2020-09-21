import 'dart:typed_data';

import 'package:ama_search/models/item_price.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.freezed.dart';

@freezed
abstract class Item with _$Item {
  const factory Item({
    @required String searchDate,
    @required String jan,
    @Default(<AsinData>[]) List<AsinData> asins,
  }) = _Item;
}

@freezed
abstract class AsinData with _$AsinData {
  const factory AsinData({
    @required String jan,
    @required String asin,
    @required int listPrice, // 参考価格
    @required String imageUrl,
    @required String title,
    @required int rank,
    @required String quantity,
    ItemPrices prices,
    Uint8List imageData,
  }) = _AsinData;
}
