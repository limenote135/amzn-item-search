import 'package:amasearch/util/error_report.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final authStateChangesProvider = StreamProvider<User?>(
  (ref) => ref.watch(firebaseAuthProvider).authStateChanges(),
);

const customClaimsLwaKey = "lwa";

final linkedWithAmazonProvider = StreamProvider((ref) async* {
  try {
    final stream = ref.watch(firebaseAuthProvider).idTokenChanges();

    await for (final user in stream) {
      if (user == null) {
        yield null;
      } else {
        final token = await user.getIdTokenResult();
        yield token.claims?[customClaimsLwaKey] == true;
      }
    }
  } on FirebaseAuthException catch (e, stack) {
    switch (e.code) {
      case "network-request-failed":
        break;
      case "user-token-expired":
        throw Exception("再ログインしてください");
      default:
        await recordError(e, stack);
        break;
    }
    throw Exception("通信環境の良いところで再度お試しください");
  }
});
