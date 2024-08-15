abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginSuccessState extends LoginStates {}

class LoginErrorState extends LoginStates {
  String errorMessage;
  LoginErrorState({required this.errorMessage});
}

class LoginLoadingState extends LoginStates {}

class ShowPasswordState extends LoginStates {}
