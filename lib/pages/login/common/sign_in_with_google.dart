import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<UserCredential?> signInWithGoogle(FirebaseAuth auth) async {
  final googleUser = await GoogleSignIn().signIn();
  if (googleUser == null) {
    return null;
  }

  final googleAuth = await googleUser.authentication;

  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  final result = await auth.signInWithCredential(credential);
  return result;
}
