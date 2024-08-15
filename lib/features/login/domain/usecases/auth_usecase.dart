import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/di/service_locator.dart';
import '../repository/auth_repository.dart';

class AuthUseCase {
  final _authRepository = sl.get<AuthRepository>();

  Future<String> signIn(String email, String password) {
    return _authRepository.signIn(email, password);
  }

  Future<UserCredential?> signInWithGoogle() {
    return _authRepository.signInWithGoogle();
  }

  Future<Either<String, UserCredential>> signUp(String email, String password) {
    return _authRepository.signUp(email, password);
  }
}
