import 'package:book_doc/login/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/di/service_locator.dart';

class AuthUseCase {
  final _authRepository = sl.get<AuthRepository>();

  Future<String> signIn(String email, String password) {
    return _authRepository.signIn(email, password);
  }

  Future<UserCredential?> signInWithGoogle() {
    return _authRepository.signInWithGoogle();
  }
}
