abstract class SignUpStates {}

class SignUpInitialState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {}

class SignUpErrorState extends SignUpStates {
  String errorMessage;

  SignUpErrorState({required this.errorMessage});
}

class SignUpLoadingState extends SignUpStates {}

class ShowPasswordState extends SignUpStates {}
