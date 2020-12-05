import 'package:amasearch/models/item.dart';
import 'package:flutter/material.dart';

const rankVariable = "{rank}";
const titleVariable = "{title}";
const usedProfitVariable = "{usedProfit}";
const newProfitVariable = "{newProfit}";

String createSpeakText({@required String template, @required AsinData item}) {
  var newProfitText = "";
  if (item.prices.newPrices == null || item.prices.newPrices.isEmpty) {
    newProfitText = "データなし";
  } else {
    newProfitText = "${item.prices.newPrices.first.price}"; // TODO:
  }

  var usedProfitText = "";
  if (item.prices.usedPrices == null || item.prices.usedPrices.isEmpty) {
    usedProfitText = "データなし";
  } else {
    usedProfitText = "${item.prices.usedPrices.first.price}"; // TODO:
  }

  return template
      .replaceAll(rankVariable, "${item.rank}")
      .replaceAll(titleVariable, item.title)
      .replaceAll(usedProfitVariable, usedProfitText)
      .replaceAll(newProfitVariable, newProfitText);
}
