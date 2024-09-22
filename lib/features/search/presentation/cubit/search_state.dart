class SearchStates {}

final class SearchInitialState extends SearchStates {}

final class SearchLoadingState extends SearchStates {}

final class SearchSuccessState extends SearchStates {}

final class SearchErrorState extends SearchStates {
  final String error;

  SearchErrorState({required this.error});
}
