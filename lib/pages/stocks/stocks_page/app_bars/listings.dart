import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/controllers/stock_item_controller.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/cloud_functions.dart';
import 'package:amasearch/util/error_report.dart';
import 'package:amasearch/util/listings.dart';
import 'package:amasearch/util/review.dart';
import 'package:amasearch/util/util.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';

import 'common.dart';

Future<void> callListings(
  BuildContext context,
  WidgetRef ref,
  List<StockItem> selected,
) async {
  final user = await ref.read(authStateChangesProvider.future);
  // 非同期関数の後に ref.read すると No ProviderScope found になる場合があるので事前に呼ぶ
  final analytics = ref.read(analyticsControllerProvider);
  final controller = ref.read(stockItemListControllerProvider.notifier);

  final isContainsAlreadyListed = selected.any((e) => e.listingDate != null);

  final size = calcSize(selected);

  var baseMsg = "${selected.length}件の商品を出品登録します";
  // 100MB 以上はメモリが足りなくなる可能性があるので警告
  if (size > 100000000) {
    baseMsg = "$baseMsg\n(画像サイズが非常に大きいため出品に時間がかかる可能性があります)";
  }

  var isOk = OkCancelResult.cancel;
  var ignoreAlreadyListings = true;

  if (!isContainsAlreadyListed) {
    isOk = await showOkCancelAlertDialog(
      context: context,
      title: "Amazonへ出品登録",
      message: baseMsg,
    );
  } else {
    (ignoreAlreadyListings, isOk) =
        await showCustomDialog(context: context, baseText: baseMsg);
  }

  if (isOk != OkCancelResult.ok) {
    return;
  }

  var targets = selected;
  if (ignoreAlreadyListings) {
    targets = targets.where((e) => e.listingDate == null).toList();
    if (targets.isEmpty) {
      await showOkAlertDialog(
        context: context,
        title: "エラー",
        message: "未出品商品がありませんでした",
      );
      return;
    }
  }

  try {
    await EasyLoading.show(status: "出品処理中...");
    final items = targets.map((e) => e.toListingItem()).toList();
    final hasImage = items.any((element) => element.images.isNotEmpty);

    final file = await createListingsFile(items);
    final filename = basename(file.path);
    final gcsPath =
        "Listings/$listingsFileVersion/Users/${user!.uid}/$filename";
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

    controller.setListingDate(
      targets,
      currentTimeString(),
    );

    await analytics.logListingsEvent(hasImage: hasImage.toString());

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
      await launchUrl(Uri.parse(url), mode: LaunchMode.inAppBrowserView);
    }

    await requestReview(analytics);
    // ignore: avoid_catches_without_on_clauses
  } catch (e, st) {
    await EasyLoading.dismiss();
    var msg = "出品に失敗しました\n$e";
    if (e is FirebaseFunctionsException && e.code == "invalid-argument") {
      msg = "出品に失敗しました\n出品アカウントが有効かどうか、手動で出品可能かご確認ください。";
    } else {
      await recordError(e, st, information: const ["Amazon listings"]);
    }
    await showOkAlertDialog(
      context: context,
      title: "エラー",
      message: msg,
    );
  } finally {
    if (EasyLoading.isShow) {
      await EasyLoading.dismiss();
    }
  }
}

int calcSize(List<StockItem> items) {
  var size = 0;
  for (final item in items) {
    for (final img in item.images) {
      final f = File(img);
      if (f.existsSync()) {
        size = size + f.lengthSync();
      }
    }
  }
  return size;
}

Future<(bool ignore, OkCancelResult result)> showCustomDialog({
  required BuildContext context,
  required String baseText,
}) async {
  final ret = await showAdaptiveDialog<(bool, OkCancelResult)>(
    context: context,
    builder: (context) => _CustomAlertDialog(baseText: baseText),
  );
  if (ret == null) {
    return (true, OkCancelResult.cancel);
  }
  return (ret.$1, ret.$2);
}

class _CustomAlertDialog extends StatefulWidget {
  const _CustomAlertDialog({required this.baseText});

  final String baseText;

  @override
  State<_CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<_CustomAlertDialog> {
  bool ignore = true;

  Widget adaptiveAction({
    required BuildContext context,
    required VoidCallback onPressed,
    required Widget child,
  }) {
    final theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return TextButton(onPressed: onPressed, child: child);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoDialogAction(onPressed: onPressed, child: child);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: const Text("出品登録"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.baseText),
          const Text("\n出品済みの商品が含まれますがよろしいですか？"),
          Row(
            children: [
              Checkbox(
                value: ignore,
                onChanged: (v) {
                  if (v != null) {
                    setState(() {
                      ignore = v;
                    });
                  }
                },
              ),
              const Text("出品済みを無視する"),
            ],
          ),
        ],
      ),
      actions: [
        adaptiveAction(
          context: context,
          onPressed: () => Navigator.pop<(bool, OkCancelResult)>(
            context,
            (ignore, OkCancelResult.cancel),
          ),
          child: const Text('キャンセル'),
        ),
        adaptiveAction(
          context: context,
          onPressed: () => Navigator.pop<(bool, OkCancelResult)>(
            context,
            (ignore, OkCancelResult.ok),
          ),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
