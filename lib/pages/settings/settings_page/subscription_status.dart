import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/error_report.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SubscriptionStatus extends ConsumerWidget {
  const SubscriptionStatus({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final claimsAsync = ref.watch(currentClaimsProvider);
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
      data: (claims) {
        if (claims == null) {
          return const Text("無料プラン");
        }
        final dynamic plan = claims[customClaimsPlanKey];
        final dynamic trialDue = claims[customClaimsTrialDueKey];
        if (plan is String && trialDue is int) {
          return Text(_getPlanName(plan, trialDue));
        }
        return const Text("無料プラン");
      },
    );
  }

  static String _getPlanName(String raw, int due) {
    switch (raw) {
      case "trial":
        final d = DateTime.fromMillisecondsSinceEpoch(due * 1000, isUtc: true)
            .toLocal();
        return "トライアルプラン(${d.month}/${d.day}まで)";
      case "standard":
        return "通常プラン";
      case "campaign":
        return "キャンペーンプラン";

      default:
        return "無料プラン";
    }
  }
}
