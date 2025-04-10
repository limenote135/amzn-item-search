import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/error_report.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AmazonStatus extends ConsumerWidget {
  const AmazonStatus({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(linkedWithAmazonProvider);
    return user.when(
      loading: () => const Text(""),
      error: (error, stackTrace) {
        recordError(
          error,
          stackTrace,
          information: const ["AmazonStatus.linkedWithAmazonProvider when"],
        );
        return const Text("エラー: 状態を取得できませんでした");
      },
      data: (value) {
        if (value) {
          return const Text("連携済み");
        }
        return const Text("未連携");
      },
    );
  }
}
