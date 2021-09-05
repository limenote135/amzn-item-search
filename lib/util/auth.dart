import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final authStateChangesProvider = StreamProvider<User?>(
    (ref) => ref.watch(firebaseAuthProvider).authStateChanges());

const customClaimsLwaKey = "lwa";

final linkedWithAmazonProvider = StreamProvider((ref) async* {
  final stream = ref.watch(firebaseAuthProvider).idTokenChanges();

  await for (final user in stream) {
    if (user == null) {
      yield null;
    } else {
      final token = await user.getIdTokenResult();
      yield token.claims?[customClaimsLwaKey] == true;
    }
  }
});
