import 'package:book_doc/features/app-layout/presentation/pages/layout_providers.dart';
import 'package:book_doc/features/login/presentation/pages/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthState extends StatelessWidget {
  const AuthState({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const LayoutProviders();
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
