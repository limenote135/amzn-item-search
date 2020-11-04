import 'package:amasearch/models/fee_info.dart';
import 'package:amasearch/models/item.dart';
import 'package:flutter/material.dart';

import 'formatter.dart';

String calcProfit(int price, FeeInfo fee, {@required bool useFba}) {
  if (fee == null) {
    return " - ";
  }
  if (fee.referralFeeRate == null || fee.variableClosingFee == null) {
    return "0";
  }

  final referralFee = (price * fee.referralFeeRate).round();
  final selfShip = price - referralFee - fee.variableClosingFee;
  if (!useFba) {
    return numberFormatter.format(selfShip);
  }

  if (fee.fbaFee == -1) {
    return "${numberFormatter.format(selfShip)}-α";
  } else {
    return numberFormatter.format(selfShip - fee.fbaFee);
  }
}

bool isPremiumPrice(AsinData item) {
  if (item.listPrice == 0) {
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
  @required bool useFba,
}) {
  final price = sellPrice * (1 - feeInfo.referralFeeRate - targetRate / 100);
  final fbaFee = useFba && feeInfo.fbaFee != -1 ? feeInfo.fbaFee : 0;

  return (price - feeInfo.variableClosingFee - fbaFee).round();
}
