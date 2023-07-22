import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/models/enums/alert_type.dart';
import 'package:amasearch/models/enums/fulfillment_channel.dart';
import 'package:amasearch/models/enums/used_sub_condition.dart';
import 'package:amasearch/models/general_settings.dart';
import 'package:amasearch/models/item_price.dart';
import 'package:amasearch/models/search_settings.dart';
import 'package:amasearch/repository/mws_category.dart';
import 'package:amasearch/util/price_util.dart';

extension AlertConditionSetExtension on AlertConditionSet {
  bool match(
    AsinData item,
    SearchSettings settings,
  ) {
    if (conditions.isEmpty ||
        (conditions.length == 1 && conditions[0].type == AlertType.condition)) {
      // 条件無しまたは、粗利条件を設定せずにコンディション条件だけ設定している場合
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
              item: item,
              cond: condition,
              priorFba: settings.priorFba,
            );
            final profit = calcProfit(
              sellPrice: detail.price,
              purchasePrice: 0,
              fee: item.prices?.feeInfo,
              useFba: settings.useFba,
              otherCost: 0,
            );

            if (profit < cond.value) {
              return false;
            }
          } else {
            // Condition 未設定の場合
            PriceDetail price;
            if (item.prices!.newPrices.isNotEmpty) {
              price = item.prices!.newPrices.first;
            } else if (item.prices!.usedPrices.isNotEmpty) {
              price = item.prices!.usedPrices.first;
            } else {
              // 中古も新品も無い場合
              return false;
            }

            final profit = calcProfit(
              sellPrice: price.price,
              purchasePrice: 0,
              fee: item.prices?.feeInfo,
              useFba: settings.useFba,
              otherCost: 0,
            );
            if (profit < cond.value) {
              return false;
            }
          }
        case AlertType.condition:
          // 利益額との組み合わせでチェックするため、ここでは何もしない
          break;
        case AlertType.rank:
          if (!(item.rank <= cond.value)) {
            return false;
          }
        case AlertType.category:
          if (!mwsCategoryIdMap.containsKey(item.category)) {
            return false;
          }
          if (cond.value != mwsCategoryIdMap[item.category]) {
            return false;
          }
        case AlertType.premium:
          if (!isPremiumPrice(item)) {
            return false;
          }
        case AlertType.noAmazon:
          if (item.sellByAmazon != false) {
            return false;
          }
        case AlertType.noNewOffer:
          if (item.prices?.newPrices.isNotEmpty ?? false) {
            return false;
          }
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
    return const PriceDetail();
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
        return const PriceDetail();
      }

      if (priorFba) {
        condPrices.firstWhere(
          (e) => e.channel == FulfillmentChannel.amazon,
          orElse: () => condPrices.first,
        );
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
