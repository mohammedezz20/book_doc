import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/di/service_locator.dart';
import '../../domain/repository/auth_repository.dart';
import '../datasource/auth_firebase.dart';

class AuthRepositoryImpl implements AuthRepository {
  final _authFirebase = sl.get<AuthFirebase>();
  @override
  Future<String> signIn(String email, String password) {
    return _authFirebase.signIn(email, password);
  }

  @override
  Future<UserCredential?> signInWithGoogle() {
    return _authFirebase.signInWithGoogle();
  }

  @override
  Future<Either<String, UserCredential>> signUp(String email, String password) {
    return _authFirebase.signUp(email, password);
  }
}
