import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/events.dart';
import 'package:amasearch/controllers/search_item_controller.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<bool> itemDeleteHandler({
  required BuildContext context,
  List<SearchItem>? items,
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
      context.read(searchItemControllerProvider.notifier).removeAll();
    } else {
      context.read(searchItemControllerProvider.notifier).remove(items!);
      //TODO: 複数削除できるので、削除する個数を指定したい
      await context
          .read(analyticsControllerProvider)
          .logSingleEvent(deleteSearchHistoryEventName);
    }
  }
  return ok;
}
