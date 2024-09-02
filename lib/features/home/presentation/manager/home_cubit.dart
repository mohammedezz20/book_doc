import 'package:book_doc/features/home/domain/use_cases/home_useCases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/service_locator.dart';
import '../../domain/entities/doctor.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  var homeUseCases = sl.get<HomeUseCases>();
  List<Doctor> doctorsList = [];

  getDoctors() async {
    emit(HomeLoadingState());
    var response = await homeUseCases.getDoctors();
    response.fold((l) {
      emit(GetDoctorsErrorState(error: l));
    }, (r) {
      doctorsList = r;
      emit(GetDoctorsSuccessState());
    });
  }
}
