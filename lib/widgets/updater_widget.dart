import 'dart:io';

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

  void _showUpdateDialog(bool needUpdate) {
    if (!needUpdate) {
      return;
    }

    const title = "バージョン更新のお知らせ";
    const message = "新しいバージョンが利用可能です。"
        "更新した上で再度アプリを起動してください。";

    showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: const Text(title),
              content: const Text(message),
              actions: [
                TextButton(
                  onPressed: () {
                    if (Platform.isAndroid) {
                      SystemNavigator.pop(animated: true);
                    } else {
                      exit(0);
                    }
                  },
                  child: const Text(
                    "アプリを終了する",
                    style: TextStyle(color: Colors.red),
                  ),
                )
              ],
            ),
          );
        });
  }
}
