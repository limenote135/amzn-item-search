import 'dart:typed_data';

import 'package:ama_search/models/item_price.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.freezed.dart';

@freezed
abstract class Item with _$Item {
  const factory Item({
    @required String jan,
    @required String asin,
    @required int listPrice, // 参考価格
    @required String imageUrl,
    @required String title,
    @required int rank,
    @required String quantity,
    ItemPrice newPrice,
    ItemPrice usedPrice,
    Uint8List imageData,
  }) = _Item;
}
