import 'dart:typed_data';

import 'package:amasearch/models/item_price.dart';
import 'package:amasearch/repository/mws.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/all.dart';

part 'item.freezed.dart';

final currentItemFutureProvider = ScopedProvider<FutureProvider<Item>>(null);

final currentAsinDataProvider = ScopedProvider<AsinData>(null);

final currentAsinListProvider = ScopedProvider<List<AsinData>>(null);

final currentAsinCountProvider = ScopedProvider<int>((_) => 1);

final currentItemProvider = ScopedProvider<Item>(null);

final itemFutureProvider =
    FutureProvider.family<Item, String>((ref, code) async {
  final mws = ref.read(mwsRepositoryProvider);
  final resp = await mws.getMatchingProductForID(code);

  if (resp.items.isEmpty) {
    return Item(
        searchDate: DateTime.now().toUtc().toIso8601String(),
        jan: code,
        asins: []);
  }

  final item = resp.items.first;
  final asin = item.asin;

  final prices = await ref.read(itemPricesFutureProvider(asin).future);

  final ret = [
    item.copyWith(
      prices: prices,
    ),
    ...resp.items.skip(1),
  ];
  return Item(
    searchDate: DateTime.now().toUtc().toIso8601String(),
    jan: code,
    asins: ret,
  );
});

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
