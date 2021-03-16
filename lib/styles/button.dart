import 'package:amasearch/util/util.dart';
import 'package:flutter/material.dart';

ButtonStyle? flatButtonStyle(BuildContext context) {
  return isDark(context) ? TextButton.styleFrom(primary: Colors.white) : null;
}

ButtonStyle? raisedButtonStyle(BuildContext context) {
  return isDark(context)
      ? null
      : ElevatedButton.styleFrom(
          onPrimary: Colors.black87,
          primary: Colors.grey[300],
        );
}
