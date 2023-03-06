import 'package:amasearch/models/enums/item_condition.dart';
import 'package:amasearch/models/enums/item_sub_condition.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'listing_item.freezed.dart';
part 'listing_item.g.dart';

@freezed
class ListingItem with _$ListingItem {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ListingItem({
    required String sku,
    required String asin,
    required int sellPrice,
    required int amount,
    required ItemCondition condition,
    required ItemSubCondition subCondition,
    required bool useFba,
    required String conditionText,
    @Default(<String>[]) List<String> images,
  }) = _ListingItem;

  factory ListingItem.fromJson(Map<String, dynamic> json) =>
      _$ListingItemFromJson(json);
}
