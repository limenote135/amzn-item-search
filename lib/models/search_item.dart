import 'package:amasearch/models/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'asin_data.dart';

part 'search_item.freezed.dart';
part 'search_item.g.dart';

final currentSearchItemProvider =
    Provider<SearchItem>((_) => throw UnimplementedError());

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
