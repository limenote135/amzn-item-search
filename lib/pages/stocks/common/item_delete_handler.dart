import 'package:amasearch/controllers/stock_item_controller.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<bool> itemDeleteHandler({
  required BuildContext context,
  List<StockItem>? items,
  bool deleteAll = false,
  required String content,
}) async {
  final ok = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("商品の削除"),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text("OK"),
        ),
      ],
    ),
  );
  if (ok!) {
    if (deleteAll) {
      context.read(stockItemListControllerProvider.notifier).removeAll();
    } else {
      context.read(stockItemListControllerProvider.notifier).remove(items!);
    }
  }
  return ok;
}
