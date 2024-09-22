import 'package:book_doc/features/search/presentation/cubit/search_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/service_locator.dart';
import '../../../home/domain/entities/doctor.dart';
import '../../domain/use_cases/search_useCase.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);
  final _searchUseCase = sl.get<SearchUseCases>();

  var searchController = TextEditingController();
  List<Doctor> searchResults = [];

  Future<void> search() async {
    emit(SearchLoadingState());
    var response = await _searchUseCase.searchForDoctors(searchController.text);
    response.fold((l) {
      emit(SearchErrorState(error: l));
    }, (r) {
      searchResults = r;
      emit(SearchSuccessState());
    });
  }
}
