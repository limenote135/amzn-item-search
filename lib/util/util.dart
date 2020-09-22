import 'package:ama_search/models/fee_info.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final numberFormatter = NumberFormat("#,##0");

void unfocus() {
  FocusManager.instance.primaryFocus?.unfocus();
}

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
