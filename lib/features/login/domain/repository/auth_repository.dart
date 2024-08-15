import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<String> signIn(String email, String password);
  Future<UserCredential?> signInWithGoogle();

  Future<Either<String, UserCredential>> signUp(String email, String password);
}
