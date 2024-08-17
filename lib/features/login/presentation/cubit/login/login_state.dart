abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginSuccessState extends LoginStates {}

class LoginErrorState extends LoginStates {
  String errorMessage;
  LoginErrorState({required this.errorMessage});
}

class LoginLoadingState extends LoginStates {}

class ShowPasswordState extends LoginStates {}

class ForgetPasswordLoadingState extends LoginStates {}

class SubmitPasswordResetSuccessState extends LoginStates {}

class SubmitPasswordResetErrorState extends LoginStates {
  String errorMessage;

  SubmitPasswordResetErrorState({required this.errorMessage});
}

class VerifyCodeSuccessState extends LoginStates {}

class VerifyCodeErrorState extends LoginStates {
  String errorMessage;

  VerifyCodeErrorState({required this.errorMessage});
}
