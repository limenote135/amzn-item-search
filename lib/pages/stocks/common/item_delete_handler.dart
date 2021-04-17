import 'package:adaptive_dialog/adaptive_dialog.dart';
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
  final ret = await showOkCancelAlertDialog(
    context: context,
    title: "商品の削除",
    message: content,
    isDestructiveAction: true,
  );
  final ok = ret == OkCancelResult.ok;
  if (ok) {
    if (deleteAll) {
      context.read(stockItemListControllerProvider.notifier).removeAll();
    } else {
      context.read(stockItemListControllerProvider.notifier).remove(items!);
    }
  }
  return ok;
}
