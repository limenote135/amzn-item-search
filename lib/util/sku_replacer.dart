import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/models/enums/purchase_item_condition.dart';

const yearVar = "{yyyy}";
const monthVar = "{mm}";
const dayVar = "{dd}";
const asinVar = "{asin}";
const janVar = "{jan}";
const condVar = "{cond}";
const purchaseVar = "{purchasePrice}";
const sellVar = "{sellPrice}";
const profitVar = "{profit}";
const quantityVar = "{quantity}";
const breakEvenVar = "{breakEven}";

String replaceSku({
  required String format,
  required AsinData item,
  required int purchase,
  required int sell,
  required PurchaseItemCondition cond,
  required int profit,
  required int quantity,
  required bool useFba,
  required DateTime date,
  required int breakEven,
}) {
  return format
      .replaceAll(yearVar, date.year.toString())
      .replaceAll(monthVar, date.month.toString().padLeft(2, "0"))
      .replaceAll(dayVar, date.day.toString().padLeft(2, "0"))
      .replaceAll(asinVar, item.asin)
      .replaceAll(janVar, item.jan)
      .replaceAll(condVar, _conditionText(cond))
      .replaceAll(purchaseVar, (purchase).toString())
      .replaceAll(sellVar, (sell).toString())
      .replaceAll(profitVar, (profit).toString())
      .replaceAll(quantityVar, (quantity).toString())
      .replaceAll(breakEvenVar, breakEven.toString());
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
}
