abstract class CompleteProfileStates {}

class CompleteProfileInitialState extends CompleteProfileStates {}

class CompleteProfileLoadingState extends CompleteProfileStates {}

class CompleteProfileSuccessState extends CompleteProfileStates {}

class CompleteProfileErrorState extends CompleteProfileStates {
  String errorMessage;

  CompleteProfileErrorState({required this.errorMessage});
}

class PickImageSuccessState extends CompleteProfileStates {}

class PickImageErrorState extends CompleteProfileStates {}

class ChangeGenderState extends CompleteProfileStates {}

class ChangePhoneNumberState extends CompleteProfileStates {}
