import 'package:book_doc/login/data/datasource/auth_firebase.dart';
import 'package:book_doc/login/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/di/service_locator.dart';

class AuthRepositoryImpl implements AuthRepository {
  final _authFirebase = sl.get<AuthFirebase>();
  @override
  Future<String> signIn(String email, String password) {
    return _authFirebase.signIn(email, password);
  }

  Future<UserCredential?> signInWithGoogle() {
    return _authFirebase.signInWithGoogle();
  }
}
