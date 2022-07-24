import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/util/release_notes.dart';
import 'package:amasearch/util/version_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:release_notes_dialog/release_notes_dialog.dart';
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
    ref.listen<AsyncValue<bool>>(updateProvider, (_, value) {
      value.whenData((needUpdate) {
        _showUpdateDialog(needUpdate, context);
        if (!needUpdate) {
          _showReleaseNoteDialog(context);
        }
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
        await launchUrl(
          Uri.parse(
            "https://play.google.com/store/apps/details?id=com.knzc.app.amasearch",
          ),
        );
      }
      await SystemNavigator.pop(animated: true);
    } else {
      if (result == OkCancelResult.ok) {
        await launchUrl(
          Uri.parse(
            "https://apps.apple.com/jp/app/id1608782445",
          ),
        );
      }
      exit(0);
    }
  }

  Future<void> _showReleaseNoteDialog(BuildContext context) async {
    final notes = await getReleaseNotes();
    if (notes == null) {
      return;
    }
    await Future<void>.delayed(const Duration(milliseconds: 500));
    await showDialog<void>(
      context: context,
      builder: (context) => ReleaseNotesDialog(
        title: "アプリが更新されました！",
        closeButtonString: "OK",
        releases: notes,
      ),
    );
  }
}
