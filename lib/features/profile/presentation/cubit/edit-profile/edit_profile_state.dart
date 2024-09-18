abstract class EditProfileStates {}

class EditProfileInitialState extends EditProfileStates {}

class EditProfileLoadingState extends EditProfileStates {}

class ShowPasswordState extends EditProfileStates {}

class PickImageSuccessState extends EditProfileStates {}

class PickImageErrorState extends EditProfileStates {}

class ChangePhoneNumberState extends EditProfileStates {}

class EditProfileSuccessState extends EditProfileStates {}

class EditProfileErrorState extends EditProfileStates {
  final String errorMessage;

  EditProfileErrorState({required this.errorMessage});
}

class GetUserDataSuccessState extends EditProfileStates {}

class GetUserDataErrorState extends EditProfileStates {
  final String errorMessage;

  GetUserDataErrorState({required this.errorMessage});
}
