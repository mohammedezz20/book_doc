abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class GetDoctorsSuccessState extends HomeStates {}

class GetDoctorsErrorState extends HomeStates {
  final String error;

  GetDoctorsErrorState({required this.error});
}
