import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/util/version_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import 'lifecycle_manager.dart';

final updateProvider =
    FutureProvider<bool>((_) => VersionChecker().needUpdate());

class UpdateCheckObserver with LifecycleCallback {
  const UpdateCheckObserver();

  @override
  void onResumed(BuildContext context, WidgetRef ref) {
    ref.refresh(updateProvider);
  }

  @override
  void onPaused(BuildContext context, WidgetRef ref) {}

  @override
  void onInactive(BuildContext context, WidgetRef ref) {}

  @override
  void onDetached(BuildContext context, WidgetRef ref) {}
}

class Updater extends HookConsumerWidget {
  const Updater({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<bool>>(updateProvider, (value, _) {
      value?.whenData((value) {
        _showUpdateDialog(value, context);
      });
    });
    return Container();
  }

  Future<void> _showUpdateDialog(bool needUpdate, BuildContext context) async {
    if (!needUpdate) {
      return;
    }

    const title = "バージョン更新のお知らせ";
    const message = "新しいバージョンが利用可能です。"
        "更新した上で再度アプリを起動してください。";

    final result = await showOkCancelAlertDialog(
      context: context,
      barrierDismissible: false,
      title: title,
      message: message,
      cancelLabel: "アプリを終了",
      okLabel: "ストアを開く",
    );

    if (Platform.isAndroid) {
      if (result == OkCancelResult.ok) {
        await launch(
          "https://play.google.com/store/apps/details?id=com.knzc.app.amasearch",
        );
      }
      await SystemNavigator.pop(animated: true);
    } else {
      if (result == OkCancelResult.ok) {
        await launch("https://apps.apple.com/jp/app/id1608782445");
      }
      exit(0);
    }
  }
}
