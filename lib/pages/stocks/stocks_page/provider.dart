import 'package:amasearch/controllers/stock_item_controller.dart';
import 'package:amasearch/models/enums/item_condition.dart';
import 'package:amasearch/models/enums/item_sub_condition.dart';
import 'package:amasearch/models/enums/stock_item_search_conditions.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/models/stock_item_filter.dart';
import 'package:riverpod/riverpod.dart';

final filteredStockListProvider = Provider(
  (ref) {
    // 後ろで Iterable でメソッドチェインをするためここではアップキャストする
    // ignore: omit_local_variable_types
    Iterable<StockItem> items = ref.watch(stockItemListControllerProvider);
    final filter = ref.watch(currentStockItemFilterProvider);

    if (filter.keyword != null) {
      items = items.where((element) {
        final word = filter.keyword!.toUpperCase();
        final title = element.item.title.toUpperCase();
        final asin = element.item.asin.toUpperCase();
        final jan = element.item.jan;
        final sku = element.sku.toUpperCase();

        return title.contains(word) ||
            asin == word ||
            jan == word ||
            sku.contains(word);
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

    if (filter.channel != FulfilmentChannel.all) {
      items = items.where((e) {
        switch (filter.channel) {
          case FulfilmentChannel.all:
            return true;
          case FulfilmentChannel.amazon:
            return e.useFba;
          case FulfilmentChannel.merchant:
            return !e.useFba;
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
        final start = filter.purchaseDateRange!.start;
        final end = filter.purchaseDateRange!.end;
        final date = DateTime.parse(element.purchaseDate).toLocal();

        // start.compareTo(date) は date と start が同じなら 0 を返す
        // start より date があとなら -1 を返す
        return start.compareTo(date) <= 0 && date.isBefore(end);
      });
    }

    if (filter.retailer != null) {
      items = items.where((element) {
        final word = filter.retailer!;
        return element.retailer.contains(word);
      });
    }
    return items.toList();
  },
);

final filterCountProvider = Provider((ref) {
  final filter = ref.watch(currentStockItemFilterProvider);
  var count = 0;
  if (filter.keyword != null && filter.keyword != "") {
    count++;
  }
  if (filter.listingState != ListingState.all) {
    count++;
  }
  if (filter.productCondition != ProductCondition.all) {
    count++;
  }
  if (filter.purchasePriceUpper != null || filter.purchasePriceLower != null) {
    count++;
  }
  if (filter.sellPriceLower != null || filter.sellPriceUpper != null) {
    count++;
  }
  if (filter.purchaseDateRange != null) {
    count++;
  }
  if (filter.channel != FulfilmentChannel.all) {
    count++;
  }
  if (filter.retailer != null && filter.retailer != "") {
    count++;
  }
  return count;
});
