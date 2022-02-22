import 'package:cloud_functions/cloud_functions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final cloudFunctionProvider = Provider.family<HttpsCallable, String>(
  (_, name) => FirebaseFunctions.instanceFor(region: "asia-northeast1")
      .httpsCallable(name),
);

const functionNameDisableUser = "disable-user";
const functionNameSendSupport = "send-support";
const functionNameSendDonation = "send-donation";
