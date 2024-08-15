import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/service_locator.dart';
import '../../../domain/usecases/auth_usecase.dart';
import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  static SignUpCubit get(context) => BlocProvider.of(context);

  final _authUseCase = sl.get<AuthUseCase>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isObscure = true;

  void showPassword() {
    isObscure = !isObscure;
    emit(ShowPasswordState());
  }

  signUp() async {
    emit(SignUpLoadingState());
    final response = await _authUseCase.signUp(
        emailController.text, passwordController.text);
    response.fold(
        (error) => emit(
              SignUpErrorState(errorMessage: error),
            ), (response) {
      emit(SignUpSuccessState());
    });
  }
}
