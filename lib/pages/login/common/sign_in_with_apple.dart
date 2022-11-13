import 'package:firebase_auth/firebase_auth.dart';

Future<UserCredential?> signInWithApple(FirebaseAuth auth) async {
  final appleProvider = AppleAuthProvider()
    ..addScope("email")
    ..addScope("name");

  try {
    final result = await auth.signInWithProvider(appleProvider);
    return result;
  } on FirebaseAuthException catch (e) {
    if (e.code == "unknown") {
      // キャンセルした場合、unknown になる
      return null;
    }
    rethrow;
  }
}
