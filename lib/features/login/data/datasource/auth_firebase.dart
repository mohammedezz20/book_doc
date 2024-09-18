import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthFirebase {
  Future<String> signIn(String email, String password);

  Future<UserCredential?> signInWithGoogle();

  Future<Either<String, UserCredential>> signUp(String email, String password);

  Future<String> forgetPassword(String email);
}

class AuthFirebaseImpl implements AuthFirebase {
  @override
  Future<String> signIn(String email, String password) async {
    String message = '';
    try {
      await FirebaseAuth.instance
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
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        log(googleUser.toString());
        return null;
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
          await auth.signInWithCredential(credential);
      return userCredential;
    } catch (e) {
      log("Error signing in with Google: $e");
      return null;
    }
  }

  @override
  Future<Either<String, UserCredential>> signUp(
      String email, String password) async {
    String message = '';
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
        message = 'weak-password';
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
        message = 'email-already-in-use';
      }
    }
    return Left(message);
  }

  @override
  Future<String> forgetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
      );
      return 'success';
    } catch (e) {
      log('Error sending password reset email: $e');
      return 'error';
    }
  }

  static Future<bool> checkIfUidExists(String uid) async {
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');
    DocumentSnapshot userDoc = await usersCollection.doc(uid).get();

    if (userDoc.exists) {
      return true;
    } else {
      return false;
    }
  }
}
