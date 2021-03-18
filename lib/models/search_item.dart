import 'dart:typed_data';

import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/controllers/item_controller.dart';
import 'package:amasearch/controllers/search_settings_controller.dart';
import 'package:amasearch/models/constants.dart';
import 'package:amasearch/models/item_price.dart';
import 'package:amasearch/models/mws_category.dart';
import 'package:amasearch/repository/mws.dart';
import 'package:amasearch/util/read_aloud_util.dart';
import 'package:amasearch/util/text_to_speech.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'search_item.freezed.dart';
part 'search_item.g.dart';

final currentItemFutureProvider =
    ScopedProvider<FutureProvider<StateNotifierProvider<ItemController>>>(null);

final currentAsinDataProvider = ScopedProvider<AsinData>(null);

final currentAsinListProvider = ScopedProvider<List<AsinData>>(null);

final currentAsinCountProvider = ScopedProvider<int>((_) => 1);

final currentItemControllerProvider =
    ScopedProvider<StateNotifierProvider<ItemController>>(null);

final itemFutureProvider =
    FutureProvider.family<StateNotifierProvider<ItemController>, String>(
        (ref, code) async {
  final settings = ref.read(generalSettingsControllerProvider.state);
  final tts = ref.read(ttsProvider);
  final result = await ref.watch(itemFutureProviderImpl(code).future);

  if (settings.enableReadAloud) {
    final data = ref.read(result.state);
    if (data.asins.isEmpty) {
      tts.speak("見つかりませんでした。");
    } else {
      final template = settings.readAloudPatterns[settings.patternIndex];
      final search = ref.read(searchSettingsControllerProvider.state);
      tts.speak(createSpeakText(
        template: template.pattern,
        item: data.asins.first,
        priorFba: search.priorFba,
        usedSubCondition: search.usedSubCondition,
      ));
    }
  }
  return result;
});

final itemFutureProviderImpl =
    FutureProvider.family<StateNotifierProvider<ItemController>, String>(
        (ref, code) async {
  final mws = ref.read(mwsRepositoryProvider);
  final resp = await mws.getProductById(code);

  if (resp.items.isEmpty) {
    return itemControllerProvider(
      SearchItem(
        searchDate: DateTime.now().toUtc().toIso8601String(),
        jan: code,
        asins: [],
      ),
    );
  }

  return itemControllerProvider(
    SearchItem(
      searchDate: DateTime.now().toUtc().toIso8601String(),
      jan: code,
      asins: resp.items,
    ),
  );
});

@freezed
class SearchItem with _$SearchItem {
  @HiveType(typeId: itemTypeId)
  const factory SearchItem({
    @HiveField(0) required String searchDate,
    @HiveField(1) required String jan,
    @HiveField(2) @Default(<AsinData>[]) List<AsinData> asins,
  }) = _SearchItem;
}

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
    @HiveField(9) @ItemCategoryConverter() required String category,
  }) = _AsinData;

  factory AsinData.fromJson(Map<String, dynamic> json) =>
      _$AsinDataFromJson(json);
}

class ItemCategoryConverter implements JsonConverter<String, String?> {
  const ItemCategoryConverter();

  @override
  String? toJson(String object) {
    return object; // JSON にするときは日本語のカテゴリを使う
  }

  @override
  String fromJson(String? json) {
    if (json == null) {
      return "不明";
    }
    if (mwsCategoryMap.containsKey(json)) {
      return mwsCategoryMap[json]!;
    }
    return json;
  }
}
