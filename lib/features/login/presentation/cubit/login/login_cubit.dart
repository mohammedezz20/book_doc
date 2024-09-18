import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/service_locator.dart';
import '../../../domain/usecases/auth_usecase.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  final _authUseCase = sl.get<AuthUseCase>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isObscure = true;
  void showPassword() {
    isObscure = !isObscure;
    emit(ShowPasswordState());
  }

  Future<void> login() async {
    emit(LoginLoadingState());
    if (formKey.currentState!.validate()) {
      String response = await _authUseCase.signIn(
          emailController.text, passwordController.text);
      if (response == 'success') {
        emit(LoginSuccessState());
      } else {
        emit(LoginErrorState(errorMessage: 'wrong password or email'));
      }
    } else {
      emit(LoginErrorState(errorMessage: 'Please fill in all fields'));
    }
  }

  signInWithGoogle() async {
    emit(LoginLoadingState());
    UserCredential? response = await _authUseCase.signInWithGoogle();
    if (response != null) {
      emit(LoginSuccessState());
      emailController.clear();
      passwordController.clear();
    } else {
      emit(LoginErrorState(errorMessage: 'something went wrong'));
    }
  }

  forgetPassword() async {
    emit(ForgetPasswordLoadingState());
    String response = await _authUseCase.forgetPassword(emailController.text);
    if (response == 'success') {
      emit(SubmitPasswordResetSuccessState());
    } else {
      emit(SubmitPasswordResetErrorState(errorMessage: 'Email not found'));
    }
  }
}
