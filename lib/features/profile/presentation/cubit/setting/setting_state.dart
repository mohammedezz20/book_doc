abstract class SettingStates {}

final class SettingInitialState extends SettingStates {}

final class SettingLoadingState extends SettingStates {}

final class SignOutSuccessState extends SettingStates {}

final class SignOutErrorState extends SettingStates {
  final String errorMessage;

  SignOutErrorState({required this.errorMessage});
}
