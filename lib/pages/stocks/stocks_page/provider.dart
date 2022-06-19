import 'package:amasearch/controllers/stock_item_controller.dart';
import 'package:amasearch/models/enums/item_condition.dart';
import 'package:amasearch/models/enums/item_sub_condition.dart';
import 'package:amasearch/models/enums/listing_state.dart';
import 'package:amasearch/models/enums/product_condition.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/models/stock_item_filter.dart';
import 'package:amasearch/util/util.dart';
import 'package:riverpod/riverpod.dart';

final filteredStockListProvider = Provider(
  (ref) {
    // 後ろで Iterable でメソッドチェインをするためここではアップキャストする
    // ignore: omit_local_variable_types
    Iterable<StockItem> items = ref.watch(stockItemListControllerProvider);
    final filter = ref.watch(currentStockItemFilterProvider);

    if (filter.keyword != null) {
      items = items.where((element) {
        final word = filter.keyword!;
        final title = element.item.title;
        final asin = element.item.asin.toUpperCase();
        final jan = element.item.jan;

        return title.contains(word) ||
            asin == word.toUpperCase() ||
            jan == word;
      });
    }

    if (filter.listingState != ListingState.all) {
      items = items.where(
        (element) => filter.listingState == ListingState.listings
            ? element.listingDate != null
            : element.listingDate == null,
      );
    }

    if (filter.productCondition != ProductCondition.all) {
      items = items.where((e) {
        switch (filter.productCondition) {
          case ProductCondition.all:
            return true;
          case ProductCondition.newItem:
            return e.condition == ItemCondition.newItem;
          case ProductCondition.usedAll:
            return e.condition == ItemCondition.usedItem;
          case ProductCondition.usedMint:
            return e.subCondition == ItemSubCondition.mint;
          case ProductCondition.usedVeryGood:
            return e.subCondition == ItemSubCondition.veryGood;
          case ProductCondition.usedGood:
            return e.subCondition == ItemSubCondition.good;
          case ProductCondition.usedAcceptable:
            return e.subCondition == ItemSubCondition.acceptable;
        }
      });
    }

    if (filter.purchasePriceLower != null) {
      items = items.where(
        (element) => element.purchasePrice >= filter.purchasePriceLower!,
      );
    }
    if (filter.purchasePriceUpper != null) {
      items = items.where(
        (element) => element.purchasePrice <= filter.purchasePriceUpper!,
      );
    }

    if (filter.sellPriceLower != null) {
      items = items.where(
        (element) => element.sellPrice >= filter.sellPriceLower!,
      );
    }
    if (filter.sellPriceUpper != null) {
      items = items.where(
        (element) => element.sellPrice <= filter.sellPriceUpper!,
      );
    }

    if (filter.purchaseDateRange != null) {
      items = items.where((element) {
        final start = currentTimeString(time: filter.purchaseDateRange!.start);
        final end = currentTimeString(time: filter.purchaseDateRange!.end);
        return element.purchaseDate.compareTo(start) >= 0 &&
            element.purchaseDate.compareTo(end) <= 0;
      });
    }

    return items.toList();
  },
);
