import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

const keywordField = "keyword";
const rankLowerField = "rankLower";
const rankUpperField = "rankUpper";
const priorFbaField = "priorFba";
const newPriceLowerField = "newPriceLower";
const newPriceUpperField = "newPriceUpper";
const usedPriceLowerField = "usedPriceLower";
const usedPriceUpperField = "usedPriceUpper";
const keepDateRangeField = "keepDateRange";

String? getNullableString(FormGroup form, String filed) {
  return form.control(filed).value as String?;
}

int? getNullableInt(FormGroup form, String field) {
  final str = form.control(field).value as String?;
  return str == null ? null : int.tryParse(str);
}

DateTimeRange? getNullableDateRange(FormGroup form, String field) {
  return form.control(field).value as DateTimeRange?;
}
