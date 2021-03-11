import 'package:amasearch/models/enums/fulfillment_channel.dart';
import 'package:amasearch/models/enums/used_sub_condition.dart';
import 'package:amasearch/models/item.dart';
import 'package:amasearch/models/item_price.dart';

const rankVariable = "{rank}";
const titleVariable = "{title}";
const usedProfitVariable = "{usedProfit}";
const newProfitVariable = "{newProfit}";

String createSpeakText({
  required String template,
  required AsinData item,
  required bool priorFba,
  required UsedSubCondition usedSubCondition,
}) {
  var newProfitText = "";
  if (item.prices!.newPrices.isEmpty) {
    newProfitText = "データなし";
  } else {
    newProfitText = _filterPrice(
      prices: item.prices!.newPrices,
      priorFba: priorFba,
    );
  }

  var usedProfitText = "";
  if (item.prices!.usedPrices.isEmpty) {
    usedProfitText = "データなし";
  } else {
    usedProfitText = _filterPrice(
      prices: item.prices!.usedPrices,
      priorFba: priorFba,
      usedSubCond: usedSubCondition,
    );
  }

  return template
      .replaceAll(rankVariable, "${item.rank}位")
      .replaceAll(titleVariable, item.title)
      .replaceAll(usedProfitVariable, usedProfitText)
      .replaceAll(newProfitVariable, newProfitText);
}

String _filterPrice({
  required List<PriceDetail> prices,
  required bool priorFba,
  UsedSubCondition? usedSubCond,
}) {
  if (usedSubCond == null || usedSubCond == UsedSubCondition.all) {
    // 新品か中古全対象の場合
    if (priorFba) {
      final fbaItem = prices.firstWhere(
        (element) => element.channel == FulfillmentChannel.amazon,
        orElse: () => prices.first,
      );
      return "${fbaItem.price}円";
    } else {
      return "${prices.first.price}円";
    }
  } else {
    // 中古でコンディション指定の場合
    final subItems =
        prices.where((element) => usedSubCond.lessEq(element.subCondition));
    if (subItems.isEmpty) {
      return "${usedSubCond.toDisplayString()}の出品はありません。";
    }
    if (priorFba) {
      final fbaItem = subItems.firstWhere(
          (element) => element.channel == FulfillmentChannel.amazon,
          orElse: () => subItems.first);
      return "${fbaItem.price}円";
    }
    return "${subItems.first.price}円";
  }
}
