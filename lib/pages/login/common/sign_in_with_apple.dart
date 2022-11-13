import 'package:firebase_auth/firebase_auth.dart';

Future<UserCredential?> signInWithApple(FirebaseAuth auth) async {
  final appleProvider = AppleAuthProvider()
    ..addScope("email")
    ..addScope("name");

  final result = await auth.signInWithProvider(appleProvider);
  return result;
}
