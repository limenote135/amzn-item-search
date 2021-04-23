import 'package:amasearch/models/enums/alert_type.dart';
import 'package:amasearch/models/enums/fulfillment_channel.dart';
import 'package:amasearch/models/enums/used_sub_condition.dart';
import 'package:amasearch/models/general_settings.dart';
import 'package:amasearch/models/item_price.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/models/search_settings.dart';
import 'package:amasearch/repository/mws_category.dart';
import 'package:amasearch/util/price_util.dart';

extension AlertConditionSetExtension on AlertConditionSet {
  bool match(AsinData item, SearchSettings settings) {
    if (conditions.isEmpty) {
      return false;
    }
    for (final cond in conditions) {
      switch (cond.type) {
        case AlertType.profit:
          if (item.prices == null) {
            return false;
          }
          final typeConditions = conditions
              .where((element) => element.type == AlertType.condition)
              .toList();
          if (typeConditions.isNotEmpty) {
            //　Condition が設定してある場合
            final condition =
                AlertOfferCondition.values[typeConditions.first.value];

            final detail = _getPriceDetail(
                item: item, cond: condition, priorFba: settings.priorFba);
            final profit = calcProfit(
                sellPrice: detail.price,
                purchasePrice: 0,
                fee: item.prices?.feeInfo,
                useFba: settings.useFba);

            if (profit <= cond.value) {
              return false;
            }
          } else {
            // Condition 未設定の場合
          }
          break;
        case AlertType.rank:
          if (!(item.rank <= cond.value)) {
            return false;
          }
          break;
        case AlertType.category:
          if (!mwsCategoryIdMap.containsKey(item.category)) {
            return false;
          }
          if (cond.value != mwsCategoryIdMap[item.category]) {
            return false;
          }
          break;
        case AlertType.condition:
          // TODO: Handle this case.
          break;
        case AlertType.premium:
          if (!isPremiumPrice(item)) {
            return false;
          }
          break;
        case AlertType.noAmazon:
          // TODO: Handle this case.
          break;
        case AlertType.noNewOffer:
          if (item.prices?.newPrices.isNotEmpty ?? false) {
            return false;
          }
          break;
      }
    }
    return true;
  }
}

PriceDetail _getPriceDetail({
  required AsinData item,
  required AlertOfferCondition cond,
  required bool priorFba,
}) {
  final prices = _getConditionPrices(item: item, condition: cond);
  if (prices.isEmpty) {
    return const PriceDetail(price: 0, shipping: 0);
  }
  switch (cond) {
    case AlertOfferCondition.newItem:
    case AlertOfferCondition.usedAll:
      if (priorFba) {
        return prices.firstWhere(
          (e) => e.channel == FulfillmentChannel.amazon,
          orElse: () => prices.first,
        );
      }
      return prices.first;
    case AlertOfferCondition.usedMint:
    case AlertOfferCondition.usedVeryGood:
    case AlertOfferCondition.usedGood:
    case AlertOfferCondition.usedAcceptable:
      final subCond = cond.toUsedSubCondition();
      final condPrices =
          prices.where((element) => subCond.lessEq(element.subCondition));
      if (condPrices.isEmpty) {
        return const PriceDetail(price: 0, shipping: 0);
      }

      if (priorFba) {
        condPrices.firstWhere((e) => e.channel == FulfillmentChannel.amazon,
            orElse: () => condPrices.first);
      }
      return condPrices.first;
  }
}

List<PriceDetail> _getConditionPrices({
  required AsinData item,
  required AlertOfferCondition condition,
}) {
  switch (condition) {
    case AlertOfferCondition.newItem:
      return item.prices?.newPrices ?? [];
    case AlertOfferCondition.usedAll:
    case AlertOfferCondition.usedMint:
    case AlertOfferCondition.usedVeryGood:
    case AlertOfferCondition.usedGood:
    case AlertOfferCondition.usedAcceptable:
      return item.prices?.usedPrices ?? [];
  }
}
