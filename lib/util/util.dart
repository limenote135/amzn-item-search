import 'package:ama_search/models/fee_info.dart';
import 'package:flutter/material.dart';

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
    return "$selfShip";
  }

  if (fee.fbaFee == -1) {
    return "$selfShip-α";
  } else {
    return "${selfShip - fee.fbaFee}";
  }
}
