import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthFirebase {
  Future<String> signIn(String email, String password);

  Future<UserCredential?> signInWithGoogle();
}

class AuthFirebaseImpl implements AuthFirebase {
  @override
  Future<String> signIn(String email, String password) async {
    String message = '';
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      message = 'success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
        message = 'error.';
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
        message = 'error';
      }
    }
    return message;
  }

  @override
  Future<UserCredential?> signInWithGoogle() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      // Trigger the Google Sign-In flow
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return null;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credentials
      final UserCredential userCredential =
          await auth.signInWithCredential(credential);

      // Return the signed-in user
      return userCredential;
    } catch (e) {
      print("Error signing in with Google: $e");
      return null;
    }
  }
}
