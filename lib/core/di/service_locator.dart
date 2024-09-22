import 'package:book_doc/features/home/data/data_sources/home_firebase.dart';
import 'package:book_doc/features/home/data/repositories/home_repository_impl.dart';
import 'package:book_doc/features/home/domain/repositories/home_repository.dart';
import 'package:book_doc/features/home/domain/use_cases/home_useCases.dart';
import 'package:book_doc/features/login/presentation/cubit/signup/sign_up_cubit.dart';
import 'package:book_doc/features/profile/domain/use_cases/profile_usecase.dart';
import 'package:book_doc/features/profile/presentation/cubit/complete_profile/complete_profile_cubit.dart';
import 'package:book_doc/features/search/data/data_sources/search_firebase.dart';
import 'package:book_doc/features/search/domain/repositories/search_repository.dart';
import 'package:book_doc/features/search/domain/use_cases/search_useCase.dart';
import 'package:book_doc/features/search/presentation/cubit/search_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/appointments/data/data_sources/appointment_firebase.dart';
import '../../features/appointments/data/repositories/appointment_repository_impl.dart';
import '../../features/appointments/domain/repositories/appointment_repository.dart';
import '../../features/appointments/domain/use_cases/appointment_useCases.dart';
import '../../features/appointments/presentation/cubit/appointment/appointment_cubit.dart';
import '../../features/home/presentation/cubit/home/home_cubit.dart';
import '../../features/login/data/datasource/auth_firebase.dart';
import '../../features/login/data/repository/auth_repository_impl.dart';
import '../../features/login/domain/repository/auth_repository.dart';
import '../../features/login/domain/usecases/auth_usecase.dart';
import '../../features/login/presentation/cubit/login/login_cubit.dart';
import '../../features/profile/data/data_sources/profile_firebase.dart';
import '../../features/profile/data/repositories/profile_repository_impl.dart';
import '../../features/profile/domain/repositories/profile_repository.dart';
import '../../features/search/data/repositories/search_repo_impl.dart';

var sl = GetIt.instance;

void setUpServiceLocator() {
  //! Authentication
  sl.registerLazySingleton<AuthFirebase>(() => AuthFirebaseImpl());
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  sl.registerFactory(() => AuthUseCase());
  sl.registerFactory(() => LoginCubit());
  sl.registerFactory(() => SignUpCubit());

  //! Profile
  sl.registerLazySingleton<ProfileFirebase>(() => ProfileFirebaseImpl());
  sl.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl());
  sl.registerFactory(() => ProfileUseCases());
  sl.registerFactory(() => CompleteProfileCubit());

  //! Home
  sl.registerLazySingleton<HomeFirebase>(() => HomeFirebaseImpl());
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl());
  sl.registerFactory(() => HomeUseCases());
  sl.registerFactory(() => HomeCubit());

  //! Appointment
  sl.registerLazySingleton<AppointmentFirebase>(
      () => AppointmentFirebaseImpl());
  sl.registerLazySingleton<AppointmentRepository>(
      () => AppointmentRepositoryImpl());
  sl.registerFactory(() => AppointmentUseCases());
  sl.registerFactory(() => AppointmentCubit());

  //! Search
  sl.registerLazySingleton<SearchFirebase>(() => SearchFirebaseImpl());
  sl.registerLazySingleton<SearchRepository>(() => SearchRepositoryImpl());
  sl.registerFactory(() => SearchUseCases());
  sl.registerFactory(() => SearchCubit());
}
