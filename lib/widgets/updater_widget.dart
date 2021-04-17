import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/util/version_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Updater extends StatefulWidget {
  @override
  _UpdaterState createState() => _UpdaterState();
}

class _UpdaterState extends State<Updater> {
  @override
  void initState() {
    VersionChecker().needUpdate().then(_showUpdateDialog);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<void> _showUpdateDialog(bool needUpdate) async {
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
      message:message,
      okLabel: "アプリを終了する",
    );

    if (Platform.isAndroid) {
      SystemNavigator.pop(animated: true);
    } else {
      exit(0);
    }
  }
}
