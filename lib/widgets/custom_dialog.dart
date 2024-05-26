import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showCustomOkDialog({
  required BuildContext context,
  required Widget title,
  required Widget content,
}) async {
  if (Platform.isIOS) {
    await showCupertinoDialog<void>(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: title,
          content: content,
          actions: [
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
    return;
  } else {
    await showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: title,
          content: content,
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
