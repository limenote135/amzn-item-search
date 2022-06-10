import 'package:reactive_forms/reactive_forms.dart';

const validationMessagePositiveNumberOrEmpty = "positiveNumberOrEmpty";

Map<String, dynamic>? positiveNumberOrEmpty(AbstractControl<dynamic> control) {
  if (control.value == null) {
    return null;
  }

  if (control.value is String) {
    if (control.value == "") {
      return null;
    }

    final val = int.tryParse(control.value as String);
    if (val != null && val >= 0) {
      return null;
    }
    return <String, dynamic>{validationMessagePositiveNumberOrEmpty: false};
  }
  return <String, dynamic>{validationMessagePositiveNumberOrEmpty: false};
}
