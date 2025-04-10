import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/models/enums/fulfillment_channel.dart';
import 'package:amasearch/models/enums/item_condition.dart';
import 'package:amasearch/models/enums/used_sub_condition.dart';
import 'package:amasearch/models/item_price.dart';

PriceDetail getPriceDetail({
  required AsinData item,
  required ItemCondition condition,
  required UsedSubCondition subCond,
  required bool priorFba,
}) {
  final prices = _getConditionPrices(item: item, condition: condition);

  if (prices.isEmpty) {
    return const PriceDetail();
  }
  switch (condition) {
    case ItemCondition.newItem:
      if (priorFba) {
        return prices.firstWhere(
          (e) => e.channel == FulfillmentChannel.amazon,
          orElse: () => prices.first,
        );
      }
      return prices.first;
    case ItemCondition.usedItem:
      final conditionPrices = subCond == UsedSubCondition.all
          ? prices
          : prices.where((e) => subCond.lessEq(e.subCondition));

      if (conditionPrices.isEmpty) {
        return const PriceDetail();
      }

      if (priorFba) {
        return conditionPrices.firstWhere(
          (e) => e.channel == FulfillmentChannel.amazon,
          orElse: () => conditionPrices.first,
        );
      }
      return conditionPrices.first;
  }
}

List<PriceDetail> _getConditionPrices({
  required AsinData item,
  required ItemCondition condition,
}) {
  switch (condition) {
    case ItemCondition.newItem:
      return item.prices?.newPrices ?? [];
    case ItemCondition.usedItem:
      return item.prices?.usedPrices ?? [];
  }
}
