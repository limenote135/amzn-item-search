import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/events.dart';
import 'package:amasearch/controllers/stock_item_controller.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/cloud_functions.dart';
import 'package:amasearch/util/error_report.dart';
import 'package:amasearch/util/listings.dart';
import 'package:amasearch/util/review.dart';
import 'package:amasearch/util/util.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart';

import 'common.dart';

Future<void> callListings(
  BuildContext context,
  WidgetRef ref,
  List<StockItem> selected,
) async {
  final user = await ref.read(authStateChangesProvider.future);

  final isOk = await showOkCancelAlertDialog(
    context: context,
    title: "Amazonへ出品登録",
    message: "${selected.length}件の商品を出品登録します",
  );

  if (isOk != OkCancelResult.ok) {
    return;
  }

  try {
    await EasyLoading.show(status: "出品処理中...");
    final items = selected.map((e) => e.toListingItem()).toList();
    final file = await createListingsFile(items);
    final filename = basename(file.path);
    final gcsPath =
        "Users/${user!.uid}/Listings/$listingsFileVersion/$filename";
    try {
      await FirebaseStorage.instance.ref(gcsPath).putFile(file);
    } on FirebaseException catch (e, stack) {
      await recordError(e, stack, information: const ["UploadListingFile"]);
      await EasyLoading.dismiss();
      await showOkAlertDialog(
        context: context,
        title: "エラー",
        message: "エラーが発生しました\n"
            "${e.message}(${e.code})",
      );
      return;
    }
    final fn = ref.read(cloudFunctionProvider(functionNameListingItems));
    await fn.call<String>(<String, String>{
      "version": listingsFileVersion,
      "filename": filename,
    });

    ref.read(stockItemListControllerProvider.notifier).setListingDate(
          selected,
          currentTimeString(),
        );

    await EasyLoading.dismiss();
    final ret = await showOkCancelAlertDialog(
      context: context,
      title: "出品登録",
      message: "Amazonへ出品登録を行いました。\n"
          "処理状況はセラーセントラルで確認できます。",
      okLabel: "閉じる",
      cancelLabel: "セラーセントラルを開く",
    );
    resetState(ref);
    if (ret == OkCancelResult.cancel) {
      // セラーセントラルを開く
      const url = "https://sellercentral.amazon.co.jp/listing/status";
      await FlutterWebBrowser.openWebPage(url: url);
    }

    final analytics = ref.read(analyticsControllerProvider);
    await analytics.logSingleEvent(amazonListingEventName);

    await requestReview(analytics);
    // ignore: avoid_catches_without_on_clauses
  } catch (e, st) {
    await recordError(e, st, information: const ["Amazon listings"]);
    await EasyLoading.dismiss();
    await showOkAlertDialog(
      context: context,
      title: "エラー",
      message: "出品に失敗しました\n"
          "${e.toString()}",
    );
  } finally {
    if (EasyLoading.isShow) {
      await EasyLoading.dismiss();
    }
  }
}
