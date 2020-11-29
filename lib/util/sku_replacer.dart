import 'package:amasearch/models/enums/purchase_item_condition.dart';
import 'package:amasearch/models/item.dart';
import 'package:amasearch/models/purchase_settings.dart';
import 'package:flutter/material.dart';

const yearVar = "<yyyy>";
const monthVar = "<mm>";
const dayVar = "<dd>";
const asinVar = "<asin>";
const janVar = "<jan>";
const condVar = "<cond>";
const purchaseVar = "<purchasePrice>";
const sellVar = "<sellPrice>";
const profitVar = "<profit>";
const quantityVar = "<quantity>";
const breakEvenVar = "<breakEven>";

String replaceSku({
  @required String format,
  @required AsinData item,
  @required PurchaseSettings settings,
  int purchase,
  int sell,
  PurchaseItemCondition cond,
  int profit,
  int quantity,
}) {
  final date = DateTime.now().toLocal();
  return format
      .replaceAll(yearVar, date.year.toString())
      .replaceAll(monthVar, date.month.toString().padLeft(2, "0"))
      .replaceAll(dayVar, date.day.toString().padLeft(2, "0"))
      .replaceAll(asinVar, item.asin)
      .replaceAll(janVar, item.jan)
      .replaceAll(condVar, _conditionText(cond ?? settings.condition))
      .replaceAll(purchaseVar, (purchase ?? settings.purchasePrice).toString())
      .replaceAll(sellVar, (sell ?? settings.sellPrice).toString())
      .replaceAll(profitVar, (profit ?? settings.profit).toString())
      .replaceAll(quantityVar, (quantity ?? settings.amount).toString())
      .replaceAll(
          breakEvenVar,
          _calcBreakEven(
            purchase: purchase,
            settings: settings,
            item: item,
          ).toString());
}

String _conditionText(PurchaseItemCondition cond) {
  switch (cond) {
    case PurchaseItemCondition.newItem:
      return "N";
    case PurchaseItemCondition.usedMint:
      return "UM";
    case PurchaseItemCondition.usedVeryGood:
      return "UVG";
    case PurchaseItemCondition.usedGood:
      return "UG";
    case PurchaseItemCondition.usedAcceptable:
      return "UAC";
  }
  throw Exception("Invalid Condition: $cond");
}

int _calcBreakEven({
  @required int purchase,
  @required PurchaseSettings settings,
  @required AsinData item,
}) {
  final fbaFee = settings.useFba ? item.prices.feeInfo.fbaFee : 0;
  final purchasePrice = purchase ?? settings.purchasePrice;
  final temp = purchasePrice + fbaFee + item.prices.feeInfo.variableClosingFee;
  final breakEven = temp / (1 - item.prices.feeInfo.referralFeeRate);
  return breakEven.round();
}
