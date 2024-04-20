import 'package:amasearch/controllers/keep_item_controller.dart';
import 'package:amasearch/models/enums/fulfillment_channel.dart';
import 'package:amasearch/models/keep_item.dart';
import 'package:amasearch/models/keep_item_filter.dart';
import 'package:riverpod/riverpod.dart';

final filteredKeepListProvider = Provider(
  (ref) {
    // 後ろで Iterable でメソッドチェインをするためここではアップキャストする
    // ignore: omit_local_variable_types
    Iterable<KeepItem> items = ref.watch(keepItemListControllerProvider);
    final filter = ref.watch(currentKeepItemFilterProvider);

    if (filter.keyword != null) {
      items = items.where((element) {
        final word = filter.keyword!.toUpperCase();
        final title = element.item.title.toUpperCase();
        final asin = element.item.asin.toUpperCase();
        final jan = element.item.jan;
        final memo = element.memo.toUpperCase();

        return title.contains(word) ||
            asin == word ||
            jan == word ||
            memo.contains(word);
      });
    }

    if (filter.rankLower != null) {
      items = items.where(
        (element) => element.item.rank >= filter.rankLower!,
      );
    }
    if (filter.rankUpper != null) {
      items = items.where(
        (element) => element.item.rank <= filter.rankUpper!,
      );
    }

    if (filter.newPriceLower != null) {
      items = items.where((element) {
        final newPrices = element.item.prices?.newPrices ?? [];
        final targetPrices = filter.priorFba
            ? newPrices.where((e) => e.channel == FulfillmentChannel.amazon)
            : newPrices;
        return targetPrices.any((e) => e.price >= filter.newPriceLower!);
      });
    }
    if (filter.newPriceUpper != null) {
      items = items.where((element) {
        final newPrices = element.item.prices?.newPrices ?? [];
        final targetPrices = filter.priorFba
            ? newPrices.where((e) => e.channel == FulfillmentChannel.amazon)
            : newPrices;
        return targetPrices.any((e) => e.price <= filter.newPriceUpper!);
      });
    }

    if (filter.usedPriceLower != null) {
      items = items.where((element) {
        final usedPrices = element.item.prices?.usedPrices ?? [];
        final targetPrices = filter.priorFba
            ? usedPrices.where((e) => e.channel == FulfillmentChannel.amazon)
            : usedPrices;
        return targetPrices.any((e) => e.price >= filter.usedPriceLower!);
      });
    }
    if (filter.usedPriceUpper != null) {
      items = items.where((element) {
        final usedPrices = element.item.prices?.usedPrices ?? [];
        final targetPrices = filter.priorFba
            ? usedPrices.where((e) => e.channel == FulfillmentChannel.amazon)
            : usedPrices;
        return targetPrices.any((e) => e.price <= filter.usedPriceUpper!);
      });
    }

    if (filter.keepDateRange != null) {
      items = items.where((element) {
        final start = filter.keepDateRange!.start;
        final end = filter.keepDateRange!.end;
        final date = DateTime.parse(element.keepDate).toLocal();

        // start.compareTo(date) は date と start が同じなら 0 を返す
        // start より date があとなら -1 を返す
        return start.compareTo(date) <= 0 && date.isBefore(end);
      });
    }

    return items.toList();
  },
);

final filterCountProvider = Provider((ref) {
  final filter = ref.watch(currentKeepItemFilterProvider);
  var count = 0;
  if (filter.keyword != null && filter.keyword != "") {
    count++;
  }
  if (filter.rankLower != null || filter.rankUpper != null) {
    count++;
  }
  if (!filter.priorFba) {
    count++;
  }
  if (filter.newPriceLower != null || filter.newPriceUpper != null) {
    count++;
  }
  if (filter.usedPriceLower != null || filter.usedPriceUpper != null) {
    count++;
  }
  if (filter.keepDateRange != null) {
    count++;
  }
  return count;
});
