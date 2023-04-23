import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/util.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LockIcon extends StatelessWidget {
  const LockIcon({super.key, this.width = 16});

  final double width;
  @override
  Widget build(BuildContext context) {
    return ExtendedImage.asset(
      "assets/locked_small.png",
      width: width,
    );
  }
}

class WithLockIconIfNotPaid extends ConsumerWidget {
  const WithLockIconIfNotPaid({
    super.key,
    required this.child,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  final Widget child;
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPaidUser = ref.watch(isPaidUserProvider);
    if (isPaidUser) {
      return child;
    }
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        child,
        const LockIcon(),
      ],
    );
  }
}

class KeepaLockIcon extends StatelessWidget {
  const KeepaLockIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      height: 40,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isDark(context) ? Colors.white24 : Colors.black26,
        ),
        child: const LockIcon(),
      ),
    );
  }
}

Future<void> showUnpaidDialog(BuildContext context, {String? message}) async {
  await showOkAlertDialog(
    context: context,
    title: "標準プラン専用機能",
    message: message ??
        "この機能は標準プラン専用です。\n"
            "プランについてはホームページをご覧ください。",
  );
}
