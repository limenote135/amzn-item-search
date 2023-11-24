import 'dart:async';

import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/util/error_report.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authStateChangesProvider = StreamProvider<User?>(
  (ref) => FirebaseAuth.instance.authStateChanges(),
);

final isPaidUserProvider = StateProvider((ref) => false);
final isBetaUserProvider = StateProvider((ref) => false);

const customClaimsLwaKey = "lwa";
const customClaimsPlanKey = "pl";
const customClaimsTrialDueKey = "td";
const customClaimsBetaUserKey = "beta";

enum PlanType {
  free,
  trial,
  standard,
  campaign,
  suspended;

  factory PlanType.fromName(String name) {
    switch (name) {
      case "free":
        return PlanType.free;
      case "trial":
        return PlanType.trial;
      case "standard":
        return PlanType.standard;
      case "campaign":
        return PlanType.campaign;
      case "suspended":
        return PlanType.suspended;
    }
    return PlanType.free;
  }

  bool isPaidPlan() {
    switch (this) {
      case PlanType.free:
      case PlanType.suspended:
        return false;
      case PlanType.trial:
      case PlanType.standard:
      case PlanType.campaign:
        return true;
    }
  }
}

final linkedWithAmazonProvider = FutureProvider((ref) async {
  final lwa = await ref.watch(
    currentClaimsProvider.selectAsync((claims) {
      if (claims == null) {
        return false;
      }
      return claims[customClaimsLwaKey] == true;
    }),
  );
  return lwa;
});

final currentClaimsProvider = StreamProvider((ref) async* {
  try {
    final stream = FirebaseAuth.instance.idTokenChanges();

    await for (final user in stream) {
      if (user == null) {
        yield null;
      } else {
        final token = await user.getIdTokenResult();
        final inReview = await ref.watch(inReviewProvider.future);
        final dynamic plan = token.claims?[customClaimsPlanKey];
        final dynamic lwa = token.claims?[customClaimsLwaKey];
        final dynamic beta = token.claims?[customClaimsBetaUserKey];

        if (beta == true) {
          ref.read(isBetaUserProvider.notifier).state = true;
        }
        if (lwa != true && inReview) {
          // レビュー期間中、未連携ユーザーに鍵マークや有料プランへの案内しないようにする
          ref.read(isPaidUserProvider.notifier).state = true;
          unawaited(
            ref.read(analyticsControllerProvider).setUserProp("plan", "none"),
          );
        } else {
          if (plan != null &&
              plan is String &&
              PlanType.fromName(plan).isPaidPlan()) {
            // トライアル、標準、キャンペーンの場合
            ref.read(isPaidUserProvider.notifier).state = true;
            unawaited(
              ref.read(analyticsControllerProvider).setUserProp("plan", plan),
            );
          } else {
            ref.read(isPaidUserProvider.notifier).state = false;
            unawaited(
              ref.read(analyticsControllerProvider).setUserProp("plan", "free"),
            );
          }
        }
        yield token.claims;
      }
    }
  } on FirebaseAuthException catch (e, stack) {
    switch (e.code) {
      case "network-request-failed":
        throw Exception("通信環境の良いところで再度お試しください");
      case "user-token-expired":
        throw Exception("再ログインしてください");
      default:
        await recordError(e, stack);
        throw Exception("通信環境の良いところで再度お試しください(${e.code})");
    }
  }
});

final currentPlanProvider = FutureProvider((ref) async {
  final claims = await ref.watch(
    currentClaimsProvider.selectAsync((claims) {
      if (claims == null) {
        return "フリープラン";
      }
      final dynamic plan = claims[customClaimsPlanKey];
      final dynamic trialDue = claims[customClaimsTrialDueKey];
      if (plan is String && trialDue is int) {
        return _getPlanName(plan, trialDue);
      }
      return "フリープラン";
    }),
  );
  return claims;
});

String _getPlanName(String raw, int due) {
  switch (PlanType.fromName(raw)) {
    case PlanType.free:
      return "無料プラン";
    case PlanType.trial:
      final d = DateTime.fromMillisecondsSinceEpoch(due * 1000, isUtc: true)
          .toLocal();
      return "トライアルプラン(${d.month}/${d.day}まで)";
    case PlanType.standard:
      return "標準プラン";
    case PlanType.campaign:
      return "キャンペーンプラン";
    case PlanType.suspended:
      return "無料プラン(停止中)";
  }
}

final showPlanProvider = FutureProvider((ref) async {
  final showPlan = await ref.watch(
    currentClaimsProvider.selectAsync((claims) {
      if (claims == null) {
        return false;
      }
      final dynamic lwa = claims[customClaimsLwaKey];
      final dynamic isReview = claims["isReview"];
      return isReview != true && lwa == true;
    }),
  );
  return showPlan;
});

const _configNameInReview = "review";
final inReviewProvider = FutureProvider<bool>((_) async {
  final remoteConfig = FirebaseRemoteConfig.instance;
  try {
    final defaultValues = <String, dynamic>{
      _configNameInReview: "false",
    };
    await remoteConfig.setDefaults(defaultValues);
    await remoteConfig.fetchAndActivate();
    final info = remoteConfig.getBool(_configNameInReview);

    return info;
    // ignore: avoid_catches_without_on_clauses
  } catch (e) {
    // DO NOTHING
  }
  return false;
});
