import 'package:book_doc/login/domain/usecases/auth_usecase.dart';
import 'package:book_doc/login/presentation/cubit/login_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/service_locator.dart';

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
    String response = await _authUseCase.signIn(
        emailController.text, passwordController.text);
    if (response == 'success') {
      emit(LoginSuccessState());
    } else {
      emit(LoginErrorState(errorMessage: 'wrong password or email'));
    }
  }
}
