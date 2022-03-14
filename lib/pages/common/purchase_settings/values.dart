import 'package:amasearch/models/enums/purchase_item_condition.dart';
import 'package:amasearch/util/util.dart';
import 'package:reactive_forms/reactive_forms.dart';

const purchasePriceField = "purchasePrice";
const sellPriceField = "sellPrice";
const useFbaField = "useFba";
const quantityField = "quantity";
const conditionField = "condition";
const retailerField = "retailer";
const purchaseDateField = "purchaseField";
const autogenSkuField = "autogenSku";
const skuField = "sku";
const memoField = "memo";

String getString(AbstractControl<dynamic> form, String field) {
  final f = form as FormGroup;
  switch (field) {
    case purchaseDateField:
      {
        final date = f.control(purchaseDateField).value as DateTime?;
        return currentTimeString(time: date);
      }
    case retailerField:
      return f.control(retailerField).value as String;
    case skuField:
      return f.control(skuField).value as String;
    case memoField:
      return f.control(memoField).value as String;
  }
  throw Exception("Invalid field: $field");
}

int getInt(AbstractControl<dynamic> form, String field) {
  final f = form as FormGroup;
  switch (field) {
    case purchasePriceField:
      {
        final purchase = f.control(purchasePriceField).value as String? ?? "";
        final price = int.tryParse(purchase);
        return price ?? 0;
      }
    case sellPriceField:
      return f.control(sellPriceField).value as int? ?? 0;
    case quantityField:
      return f.control(quantityField).value as int? ?? 0;
  }
  throw Exception("Invalid field: $field");
}

bool getBool(AbstractControl<dynamic> form, String field) {
  final f = form as FormGroup;
  switch (field) {
    case useFbaField:
      return f.control(useFbaField).value as bool;
  }
  throw Exception("Invalid field: $field");
}

PurchaseItemCondition getCondition(AbstractControl<dynamic> form) {
  final f = form as FormGroup;
  return f.control(conditionField).value as PurchaseItemCondition;
}

DateTime getPurchaseDate(AbstractControl<dynamic> form) {
  final f = form as FormGroup;
  return f.control(purchaseDateField).value as DateTime;
}
