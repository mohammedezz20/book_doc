import 'package:book_doc/features/login/presentation/cubit/login/login_cubit.dart';
import 'package:book_doc/features/login/presentation/pages/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthState extends StatelessWidget {
  const AuthState({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
                body: Center(
              child: Text(
                  'Home Screen ${FirebaseAuth.instance.currentUser?.displayName}'),
            ));
          } else {
            return BlocProvider(
                create: (BuildContext context) => LoginCubit(),
                child: const LoginScreen());
          }
        },
      ),
    );
  }
}
