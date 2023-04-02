import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/error_report.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SubscriptionStatus extends ConsumerWidget {
  const SubscriptionStatus({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final claimsAsync = ref.watch(currentPlanProvider);
    return claimsAsync.when(
      loading: () => const Text(""),
      error: (error, stackTrace) {
        recordError(
          error,
          stackTrace,
          information: const [
            "SubscriptionStatus.currentSubscriptionPlanProvider when"
          ],
        );
        return const Text("エラー: 状態を取得できませんでした");
      },
      data: (plan) {
        return Text(plan);
      },
    );
  }
}
