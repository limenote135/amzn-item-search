import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/util/version_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final updateProvider =
    FutureProvider<bool>((_) => VersionChecker().needUpdate());

class Updater extends HookWidget {
  const Updater({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<AsyncValue<bool>>(
      provider: updateProvider,
      onChange: (context, value) {
        value.whenData((value) {
          _showUpdateDialog(value, context);
        });
      },
      child: Container(),
    );
  }

  Future<void> _showUpdateDialog(bool needUpdate, BuildContext context) async {
    if (!needUpdate) {
      return;
    }

    const title = "バージョン更新のお知らせ";
    const message = "新しいバージョンが利用可能です。"
        "更新した上で再度アプリを起動してください。";

    await showOkAlertDialog(
      context: context,
      barrierDismissible: false,
      title: title,
      message: message,
      okLabel: "アプリを終了する",
    );

    if (Platform.isAndroid) {
      await SystemNavigator.pop(animated: true);
    } else {
      exit(0);
    }
  }
}
