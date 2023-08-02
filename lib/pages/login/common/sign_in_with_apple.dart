import 'package:firebase_auth/firebase_auth.dart';

Future<UserCredential?> signInWithApple() async {
  final appleProvider = AppleAuthProvider()
    ..addScope("email")
    ..addScope("name");

  try {
    final result =
        await FirebaseAuth.instance.signInWithProvider(appleProvider);
    return result;
  } on FirebaseAuthException catch (e) {
    if (e.code == "unknown") {
      // キャンセルした場合、unknown になる
      return null;
    }
    rethrow;
  }
}
