import 'dart:typed_data';

import 'package:amasearch/models/constants.dart';
import 'package:amasearch/models/item_price.dart';
import 'package:amasearch/repository/mws.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/all.dart';

part 'item.freezed.dart';
part 'item.g.dart';

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
  @HiveType(typeId: dbItemTypeId)
  const factory Item({
    @HiveField(0) @required String searchDate,
    @HiveField(1) @required String jan,
    @HiveField(2) @Default(<AsinData>[]) List<AsinData> asins,
  }) = _Item;
}

@freezed
abstract class AsinData with _$AsinData {
  @HiveType(typeId: dbAsinDataTypeId)
  const factory AsinData({
    @HiveField(0) @required String jan,
    @HiveField(1) @required String asin,
    @HiveField(2) @required int listPrice, // 参考価格
    @HiveField(3) @required String imageUrl,
    @HiveField(4) @required String title,
    @HiveField(5) @required int rank,
    @HiveField(6) @required String quantity,
    @HiveField(7) ItemPrices prices,
    @HiveField(8) Uint8List imageData,
  }) = _AsinData;
}
