import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebase {
  Future<String> signIn(String email, String password);
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
}
