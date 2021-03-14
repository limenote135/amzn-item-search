import 'package:amasearch/models/fee_info.dart';
import 'package:amasearch/models/item.dart';
import 'package:flutter/material.dart';

import 'formatter.dart';

// 指定した価格から手数料を引いた粗利益を計算し、文字列として返します。
// FBA 手数料が不明な場合、"-α" として表示します。
String calcProfitText(int price, FeeInfo fee, {@required bool useFba}) {
  if (fee == null) {
    return " - ";
  }
  if (fee.referralFeeRate == null || fee.variableClosingFee == null) {
    return "0";
  }
  final profit =
      calcProfit(sellPrice: price, purchasePrice: 0, fee: fee, useFba: useFba);

  if (fee.fbaFee == -1) {
    return "${numberFormatter.format(profit)} - α";
  } else {
    return numberFormatter.format(profit);
  }
}

// 販売価格、仕入れ価格、手数料から利益を計算します。
// FBA 手数料が不明の場合、0円として計算します。
int calcProfit({
  @required int sellPrice,
  @required int purchasePrice,
  @required FeeInfo fee,
  @required bool useFba,
}) {
  if (fee.referralFeeRate == null || fee.variableClosingFee == null) {
    return 0;
  }

  final referralFee = (sellPrice * fee.referralFeeRate).round();
  final fbaFee = useFba && fee.fbaFee != -1 ? fee.fbaFee : 0;
  final totalFee = referralFee + fee.variableClosingFee + fbaFee;
  final profit = sellPrice - purchasePrice - totalFee;

  return profit;
}

bool isPremiumPrice(AsinData item) {
  if (item.listPrice == 0) {
    return false;
  }
  if (item.prices == null) {
    return false;
  }
  if (item.prices.newPrices.isNotEmpty) {
    return item.prices.newPrices.first.price > item.listPrice;
  }
  if (item.prices.usedPrices.isNotEmpty) {
    return item.prices.usedPrices.first.price > item.listPrice;
  }
  return false;
}

// 販売価格から目標の利益率を達成する仕入れ額を計算
int calcTargetPrice({
  @required int sellPrice,
  @required FeeInfo feeInfo,
  @required int targetRate,
  @required int minProfit,
  @required bool useFba,
}) {
  final rawProfit = sellPrice * (targetRate / 100);
  final min = minProfit > rawProfit ? minProfit : rawProfit;
  final price = sellPrice * (1 - feeInfo.referralFeeRate) - min;
  final fbaFee = useFba && feeInfo.fbaFee != -1 ? feeInfo.fbaFee : 0;

  return (price - feeInfo.variableClosingFee - fbaFee).round();
}

int calcBreakEven({
  @required int purchase,
  @required bool useFba,
  @required FeeInfo feeInfo,
}) {
  final fbaFee = useFba && feeInfo.fbaFee != -1 ? feeInfo.fbaFee : 0;
  final temp = purchase + fbaFee + feeInfo.variableClosingFee;
  final breakEven = temp / (1 - feeInfo.referralFeeRate);
  return breakEven.round();
}
