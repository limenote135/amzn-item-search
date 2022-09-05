import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/models/enums/fulfillment_channel.dart';
import 'package:amasearch/models/enums/used_sub_condition.dart';
import 'package:amasearch/models/fee_info.dart';
import 'package:amasearch/models/item_price.dart';
import 'package:amasearch/util/price_util.dart';

import 'variable_format.dart';

String createSpeakText({
  required String template,
  required AsinData item,
  required bool priorFba,
  required bool useFba,
  required UsedSubCondition usedSubCondition,
}) {
  var newProfitText = "";
  final prices = item.prices;
  if (prices == null || prices.newPrices.isEmpty) {
    newProfitText = "データなし";
  } else {
    newProfitText = _filterPrice(
      prices: prices.newPrices,
      fee: prices.feeInfo,
      priorFba: priorFba,
      useFba: useFba,
    );
  }

  var usedProfitText = "";
  if (prices == null || prices.usedPrices.isEmpty) {
    usedProfitText = "データなし";
  } else {
    usedProfitText = _filterPrice(
      prices: prices.usedPrices,
      fee: prices.feeInfo,
      priorFba: priorFba,
      useFba: useFba,
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
  required FeeInfo? fee,
  required bool priorFba,
  required bool useFba,
  UsedSubCondition? usedSubCond, // 新品の場合は null になる
}) {
  if (usedSubCond == null || usedSubCond == UsedSubCondition.all) {
    // 新品か中古全対象の場合
    if (priorFba) {
      final fbaItem = prices.firstWhere(
        (element) => element.channel == FulfillmentChannel.amazon,
        orElse: () => prices.first,
      );
      return _calcProfitSpeakText(
        listPrice: fbaItem.price,
        fee: fee,
        useFba: useFba,
      );
    } else {
      return _calcProfitSpeakText(
        listPrice: prices.first.price,
        fee: fee,
        useFba: useFba,
      );
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
        orElse: () => subItems.first,
      );
      return _calcProfitSpeakText(
        listPrice: fbaItem.price,
        fee: fee,
        useFba: useFba,
      );
    }
    return _calcProfitSpeakText(
      listPrice: subItems.first.price,
      fee: fee,
      useFba: useFba,
    );
  }
}

String _calcProfitSpeakText({
  required int listPrice,
  required FeeInfo? fee,
  required bool useFba,
}) {
  final profit = calcProfit(
    sellPrice: listPrice,
    purchasePrice: 0,
    fee: fee,
    useFba: useFba,
    otherCost: 0,
  );
  if (profit == 0) {
    return "$listPrice円";
  }
  if (profit < 0) {
    return "マイナス${profit * -1}円";
  }
  return "$profit円";
}
