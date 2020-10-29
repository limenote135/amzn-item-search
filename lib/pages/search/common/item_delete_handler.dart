import 'package:amasearch/controllers/item_list_controller.dart';
import 'package:amasearch/models/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<bool> itemDeleteHandler({
  @required BuildContext context,
  List<Item> items,
  bool deleteAll = false,
  @required String content,
}) async {
  final ok = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("商品の削除"),
      content: Text(content),
      actions: [
        FlatButton(
          child: const Text("Cancel"),
          onPressed: () => Navigator.pop(context, false),
        ),
        FlatButton(
          child: const Text("OK"),
          onPressed: () => Navigator.pop(context, true),
        ),
      ],
    ),
  );
  if (ok) {
    if (deleteAll) {
      context.read(itemListControllerProvider).removeAll();
    } else {
      context.read(itemListControllerProvider).remove(items);
    }
  }
  return ok;
}
