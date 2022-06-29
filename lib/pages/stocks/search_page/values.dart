import 'package:amasearch/models/enums/listing_state.dart';
import 'package:amasearch/models/enums/product_condition.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

const keywordField = "keyword";
const listingStateField = "listingState";
const productConditionField = "productCondition";
const purchasePriceLowerField = "purchasePriceLower";
const purchasePriceUpperField = "purchasePriceUpper";
const sellPriceLowerField = "sellPriceLower";
const sellPriceUpperField = "sellPriceUpper";
const purchaseDateRangeField = "purchaseDateRange";

int? getNullableInt(FormGroup form, String field) {
  final str = form.control(field).value as String?;
  return str == null ? null : int.tryParse(str);
}

String? getNullableString(FormGroup form, String filed) {
  return form.control(filed).value as String?;
}

ListingState getListingState(FormGroup form) {
  return form.control(listingStateField).value as ListingState? ??
      ListingState.all;
}

ProductCondition getProductCondition(FormGroup form) {
  return form.control(productConditionField).value as ProductCondition? ??
      ProductCondition.all;
}

DateTimeRange? getNullableDateRange(FormGroup form, String field) {
  return form.control(field).value as DateTimeRange?;
}
